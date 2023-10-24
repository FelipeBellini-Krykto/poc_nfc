import 'package:flutter/foundation.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;

abstract class NfcHelper {
  static Future<bool> NfcIsAvailable() async {
    NFCAvailability nfcAvailability = await FlutterNfcKit.nfcAvailability;
    return NFCAvailability.available == nfcAvailability;
  }

  static Future<String?> listenerTag() async {
    // final NFCTag tag = await FlutterNfcKit.poll(
    //   timeout: const Duration(seconds: 50),
    //   iosAlertMessage: 'Procurando Tag NFC...',
    // );
    final ndefRecords = await FlutterNfcKit.readNDEFRecords();
    for (ndef.NDEFRecord record in ndefRecords) {
      if (record is ndef.TextRecord) {
        await FlutterNfcKit.setIosAlertMessage("Aguarde...");
        if (record.text != null) {
          await FlutterNfcKit.finish(iosAlertMessage: "Leitura realizada com sucesso!");
          return record.text;
        }
      }
    }
    return null;
  }

  static writeTagNFT(String key) async {
    await FlutterNfcKit.writeNDEFRecords([
      ndef.TextRecord(text: key, language: 'en'),
      ndef.MimeRecord(decodedType: 'Content-type', payload: Uint8List.fromList('com.nfc.poc.app'.codeUnits)),
    ]);
  }
}
