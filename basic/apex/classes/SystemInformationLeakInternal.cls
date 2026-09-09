public with sharing class SystemInformationLeakInternal {
	public SystemInformationLeakInternal(){
		main();
	}
	
	public void main(){
		try {
			Integer i = 2/0;
		} catch(Exception e){
			System.debug(LoggingLevel.ERROR, e.getMessage());
		}
	}
}