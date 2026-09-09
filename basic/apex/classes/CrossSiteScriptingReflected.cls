@RestResource(urlMapping='/TestRestReflected/*')
global with sharing class CrossSiteScriptingReflected {

    @HttpGet
    global static String testGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
		Map<String, String> reqParams = req.params;

        res.responseBody = Blob.valueOf(reqParams.get('value'));
		
		return null;
    }
}