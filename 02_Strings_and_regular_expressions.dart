// Strings and regular expressions:https://dart.dev/guides/libraries/library-tour#numbers

void main() {
  search_inside_a_string();
  extracting_data_from_a_string();
}

void search_inside_a_string() {
  /*可以在字符串内查找特定字符串的位置，
  以及检查字符串是否以特定字符串作为开头或结尾。 */

  // Check whether a string contains another string
  assert('Never add or even'.contains('add'));

  // Does a string start with another string
  assert('Never add or even'.startsWith('Never'));

  // Does a string end with another string
  assert('Never add or even'.endsWith('even'));

  // Find the location of a string inside a string
  assert('Never add or even'.indexOf('odd') == 6);
}

void extracting_data_from_a_string() {
  /*获取字符串中的子字符串或者将一个字符串分割为子字符串列表*/

  // Grab a substring
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern
  var parts = 'progressive web apps'.split(' ');

  // Get a UTF-16 code unit (as a string) by index
  assert('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings);
  //good for iterating
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
}
