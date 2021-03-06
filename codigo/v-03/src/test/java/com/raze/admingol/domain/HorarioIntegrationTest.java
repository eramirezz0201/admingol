package com.raze.admingol.domain;
import com.raze.admingol.repository.domain.HorarioRepository;
import com.raze.admingol.service.domain.HorarioService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@Configurable
public class HorarioIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    HorarioDataOnDemand dod;

	@Autowired
    HorarioService horarioService;

	@Autowired
    HorarioRepository horarioRepository;

	@Test
    public void testCountAllHorarios() {
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", dod.getRandomHorario());
        long count = horarioService.countAllHorarios();
        Assert.assertTrue("Counter for 'Horario' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindHorario() {
        Horario obj = dod.getRandomHorario();
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Horario' failed to provide an identifier", id);
        obj = horarioService.findHorario(id);
        Assert.assertNotNull("Find method for 'Horario' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Horario' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllHorarios() {
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", dod.getRandomHorario());
        long count = horarioService.countAllHorarios();
        Assert.assertTrue("Too expensive to perform a find all test for 'Horario', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Horario> result = horarioService.findAllHorarios();
        Assert.assertNotNull("Find all method for 'Horario' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Horario' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindHorarioEntries() {
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", dod.getRandomHorario());
        long count = horarioService.countAllHorarios();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Horario> result = horarioService.findHorarioEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Horario' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Horario' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        Horario obj = dod.getRandomHorario();
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Horario' failed to provide an identifier", id);
        obj = horarioService.findHorario(id);
        Assert.assertNotNull("Find method for 'Horario' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyHorario(obj);
        Integer currentVersion = obj.getVersion();
        horarioRepository.flush();
        Assert.assertTrue("Version for 'Horario' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdateHorarioUpdate() {
        Horario obj = dod.getRandomHorario();
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Horario' failed to provide an identifier", id);
        obj = horarioService.findHorario(id);
        boolean modified =  dod.modifyHorario(obj);
        Integer currentVersion = obj.getVersion();
        Horario merged = horarioService.updateHorario(obj);
        horarioRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Horario' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSaveHorario() {
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", dod.getRandomHorario());
        Horario obj = dod.getNewTransientHorario(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Horario' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Horario' identifier to be null", obj.getId());
        try {
            horarioService.saveHorario(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        horarioRepository.flush();
        Assert.assertNotNull("Expected 'Horario' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteHorario() {
        Horario obj = dod.getRandomHorario();
        Assert.assertNotNull("Data on demand for 'Horario' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Horario' failed to provide an identifier", id);
        obj = horarioService.findHorario(id);
        horarioService.deleteHorario(obj);
        horarioRepository.flush();
        Assert.assertNull("Failed to remove 'Horario' with identifier '" + id + "'", horarioService.findHorario(id));
    }
}
