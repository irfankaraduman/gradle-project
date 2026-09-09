public class KeyManagementHardcodedEncryptionKey {
    public Blob testEncrypt(Blob input) {
        Blob hardcodedKey2 = EncodingUtil.base64Decode('hardcodedinbase64');
        Blob encrypted = Crypto.sign('RSA', input, hardcodedKey2);
        return encrypted;
    }
}