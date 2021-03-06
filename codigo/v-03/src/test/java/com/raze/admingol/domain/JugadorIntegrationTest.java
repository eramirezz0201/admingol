package com.raze.admingol.domain;
import com.raze.admingol.repository.domain.JugadorRepository;
import com.raze.admingol.service.domain.JugadorService;
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
public class JugadorIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    JugadorDataOnDemand dod;

	@Autowired
    JugadorService jugadorService;

	@Autowired
    JugadorRepository jugadorRepository;

	@Test
    public void testCountAllJugadors() {
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", dod.getRandomJugador());
        long count = jugadorService.countAllJugadors();
        Assert.assertTrue("Counter for 'Jugador' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindJugador() {
        Jugador obj = dod.getRandomJugador();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to provide an identifier", id);
        obj = jugadorService.findJugador(id);
        Assert.assertNotNull("Find method for 'Jugador' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Jugador' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllJugadors() {
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", dod.getRandomJugador());
        long count = jugadorService.countAllJugadors();
        Assert.assertTrue("Too expensive to perform a find all test for 'Jugador', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Jugador> result = jugadorService.findAllJugadors();
        Assert.assertNotNull("Find all method for 'Jugador' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Jugador' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindJugadorEntries() {
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", dod.getRandomJugador());
        long count = jugadorService.countAllJugadors();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Jugador> result = jugadorService.findJugadorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Jugador' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Jugador' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        Jugador obj = dod.getRandomJugador();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to provide an identifier", id);
        obj = jugadorService.findJugador(id);
        Assert.assertNotNull("Find method for 'Jugador' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyJugador(obj);
        Integer currentVersion = obj.getVersion();
        jugadorRepository.flush();
        Assert.assertTrue("Version for 'Jugador' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdateJugadorUpdate() {
        Jugador obj = dod.getRandomJugador();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to provide an identifier", id);
        obj = jugadorService.findJugador(id);
        boolean modified =  dod.modifyJugador(obj);
        Integer currentVersion = obj.getVersion();
        Jugador merged = jugadorService.updateJugador(obj);
        jugadorRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Jugador' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSaveJugador() {
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", dod.getRandomJugador());
        Jugador obj = dod.getNewTransientJugador(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Jugador' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Jugador' identifier to be null", obj.getId());
        try {
            jugadorService.saveJugador(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        jugadorRepository.flush();
        Assert.assertNotNull("Expected 'Jugador' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteJugador() {
        Jugador obj = dod.getRandomJugador();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Jugador' failed to provide an identifier", id);
        obj = jugadorService.findJugador(id);
        jugadorService.deleteJugador(obj);
        jugadorRepository.flush();
        Assert.assertNull("Failed to remove 'Jugador' with identifier '" + id + "'", jugadorService.findJugador(id));
    }
}
