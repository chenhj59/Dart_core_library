// Using HTTP resources with HttpRequest: https://dart.dev/guides/libraries/library-tour#using-http-resources-with-httprequest

import 'dart:html';

void main(List<String> args) {
  Getting_data_from_server();
  Sending_data_server();
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

  var request = HttpRequest();
  request
    ..open('POST', url)
    ..onLoadEnd.listen((e) => print('完成'))
    ..send('encodedData');
}

void Sending_data_server() async {
  /*Submitting data to a form handler requires you to provide name-value pairs as URI-encoded strings.
   (Information about the URI class is in the URIs section of the Dart Library Tour.)
   You must also set the Content-type header to application/x-www-form-urlencoded if you wish to send data to a form handler
   */
  String encodeMap(Map<String, String> data) => data.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');

  const data = {'dart': 'fun', 'angular': 'productive'};

  var url = 'https://example.org/api?foo=some message';
  var request = HttpRequest();
  request
    ..open('POST', url)
    ..setRequestHeader(
      'Content-type',
      'application/x-www-form-urlencoded',
    )
    ..send(encodeMap(data));

  await request.onLoadEnd.first;

  if (request.status == 200) {
    print('Successful URL access');
  }
}
