@RestResource(urlMapping='/TestRestPersistent/*')
global with sharing class CrossSiteScriptingPersistent {

    @HttpGet
    global static String testGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
		Map<String, String> reqParams = req.params;

        Account acc = [SELECT Name FROM Account WHERE Id=:reqParams.get('id')];

        res.responseBody = Blob.valueOf(acc.Name);
		
		return res.toString();
    }
}