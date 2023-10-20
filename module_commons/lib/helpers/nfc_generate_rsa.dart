import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:module_core/models/card_model.dart';
import 'package:pointycastle/export.dart';

class NfcGenerateRSA {
  void generateRSA() async {
    SecureRandom secureRandom = getSecureRandom();
    var keyParams = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64);
    var rsaKeyGenerator = RSAKeyGenerator();
    rsaKeyGenerator.init(ParametersWithRandom(keyParams, secureRandom));
    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair = rsaKeyGenerator.generateKeyPair();

    print('Chave Pública: ${keyPair.publicKey}');
    print('Chave Privada: ${keyPair.privateKey}');
  }

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

  static void getRsaKeyPair() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(new KeyParameter(new Uint8List.fromList(seeds)));

    var rsapars = new RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 5);
    var params = new ParametersWithRandom(rsapars, secureRandom);
    var keyGenerator = new RSAKeyGenerator();
    keyGenerator.init(params);
    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair = keyGenerator.generateKeyPair();

    print('Chave Pública: ${keyPair.publicKey.toString()}');
    print('Chave Privada: ${keyPair.privateKey.toString()}');
  }
}
