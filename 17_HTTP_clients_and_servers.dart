// HTTP clients and servers: https://dart.dev/guides/libraries/library-tour#http-clients-and-servers

import 'dart:indexed_db';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) async {
  final requests = await HttpServer.bind('localhost', 8888);
  await for (final request in requests) {
    processRequest(request);
  }
  HTTP_client();
}

void processRequest(HttpRequest request) {
  print('Got request for ${request.uri.path}');
  final response = request.response;
  if (request.uri.path == '/dart') {
    response
      ..headers.contentType = ContentType(
        'text',
        'plain',
      )
      ..write('Hello from the server');
  } else {
    response.statusCode = HttpStatus.notFound;
  }
  response.close();
}

void HTTP_client() async {
  /*The HttpClient class helps you connect to HTTP resources from your Dart command-line or server-side application. 
  You can set headers, use HTTP methods, and read and write data. The HttpClient class does not work in browser-based apps. 
  When programming in the browser, use the dart:html HttpRequest class. Here’s an example of using HttpClient
   */
  var url = Uri.parse('http://localhost:8888/dart');
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(url);
  var response = await request.close();
  var data = await utf8.decoder.bind(response).toList();
  print('Response ${response.statusCode}:$data');
  httpClient.close();
}
