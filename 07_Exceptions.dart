// Exceptions:https://dart.dev/guides/libraries/library-tour#exceptions

class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void main() {
  try {
    throw ('hello world');
  } on FooException catch (e) {
    print(e);
  }
}
