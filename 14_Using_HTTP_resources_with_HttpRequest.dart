// Using HTTP resources with HttpRequest: https://dart.dev/guides/libraries/library-tour#using-http-resources-with-httprequest

import 'dart:html';

void main(List<String> args) {
  Getting_data_from_server();
}

void Getting_data_from_server() async {
  /*The HttpRequest static method getString() is an easy way to get data from a web server. 
  Use await with the getString() call to ensure that you have the data before continuing execution
   */
  var url = 'https://example.org/api?foo=some message';
  String pageHtml = await HttpRequest.getString(url);
  try {
    var data = await HttpRequest.getString(url);
  } catch (e) {
    print('error');
  }

  HttpRequest req = await HttpRequest.request(
    url,
    method: 'HEAD',
  );
  if (req.status == 200) {
    print('Successful URL access');
  }
}
