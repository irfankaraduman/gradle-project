public class InsecureTransport {
    public InsecureTransport(){
        main();
	}
    
    public void main(){
        makeRequest('http://example.com', 'body');
    }
	
	public static HttpResponse makeRequest(string url, string body)  
    {
        HttpRequest req = new HttpRequest();   
        HttpResponse response = null;
        req.setEndpoint( url );
        req.setMethod('POST');
        req.setBody ( body);
        Http http = new Http();
        response = http.send(req);     
        return response;
    }  
}