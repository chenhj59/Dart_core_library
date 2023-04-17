// Printing to the console：https://dart.cn/guides/libraries/library-tour#printing-to-the-console

void main(){
  /*
  The top-level print() method takes a single 
  argument (any Object) and displays that object’s
   string value (as returned by toString()) in the console. */
  String  anObject = 'object';
  String tea = 'tea';
  
  print(anObject);
  print('I drink $tea.');
}