public class CookieSecurityMissingSameSiteAttribute {
	public PageReference testPR() {
        PageReference ref = ApexPages.currentPage();
        Cookie cookie = new Cookie('name', 'val', '/path', 0, true);
        Cookie cookie2 = new Cookie('name', 'val', '/path', 0, true, 'None');        
        ref.setCookies(new Cookie[]{cookie, cookie2});
        return ref;
    }
}