public with sharing class CrossSiteRequestForgeryController {
    public CrossSiteRequestForgeryController(){
        updateProfile();
    }
    
    public ApexPages.Action updateProfile() {
        String email = 'user@example.com';
        User currentUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        currentUser.Email = email;
        update currentUser;
		return null;
    }
}