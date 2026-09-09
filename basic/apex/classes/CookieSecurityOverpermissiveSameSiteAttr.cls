public class CookieSecurityOverpermissiveSameSiteAttr {
	public PageReference testPR() {
        PageReference ref = ApexPages.currentPage();
        Cookie cookie = new Cookie('name', 'val', '/path', 0, true, 'Lax');
        ref.setCookies(new Cookie[]{cookie});
        return ref;
    }
}