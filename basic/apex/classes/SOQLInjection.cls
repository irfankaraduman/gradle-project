public with sharing class SOQLInjection {

	public SOQLInjection(){
		main();
	}
	
	public void main(){
		String accountName = UserInfo.getName();
		String query = 'SELECT Id, Name FROM Account WHERE Name = \'' + accountName + '\'';
		List<Account> accounts = Database.query(query);
	}
}