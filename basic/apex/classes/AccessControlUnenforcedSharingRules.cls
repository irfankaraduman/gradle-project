public without sharing class AccessControlUnenforcedSharingRules {
    public AccessControlUnenforcedSharingRules(){
        main();
    }
    public void main(){
        List<Account> accs = [SELECT Id, Name FROM Account];
    }
}