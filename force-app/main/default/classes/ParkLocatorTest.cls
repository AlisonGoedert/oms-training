@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String x = 'teste';
        List<String> result = ParkLocator.country(x);
        // Verify that a fake result is returned
        List<String> teste = new List<String>();
        teste.add('test1');
        System.assertEquals(teste, result); 
    }
}