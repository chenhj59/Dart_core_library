//dart:io - I/O for servers and command-line apps:https://dart.dev/guides/libraries/library-tour#dartio
import 'dart:io';

void main() {
  Reading_file_as_text();
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
