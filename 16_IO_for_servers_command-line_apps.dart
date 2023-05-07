//dart:io - I/O for servers and command-line apps:https://dart.dev/guides/libraries/library-tour#dartio
import 'dart:io';
import 'dart:convert';

import '10_Stream.dart';

void main() {
  Reading_file_as_text();
  Reading_file_as_binary();
  Handling_errors();
  Streaming_file_contents();
  Writing_file_contents();
  Listing_files_in_directory();
}

void Reading_file_as_text() async {
  /*When reading a text file encoded using UTF-8, you can read the entire file contents with readAsString(). 
  When the individual lines are important, you can use readAsLines(). 
  In both cases, a Future object is returned that provides the contents of the file as one or more strings
   */
  var config = File('config.txt');

  var stringContents = await config.readAsString();
  print('The file is ${stringContents.length} characters long.');

  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');
}

void Reading_file_as_binary() async {
  /*The following code reads an entire file as bytes into a list of ints. 
  The call to readAsBytes() returns a Future, which provides the result when it’s available
  */
  var config = File('config.txt');

  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');
}

void Handling_errors() async {
  /*To capture errors so they don’t result in uncaught exceptions, 
  you can register a catchError handler on the Future, or (in an async function) use try-catch
   */
  var config = File('config.txt');
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
}

void Streaming_file_contents() async {
  /*Use a Stream to read a file, a little at a time. 
  You can use either the Stream API or await for, part of Dart’s asynchrony support
   */
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
  } catch (e) {
    print(e);
  }
}

void Writing_file_contents() async {
  /*
  You can use an IOSink to write data to a file. 
  Use the File openWrite() method to get an IOSink that you can write to. 
  The default mode,FileMode.write, completely overwrites existing data in the file
   */
  var logFile = File('log.txt');
  var sink = logFile.openWrite();
  sink.write('FILE ACCESSED ${DateTime.now()}\n');
  await sink.flush();
  await sink.close();

  //To add to the end of the file, use the optional mode parameter to specify FileMode.append
  sink = logFile.openWrite(mode: FileMode.append);
}

void Listing_files_in_directory() async {
  var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
}
