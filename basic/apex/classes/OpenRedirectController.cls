public class OpenRedirectController {
	public PageReference onClick1() {
        PageReference ref = ApexPages.currentPage();
        Map<String,String> params = ref.getParameters();
        
        return new PageReference(params.get('redirect'));
    }
}