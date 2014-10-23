// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.ConfiguracionTorneo;
import com.raze.admingol.domain.ConfiguracionTorneoDataOnDemand;
import com.raze.admingol.domain.ConfiguracionTorneoIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ConfiguracionTorneoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ConfiguracionTorneoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ConfiguracionTorneoIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ConfiguracionTorneoIntegrationTest: @Transactional;
    
    @Autowired
    ConfiguracionTorneoDataOnDemand ConfiguracionTorneoIntegrationTest.dod;
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testCountConfiguracionTorneos() {
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", dod.getRandomConfiguracionTorneo());
        long count = ConfiguracionTorneo.countConfiguracionTorneos();
        Assert.assertTrue("Counter for 'ConfiguracionTorneo' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testFindConfiguracionTorneo() {
        ConfiguracionTorneo obj = dod.getRandomConfiguracionTorneo();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to provide an identifier", id);
        obj = ConfiguracionTorneo.findConfiguracionTorneo(id);
        Assert.assertNotNull("Find method for 'ConfiguracionTorneo' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ConfiguracionTorneo' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testFindAllConfiguracionTorneos() {
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", dod.getRandomConfiguracionTorneo());
        long count = ConfiguracionTorneo.countConfiguracionTorneos();
        Assert.assertTrue("Too expensive to perform a find all test for 'ConfiguracionTorneo', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ConfiguracionTorneo> result = ConfiguracionTorneo.findAllConfiguracionTorneos();
        Assert.assertNotNull("Find all method for 'ConfiguracionTorneo' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ConfiguracionTorneo' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testFindConfiguracionTorneoEntries() {
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", dod.getRandomConfiguracionTorneo());
        long count = ConfiguracionTorneo.countConfiguracionTorneos();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ConfiguracionTorneo> result = ConfiguracionTorneo.findConfiguracionTorneoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ConfiguracionTorneo' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ConfiguracionTorneo' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testFlush() {
        ConfiguracionTorneo obj = dod.getRandomConfiguracionTorneo();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to provide an identifier", id);
        obj = ConfiguracionTorneo.findConfiguracionTorneo(id);
        Assert.assertNotNull("Find method for 'ConfiguracionTorneo' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyConfiguracionTorneo(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ConfiguracionTorneo' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testMergeUpdate() {
        ConfiguracionTorneo obj = dod.getRandomConfiguracionTorneo();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to provide an identifier", id);
        obj = ConfiguracionTorneo.findConfiguracionTorneo(id);
        boolean modified =  dod.modifyConfiguracionTorneo(obj);
        Integer currentVersion = obj.getVersion();
        ConfiguracionTorneo merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ConfiguracionTorneo' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", dod.getRandomConfiguracionTorneo());
        ConfiguracionTorneo obj = dod.getNewTransientConfiguracionTorneo(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ConfiguracionTorneo' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'ConfiguracionTorneo' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ConfiguracionTorneoIntegrationTest.testRemove() {
        ConfiguracionTorneo obj = dod.getRandomConfiguracionTorneo();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfiguracionTorneo' failed to provide an identifier", id);
        obj = ConfiguracionTorneo.findConfiguracionTorneo(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ConfiguracionTorneo' with identifier '" + id + "'", ConfiguracionTorneo.findConfiguracionTorneo(id));
    }
    
}
