public with sharing class SystemInformationLeakExternal {
	public SystemInformationLeakExternal(){
		main();
	}
	
	public void main(){
		try {
			Integer i = 2/0;
		} catch(Exception e){
			ApexPages.addMessages(e);
		}
	}
}