public class FrameSpoofingController {
    
    public string iframeUrl {get; set {value = getIframeUrl();}}
	
	public string url {get; set;}
	
	public ApexPages.Action submitUrl(){
		iframeUrl = 'url';
		return null;
	}
    
	public String getIframeUrl() {
        System.PageReference pr = new System.PageReference(url);

        return pr.getUrl();
    }
}