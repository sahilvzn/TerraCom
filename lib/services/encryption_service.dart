import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  static const _storage = FlutterSecureStorage();
  static const _keyAlias = 'terra_comm_aes_key';

  static Key? _encryptionKey;
  static final _iv = IV.fromSecureRandom(12); // GCM uses 12 bytes IV typically

  static Future<void> init() async {
    final storedKey = await _storage.read(key: _keyAlias);
    if (storedKey == null) {
      _encryptionKey = Key.fromSecureRandom(32); // AES-256
      await _storage.write(key: _keyAlias, value: _encryptionKey!.base64);
    } else {
      _encryptionKey = Key.fromBase64(storedKey);
    }
  }

  static String encryptMessage(String plainText) {
    if (_encryptionKey == null) throw Exception("Encryption not initialized");
    final encrypter = Encrypter(AES(_encryptionKey!, mode: AESMode.gcm));
    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    // Combine IV and CipherText
    return '${_iv.base64}:${encrypted.base64}';
  }

  static String decryptMessage(String cipherData) {
    if (_encryptionKey == null) throw Exception("Encryption not initialized");
    final parts = cipherData.split(':');
    if (parts.length != 2) return cipherData; // Fallback, not encrypted or corrupted
    
    final iv = IV.fromBase64(parts[0]);
    final encrypted = Encrypted.fromBase64(parts[1]);
    final encrypter = Encrypter(AES(_encryptionKey!, mode: AESMode.gcm));
    
    try {
      return encrypter.decrypt(encrypted, iv: iv);
    } catch (e) {
      return "[Decryption Failed]";
    }
  }
}
