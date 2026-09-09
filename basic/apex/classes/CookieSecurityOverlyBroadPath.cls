public class CookieSecurityOverlyBroadPath {
    public PageReference testPR() {
        PageReference ref = ApexPages.currentPage();
        Cookie c5 = new Cookie('name', 'val', '/', 0, true, 'Strict');
        ref.setCookies(new Cookie[]{c5});
        return ref;
    }
}