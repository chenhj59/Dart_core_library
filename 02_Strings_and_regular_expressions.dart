// Strings and regular expressions:https://dart.dev/guides/libraries/library-tour#numbers

void main() {
  search_inside_a_string();
  extracting_data_from_a_string();
  converting_to_uppercase_or_lowercase();
  trimming_and_empty_strings();
  replacing_part_of_a_string();
  building_a_string();
  regular_expressions1();
  regular_expressions2();
}

void search_inside_a_string() {
  /*可以在字符串内查找特定字符串的位置，
  以及检查字符串是否以特定字符串作为开头或结尾。 */

  // Check whether a string contains another string
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string
  assert('Never odd or even'.indexOf('odd') == 6);
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

void converting_to_uppercase_or_lowercase() {
  /*对字符串的首字母大小写进行转换 */

  // Convert to uppercase
  assert('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to lowercase
  assert('WEB APPS'.toLowerCase() == 'web apps');
}

void trimming_and_empty_strings() {
  /*trim() 移除首尾空格; isEmpty检查一个字符串是否为空*/

  // Trim a string
  assert('   hello  '.trim() == 'hello');

  // Check whether a string is empty
  assert(''.isEmpty);

  // Strings with only white space are not empty
  assert('  '.isNotEmpty);
}

void replacing_part_of_a_string() {
  /*replaceAll():替换字符串
  字符串是不可变的对象，也就是说字符串可以创建但是不能被修改*/
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change
  assert(greeting != greetingTemplate);
}

void building_a_string() {
  /*
  要以代码方式生成字符串，可以使用 StringBuffer 。 
  在调用toString()之前， StringBuffer不会生成新字符串对象
  writeAll()： 第二个参数为可选参数，用来指定分隔符*/

  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');
}

void regular_expressions1() {
  /*RegExp 类提供与 JavaScript 正则表达式相同的功能。 
  使用正则表达式可以对字符串进行高效搜索和模式匹配。*/

  // Here's a regular expression for one or more digits
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() can use a regular expression
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains((numbers)));

  // Replace every match with another string
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
}

void regular_expressions2() {
  /*直接使用 RegExp 类。
  匹配类提供对正则表达式匹配项的访问 */

  var numbers = RegExp(r'\d+');
  var someDigits = 'llamas live 15 to 20 years';

  // Check whether the reg exp has a match in a string
  assert(numbers.hasMatch(someDigits));

  // Loop through all matches
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0));
  }
}
