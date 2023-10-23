import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:module_core/models/card_model.dart';
import 'package:pointycastle/export.dart';

class NfcGenerateRSA {
  SecureRandom getSecureRandom() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(new KeyParameter(new Uint8List.fromList(seeds)));
    return secureRandom;
  }

  static CardModel getRsaKeyPair() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(new KeyParameter(new Uint8List.fromList(seeds)));

    var rsaPairs = new RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 5);
    var params = new ParametersWithRandom(rsaPairs, secureRandom);
    var keyGenerator = new RSAKeyGenerator();
    keyGenerator.init(params);
    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair = keyGenerator.generateKeyPair();
    return CardModel(
        publicKey: (keyPair.publicKey as RSAPublicKey).modulus.toString(),
        privateKey: (keyPair.privateKey as RSAPrivateKey).privateExponent.toString());
  }
}
