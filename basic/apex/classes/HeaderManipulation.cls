@RestResource(urlMapping='/TestHeaderManipulation/*')
global with sharing class HeaderManipulation {

    @HttpGet
    global static String testGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
		Map<String, String> reqParams = req.params;
        Map<String, String> reqHeaders = req.headers;

        res.addHeader('h0', reqHeaders.get('h0'));
		
		return null;
    }
}