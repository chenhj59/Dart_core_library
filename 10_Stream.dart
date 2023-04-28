// Stream:https://dart.dev/guides/libraries/library-tour#stream
import 'dart:convert';
import 'dart:io';

void main() {
  async_for_loop();
  listen_stream_data();
  transform_stream_date();
  readFileAwaitFor();
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

void transform_stream_date() {
  /*Often, you need to change the format of a stream’s data before you can use it. 
  Use the transform() method to produce a stream with a different type of data
   */
  var inputStream;
  var lines =
      inputStream.transform(utf8.decoder).transform(const LineSplitter());
}

Future<void> readFileAwaitFor() async {
  /*If you use an asynchronous for loop, then use try-catch to handle errors. 
  Code that executes after the stream is closed goes after the asynchronous for loop
  */
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines =
      inputStream.transform(utf8.decoder).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} charaters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }

  inputStream.transform(utf8.decoder).transform(const LineSplitter()).listen(
      (String line) {
    print('Got ${line.length} characters from stream');
  }, onDone: () {
    print('file is now closed');
  }, onError: (e) {
    print(e);
  });
}
