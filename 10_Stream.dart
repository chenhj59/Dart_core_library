// Stream:https://dart.dev/guides/libraries/library-tour#stream
import 'dart:io';

void main() {
  async_for_loop();
  listen_stream_data();
}

void async_for_loop() async {
  /*uses Stream’s listen() method to subscribe to a list of files,
   passing in a function literal that searches each file or directory
   */
  String searchPath = '/workspace/Dart_core_library/10_Stream.dart';
  FileSystemEntity.isDirectory(searchPath).then((isDir) {
    if (isDir) {
      final startingDir = Directory(searchPath);
      startingDir.list().listen((entity) {
        if (entity is File) {
          print('找到文件：${entity.path}');
        }
      });
    } else {
      print('不是目录');
    }
  });

  //The equivalent code with await expressions, including an asynchronous for loop (await for), looks more like synchronous code
  if (await FileSystemEntity.isDirectorySync(searchPath)) {
    final startingDir = Directory(searchPath);
    await for (final entity in startingDir.list()) {
      if (entity is File) {
        print('找到文件：${entity.path}');
      }
    }
  } else {
    print('不是目录');
  }
}

void listen_stream_data() {
  // Add an event handler to a button
  var submitButton;
  if (submitButton != null)
    submitButton.onClick.listen((e) {
      // When the button is clicked, it runs this code
      print('Done!');
    });
}
