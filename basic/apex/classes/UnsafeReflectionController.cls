public with sharing class UnsafeReflectionController {
    public String requestLabel;
    public String result {get;set;}
    private static final String LONG_RUNNING_SERVICE_URL = 'https://example.herokuapp.com';

    // Action method
    public Object startRequest() {
        // Create continuation with a timeout
        Continuation con = new Continuation(40);

        Map<String,String> params = ApexPages.currentPage().getParameters();

        // Set callback method
        if (params.containsKey('contMethod')) {
            //[RuleTest] Unsafe Reflection
            con.continuationMethod=params.get('contMethod');
        } else {
            con.continuationMethod='processResponse';
        }

        // Create callout request
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(LONG_RUNNING_SERVICE_URL);
        this.requestLabel = con.addHttpRequest(req);
        return con;
    }

    // Callback method
    public Object processResponse() {
        Map<String,String> params = ApexPages.currentPage().getParameters();

        // Get the response by using the unique label
        HttpResponse response = Continuation.getResponse(this.requestLabel);
        // Set the result variable that is displayed on the Visualforce page
        this.result = response.getBody();

        return null;
    }

    public Object foo() {
        this.result = 'forbidden path';
        return null;
    }
}