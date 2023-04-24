// Future:https://dart.dev/guides/libraries/library-tour#future
import 'dart:async';
import 'dart:html';

void main() {
  runUsingFuture();
  runUsingAsyncAwait();
  basic_usage();
  chain_multiasynch();
  Wait_multiFuture();
}

class EntryPoint {
  final String filePath;
  final String functionName;

  EntryPoint({required this.filePath, required this.functionName});
}

Future<EntryPoint> findEntryPoint() async {
  // 遍历目录，查找入口点
  // 如果找到了入口点，则返回 EntryPoint 对象
  // 如果未找到入口点，则返回 null
  EntryPoint entryPoint = EntryPoint(filePath: '1', functionName: '2');
  return entryPoint;
}

Future<dynamic> runExecutable(EntryPoint entryPoint) async {
  // 根据 entryPoint 中的信息运行入口点函数
  // 将命令行参数作为参数传递给入口点函数
  // 返回入口点函数的执行结果
}

Future<void> flushThenExit(dynamic result) async {
  // 刷新缓存
  // 退出程序
}
void runUsingFuture() {
  /*Consider the following function. 
  It uses Future’s then() method to execute three asynchronous functions in a row,
   waiting for each one to complete before executing the next one
   */
  findEntryPoint().then((entryPoint) {
    return runExecutable(entryPoint);
  }).then(flushThenExit);
}

Future<void> runUsingAsyncAwait() async {
  /*The equivalent code with await expressions 
  looks more like synchronous code
   */
  var entryPoint = await findEntryPoint();
  var exitCode = await runExecutable(entryPoint);
  await flushThenExit(exitCode);
  //An async function can catch exceptions from Futures
  try {
    await flushThenExit(exitCode);
  } catch (e) {
    print(e);
  }
}

void basic_usage() {
  /*You can use then() to schedule code that runs when the future completes. For example, 
  HttpRequest.getString() returns a Future, since HTTP requests can take a while. 
  Using then() lets you run some code when that Future has completed and the promised string value is available
   */
  var uri = 'https://dart.dev/guides/libraries/library-tour#future';
  HttpRequest.getString(uri).then((String result) {
    print(result);
  });
  //Use catchError() to handle any errors or exceptions that a Future object might throw
  HttpRequest.getString(uri).then((String result) {
    print(result);
  }).catchError((e) {
    print(e);
  });
}

void chain_multiasynch() async {
  /*The then() method returns a Future, 
  providing a useful way to run multiple asynchronous functions in a certain order. 
  If the callback registered with then() returns a Future, 
  then() returns a Future that will complete with the same result as the Future returned from the callback. 
  If the callback returns a value of any other type,
   then() creates a new Future that completes with the value
   */
  var uri = 'https://dart.dev/guides/libraries/library-tour#future';
  Future result = HttpRequest.getString(uri);
  result
      .then((value) => print('$value'))
      .then((_) => print('_'))
      .then((_) => print('Done!'))
      .catchError((Exception) {
    print(Exception);
  });

  try {
    final value = HttpRequest.getString(uri);
    await (value) => print(value);
    await (_) => print('_');
    await (_) => print('Done!');
  } catch (e) {
    print(e);
  }
}

Future<void> deleteLotsOfFiles() async => print('delete');
Future<void> copyLotsOfFiles() async => print('copy');
Future<void> checksumLotsOfOtherFiles() async => print('check');
void Wait_multiFuture() async {
  /*Sometimes your algorithm needs to invoke many asynchronous functions and wait for them all to complete before continuing. 
  Use the Future.wait() static method to manage multiple Futures and wait for them to complete
   */
  await Future.wait([
    deleteLotsOfFiles(),
    copyLotsOfFiles(),
    checksumLotsOfOtherFiles(),
  ]);
  print('Done with all the long steps!');
}
