import 'dart:io';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

extension KTFileExtension on File {
  String hash(String alg) {
    var content = readAsBytesSync();
    Digest digest;
    switch (alg.toLowerCase()) {
      case 'md5':
        digest = md5.convert(content);
        break;
      case 'sha1':
        digest = sha1.convert(content);
        break;
      case 'sha256':
        digest = sha256.convert(content);
        break;
      case 'sha512':
        digest = sha512.convert(content);
        break;
    }
    return digest != null ? hex.encode(digest.bytes) : null;
  }

  String get md5sha1 => hash('MD5') + hash('SHA1');
}

void fileWalk(String basePath, void Function(File) block) {
  var f = Directory(basePath);
  f.listSync()?.forEach((it) {
    if (it is Directory) {
      fileWalk(it.path, block);
    } else if (it is File) {
      block(it);
    }
  });
}
