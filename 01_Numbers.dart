// Numbers:https://dart.dev/guides/libraries/library-tour#numbers

void main() {
  number1();
  number2();
  number3();
  number4();
}

void number1() {
  /*
  使用 int 和 double
  的方法将字符串转换为整型或双浮点型对象：parse() */
  assert(int.parse('42') == 42); //assert:当条件为否，则抛出异常
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
}

void number2() {
  /* 使用 num 的 parse() 方法，
  该方法可能会创建一个整型，否则为浮点型对象*/
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
}

void number3() {
  /* 添加参数,指定整数的进制基数：radix*/
  assert(int.parse('42', radix: 16) == 66);
}

void number4() {
  /*使用 方法将整型或双精度浮点类型转换为字符串类型。
   使用 toStringAsFixed(). 指定小数点右边的位数，
   使用toStringAsPrecision(): 指定字符串中的有效数字的位数。toString() */

  // Convert an int to a string
  assert(42.toString() == '42');
  // Convert a double to a string
  assert(123.456.toString() == '123.456');
  // Specify the number of digits after the decimal
  assert(123.456.toStringAsFixed(2) == '123.46');
  // Specify the number of significant figures
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}
