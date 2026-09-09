public class PasswordManagementEmptyPassword {
    public PasswordManagementEmptyPassword(){
        main();
	}
    
    public void main(){
        makeRequest();
    }
	
	public static HttpResponse makeRequest()  
    {
        String endpoint = 'https://yourinstance.salesforce.com/services/apexrest/MyWebService';
		HttpRequest request = new HttpRequest();
		request.setEndpoint(endpoint);
		request.setMethod('GET');
        request.setClientCertificate('your_certificate_label', '');
		Http http = new Http();
		HttpResponse response = http.send(request);
		return response;
    }  
}