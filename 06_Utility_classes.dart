// Utility classes:https://dart.dev/guides/libraries/library-tour#utility-classes

void main(List<String> args) {
  comparing_object();
  implementing_map_keys();
  iteration();
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;
  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

class Process {}

class ProcessIterator implements Iterator<Process> {
  // 迭代器要遍历的进程列表
  final List<Process> _processes = [/* ... */];

  // 记录当前迭代到的进程索引号
  int _currentIndex = 0;

  @override
  Process get current => _processes[_currentIndex];
  @override
  bool moveNext() {
    _currentIndex++;
    return _currentIndex < _processes.length;
  }
}

// A mythical class that lets you iterate through all
// processes. Extends a subclass of [Iterable].
class Processes extends Iterable<Process> {
  @override
  final Iterator<Process> iterator = ProcessIterator();
}

void comparing_object() {
  /*Implement the Comparable interface to indicate that an object can be compared to another object, 
  usually for sorting. The compareTo() method returns < 0 for smaller, 0 for the same, and > 0 for bigger
   */
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);
}

void implementing_map_keys() {
  /*Each object in Dart automatically provides an integer hash code, and thus can be used as a key in a map. 
  However, you can override the hashCode getter to generate a custom hash code. 
  If you do, you might also want to override the == operator.
  Objects that are equal (via ==) must have identical hash codes.
  A hash code doesn’t have to be unique, but it should be well distributed
   */
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}

void iteration() {
  /*The Iterable and Iterator classes support sequential access to a collection of values. 
  To practice using these collections, 
  follow the Iterable collections codelab
   */
  // Iterable objects can be used with for-in
  var sum = 0;

  for (final process in Processes()) {
    sum += 1;
  }
}
