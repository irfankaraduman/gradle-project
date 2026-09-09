public class WeakCryptographicHash { 
    public Blob hash(Blob input){
       return Crypto.generateDigest('MD5', input);
    }
}