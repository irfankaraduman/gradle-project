public class HeaderManipulationCookies {
    public PageReference testPR() {
        PageReference ref = ApexPages.currentPage();
        Map<String,String> params = ref.getParameters();
		String cookieVal = params.get('cookieVal');
        Cookie cookie = new Cookie('name1', cookieVal, '/path', 0, true, 'Strict');
        ref.setCookies(new Cookie[]{cookie});
        return ref;
    }
}