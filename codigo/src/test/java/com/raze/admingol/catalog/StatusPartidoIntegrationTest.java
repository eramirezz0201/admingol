package com.raze.admingol.catalog;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.test.RooIntegrationTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@Configurable
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@RooIntegrationTest(entity = StatusPartido.class)
public class StatusPartidoIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    StatusPartidoDataOnDemand dod;

	@Test
    public void testCountStatusPartidoes() {
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", dod.getRandomStatusPartido());
        long count = StatusPartido.countStatusPartidoes();
        Assert.assertTrue("Counter for 'StatusPartido' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindStatusPartido() {
        StatusPartido obj = dod.getRandomStatusPartido();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to provide an identifier", id);
        obj = StatusPartido.findStatusPartido(id);
        Assert.assertNotNull("Find method for 'StatusPartido' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'StatusPartido' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllStatusPartidoes() {
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", dod.getRandomStatusPartido());
        long count = StatusPartido.countStatusPartidoes();
        Assert.assertTrue("Too expensive to perform a find all test for 'StatusPartido', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<StatusPartido> result = StatusPartido.findAllStatusPartidoes();
        Assert.assertNotNull("Find all method for 'StatusPartido' illegally returned null", result);
        Assert.assertTrue("Find all method for 'StatusPartido' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindStatusPartidoEntries() {
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", dod.getRandomStatusPartido());
        long count = StatusPartido.countStatusPartidoes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<StatusPartido> result = StatusPartido.findStatusPartidoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'StatusPartido' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'StatusPartido' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        StatusPartido obj = dod.getRandomStatusPartido();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to provide an identifier", id);
        obj = StatusPartido.findStatusPartido(id);
        Assert.assertNotNull("Find method for 'StatusPartido' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyStatusPartido(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'StatusPartido' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testMergeUpdate() {
        StatusPartido obj = dod.getRandomStatusPartido();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to provide an identifier", id);
        obj = StatusPartido.findStatusPartido(id);
        boolean modified =  dod.modifyStatusPartido(obj);
        Integer currentVersion = obj.getVersion();
        StatusPartido merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'StatusPartido' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testPersist() {
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", dod.getRandomStatusPartido());
        StatusPartido obj = dod.getNewTransientStatusPartido(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'StatusPartido' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'StatusPartido' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testRemove() {
        StatusPartido obj = dod.getRandomStatusPartido();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatusPartido' failed to provide an identifier", id);
        obj = StatusPartido.findStatusPartido(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'StatusPartido' with identifier '" + id + "'", StatusPartido.findStatusPartido(id));
    }
}
