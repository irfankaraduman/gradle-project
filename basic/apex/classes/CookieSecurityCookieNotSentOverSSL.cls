public class CookieSecurityCookieNotSentOverSSL {
	public PageReference testPR() {
        PageReference ref = ApexPages.currentPage();
        Cookie cookie = new Cookie('name', 'val', '/path', 0, false, 'Strict');
        ref.setCookies(new Cookie[]{cookie});
        return ref;
    }
}