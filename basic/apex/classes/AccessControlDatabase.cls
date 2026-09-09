public class AccessControlDatabase {

	public AccessControlDatabase(){
		main();
	}
	
	public void main(){
		String accountName = UserInfo.getName();
		String query = 'SELECT Id, Name FROM Account WHERE Name = \'' + String.escapeSingleQuotes(accountName) + '\'';
		List<Account> accounts = Database.query(query);
	}
}

