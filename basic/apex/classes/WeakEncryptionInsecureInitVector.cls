public class WeakEncryptionInsecureInitVector {
	public void testEncrypt(Blob input, Blob blob1, Blob blob2) {
        Blob hardcodedIV = Blob.valueOf('Example of IV123........');
        Blob key = Blob.valueOf(generateRandomKey(32));

        Blob encrypted = Crypto.encrypt('AES128', key, hardcodedIV, input);

    }
    
    public static String generateRandomKey(Integer length) {
        String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        Integer charactersLength = characters.length();
        String key = '';

        for (Integer i = 0; i < length; i++) {
            Integer randomIndex = Math.mod(Math.abs(Crypto.getRandomInteger()), charactersLength);
            key += characters.substring(randomIndex, randomIndex + 1);
        }

        return key;
    }
}