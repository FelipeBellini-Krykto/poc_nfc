import 'package:module_core/configs/nfc_storage.dart';
import 'package:module_core/services/local_storage_service/interface/local_storage_interface.dart';

class LocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    var shared = await NfcAppStorage.sharedPreferences();
    shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await NfcAppStorage.sharedPreferences();
    return shared.get(key);
  }

  @override
  Future put(String key, String value) async {
    var shared = await NfcAppStorage.sharedPreferences();
    shared.setString(key, value);
  }

  @override
  Future<void> reload() async {
    var shared = await NfcAppStorage.sharedPreferences();
    shared.reload();
  }
}
