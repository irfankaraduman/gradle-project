public class PoorErrorHandlingEmptyCatchBlock {
	public PoorErrorHandlingEmptyCatchBlock(){
        main();
	}
    
    public void main(){
        try {
            Integer i = 2/0;
        } catch (MathException ex){
        }
    }
}