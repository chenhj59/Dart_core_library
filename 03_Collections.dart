// Collections:https://dart.dev/guides/libraries/library-tour#collections

void main() {
  list();
  sort_list();
  set();
  map();
  collection_method();
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
  assert(fruit is String);

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

void set() {
  /*Dart中的集合是无序集合*/

  // Create an empty set of strings
  var ingredients = <String>{};

  // Add new items to it
  ingredients.addAll(['gold', 'titanius', 'xenon']);
  assert(ingredients.length == 3);

  // Adding a duplicate item has no effect
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // Remove an item from a set
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  // can also create sets using
  // one of the constructors
  var atomicNumbers = Set.from(([79, 22, 54]));

  //Use contains() and containsAll() to check
  //whether one or more objects are in a set
  var ingredientsOne = Set<String>();
  ingredientsOne.addAll(['glod', 'titanium', 'xenon']);

  // Check whether an item is in the set
  assert(ingredientsOne.contains('titanium'));

  // Check whether all the items are in the set
  assert(ingredientsOne.containsAll(['titanium', 'xenon']));

  // An intersection is a set whose items are in two other sets
  // Create the intersection of two sets
  var nobleGases = Set.from(['xenon', 'orgon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void map() {
  /*A map, commonly known as a dictionary or hash,
  is an unordered collection of key-value pairs.
  Maps associate a key to some value for easy retrieval.
  Unlike in JavaScript, Dart objects are not maps */
  // Maps often use strings as keys
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hannlei', 'Poipu']
  };

  // Maps can be built from a constructor
  var searchTerms = Map();

  // Maps are parameterized types; you can specify what
  // types the key and value should be
  var nobleGases = Map<int, String>();

  //You add, get, and set map items using the
  //bracket syntax. Use remove()
  //to remove a key and its value from a map
  nobleGases = {54: 'xenon'};

  // Retrieve a value with a key
  assert(nobleGases[54] == 'xenon');

  // Remove a key and its value
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  // You can retrieve all the values or all the keys from a map
  // Get all the keys as an unordered collection
  // (an Iterable)
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  // Get all the values as an unordered collection
  // (an Iterable of Lists)
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  //To check whether a map contains a key, use containsKey().
  //Because map values can be null,
  //you cannot rely on simply getting the value for the key and checking
  // for null to determine the existence of a key
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  /*Use the putIfAbsent() method when you want to assign a value to a key if 
  and only if the key does not already exist in a map. 
  You must provide a function that returns the value */
  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => 'test');
  assert(teamAssignments['Catcher'] != null);
}

void collection_method() {
  /*List, Set, and Map share common functionality found in many collections. 
    Some of this common functionality is defined by the Iterable class, 
    which List and Set implement */
  var hawaiianBeaches = {
    'Oahu': ['Waikik', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hannlei', 'Poipu']
  };
  //Use isEmpty or isNotEmpty to check whether a
  //list, set, or map has items
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  //To apply a function to each item in a
  //list, set, or map, you can use forEach()
  teas.forEach((tea) => print('I drink $tea'));

  //When you invoke forEach() on a map,
  //your function must take two arguments (the key and value)
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc
  });

  // Iterables provide the map() method,
  //which gives you all the results in a single object
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //To force your function to be called immediately on each item,
  //use map().toList() or map().toSet()
  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();

  /*Use Iterable’s where() method to get all the items that match a condition. 
  Use Iterable’s any() and every() methods to check whether some or all items match a condition */
  // Chamomile is not caffeinated
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  // Use where() to find only the items that return true
  // from the provided function
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  // or teas.where(isDecaffeinated)

  // Use any() to check whether at least one item in the
  // collection satisfies a condition
  assert(teas.any(isDecaffeinated));

  // Use every() to check whether all the items in a
  // collection satisfy a condition
  assert(!teas.every(isDecaffeinated));
}
