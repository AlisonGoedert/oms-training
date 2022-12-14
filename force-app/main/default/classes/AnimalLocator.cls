public class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results);
            // Cast the values in the 'animals' key as a list
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            String name = (String) animal.get('name');
            System.debug('Received the following animals:');
            System.debug(name);
            return name;
    }        
}