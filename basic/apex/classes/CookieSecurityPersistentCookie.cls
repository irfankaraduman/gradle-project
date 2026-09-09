public class CookieSecurityPersistentCookie {
    public PageReference testPR() {
        PageReference ref = ApexPages.currentPage();
        Cookie cookie = new Cookie('name', 'val', '/path', 100, true, 'Strict');
        ref.setCookies(new Cookie[]{cookie});
        return ref;
    }
}