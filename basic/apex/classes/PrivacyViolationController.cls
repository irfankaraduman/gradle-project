public with sharing class PrivacyViolationController {
    public String password {get; set {password = value == null ? value : value.trim(); } }
    
    public PrivacyViolationController(){}
    
    public PageReference registerUser() {
        logPass(password);
        return null;
    }
    
    public void logPass(String pass){
        system.debug('SSSSSSSSSSSS '+pass);
    }
}