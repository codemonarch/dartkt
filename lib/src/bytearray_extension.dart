import 'dart:io';
import 'dart:typed_data';

extension KTByteArrayExtension on Uint8List {
  void save(File dest) => dest.writeAsBytesSync(this);
}
