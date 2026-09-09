public with sharing class SOSLInjection {

	public SOSLInjection(){
		main();
	}
	
	public void main(){
		String accountName = UserInfo.getName();
		String query = 'FIND ' + accountName + ' IN ALL FIELDS RETURNING Account (Id, Name)';
		List<List<SObject>> searchResults = search.query(query);
	}
}