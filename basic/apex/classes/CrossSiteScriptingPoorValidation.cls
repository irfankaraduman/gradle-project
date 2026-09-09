@RestResource(urlMapping='/TestRestPoorValidation/*')
global with sharing class CrossSiteScriptingPoorValidation {

    @HttpGet
    global static String testGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
		Map<String, String> reqParams = req.params;

        res.responseBody = Blob.valueOf(reqParams.get('value').escapeHtml3());
		
		return null;
    }
}