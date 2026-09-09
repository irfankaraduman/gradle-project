public class ServerSideRequestForgery {
	public HttpRequest testHttpRequest() {
        PageReference ref = ApexPages.currentPage();
        Map<String,String> params = ref.getParameters();

        HttpRequest req = new HttpRequest();

        String index = params.get('index');
        req.setEndpoint('https://abc'+Integer.valueOf(index)+'.com');
        
        return req;
    }
}