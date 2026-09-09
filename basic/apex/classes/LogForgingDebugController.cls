public class LogForgingDebugController {
    public LogForgingDebugController(){
        main();
    }
    
    public void main(){
        Id paramId = ApexPages.currentPage().getParameters().get('id');
        System.debug('paramId========'+paramId);
    }
}