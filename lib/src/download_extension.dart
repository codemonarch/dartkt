import 'dart:io';

import 'package:dartkt/src/string_extension.dart';

enum DownloadState { Start, Progress, Complete, Error }

typedef DownloadCallback = void Function(
    DownloadState state, int position, int filesize, String error);

Future<bool> download(
    String url, String localFile, DownloadCallback callback) async {
  var fTmp = File(localFile);
  if (fTmp.existsSync()) {
    fTmp.deleteSync();
  }
  var strFolder = localFile.substringBeforeLast('/');
  var fFolder = Directory(strFolder);
  if (!fFolder.existsSync()) {
    fFolder.createSync(recursive: true);
  }

  var isDownloadSuccess = true;
  try {
    var client = HttpClient();
    client.connectionTimeout = Duration(seconds: 15);

    var request = await client.getUrl(Uri.parse(url));
    var response = await request.close();
    var filesize = response.contentLength;
    if (callback != null) callback(DownloadState.Start, 0, filesize, null);
    var fileOut = File('$localFile.tmp');
    if (fileOut.existsSync()) {
      fileOut.deleteSync();
    }

    var position = 0;

    response.listen((data) {
      var count = data.length;
      try {
        fileOut.writeAsBytesSync(data, mode: FileMode.append);
        position += count;
        if (callback != null) {
          callback(DownloadState.Progress, position, filesize, null);
        }
      } on Exception catch (exeption) {
        if (callback != null) {
          callback(DownloadState.Error, 0, 0, exeption.toString());
        }
      }
    }, onDone: () {
      fileOut.renameSync(localFile);
      callback(DownloadState.Complete, 0, filesize, null);
    }, onError: (error) {
      isDownloadSuccess = false;
      if (callback != null) {
        callback(DownloadState.Error, 0, 0, error.toString());
      }
    }, cancelOnError: true);
  } on Error catch (error) {
    print(error);
    isDownloadSuccess = false;
    if (callback != null) {
      callback(DownloadState.Error, 0, 0, error.toString());
    }
  } on Exception catch (exception) {
    print(exception);
    isDownloadSuccess = false;
    if (callback != null) {
      callback(DownloadState.Error, 0, 0, exception.toString());
    }
  }
  return isDownloadSuccess;
}
