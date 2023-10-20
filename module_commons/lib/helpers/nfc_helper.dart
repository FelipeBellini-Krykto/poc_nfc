import 'package:module_external_dependencies/nfc_manager.dart';

abstract class NfcHelper {
  static Future<bool> NfcIsAvailable() async {
    try {
      bool isNfcAvailable = await NfcManager.instance.isAvailable();
      return isNfcAvailable;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static startSession(String value) {
    NfcManager.instance.startSession(onDiscovered: (tag) async {
      Ndef? ndef = Ndef.from(tag);

      NdefMessage message = NdefMessage([
        // NdefRecord.createExternal('com.nfc', 'pkg', Uint8List.fromList(amount.codeUnits)),
        NdefRecord.createText(value)
      ]);

      try {
        await ndef!.write(message);
        NfcManager.instance.stopSession();
        print("Counter witten a tag");
        return;
      } catch (e) {
        print('error $e');
        return;
      }
    });
  }
}
