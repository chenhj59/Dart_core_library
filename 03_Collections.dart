// Collections:https://dart.dev/guides/libraries/library-tour#collections

void main() {
  list();
  sort_list();
}

void list() {
  /*lists 可以通过字面量来创建和初始化。 
  另外，也可以使用 List 的构造函数。 
  List 类还定义了若干方法，用于向列表添加或删除项目 */

  // Create an empty list of strings
  var grains = <String>[];
  assert(grains.isEmpty);

  // Create a list using a list literal
  var fruits = ['apples', 'oranges'];

  // Add to a list
  fruits.add('kiwis');

  // addAll():Add multiple items to a list
  fruits.addAll(['grapes', 'bananas']);

  // Get the list length
  assert(fruits.length == 5);

  // indexOf():查找对象在list的下标值
  // Access a list item by index
  assert(fruits[0] == 'apples');
  // Find an item in a list
  assert(fruits.indexOf('apples') == 0);

  // Remove a single item
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  // Remove all elements from a list
  fruits.clear();
  assert(fruits.isEmpty);

  // You can also create a List using one of the constructors
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  // 列表是参数化类型(泛型)
  // This list should contain only strings
  var fruites = <String>[];

  fruites.add('apples');
  var fruit = fruites[0];
  assert(fruit is  String);

  //fruites.add(5); // 类型不匹配error: 'int' can't be assigned to 'String'
}

void sort_list() {
  /* 对列表排序*/

  var fruits = ['oranges', 'apples', 'bannans'];
  print('排序前：$fruits');
  // Sort a list
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
  print('排序后：$fruits');
}
