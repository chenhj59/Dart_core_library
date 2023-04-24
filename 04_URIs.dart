// URIs:https://dart.dev/guides/libraries/library-tour#uris

void main() {
  encoding_decoding();
  encoding_decoding_URIcomponets();
  parsing_URIs();
  build_URIs();
}

void encoding_decoding() {
  /*To encode and decode characters except those with special meaning in a URI (such as /, :, &, #), use the encodeFull() and decodeFull() methods. 
  These methods are good for encoding or decoding a fully qualified URI, leaving intact special URI characters */
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
}

void encoding_decoding_URIcomponets() {
  /*To encode and decode all of a string’s characters that have special meaning in a URI, including (but not limited to) /, &, and :,
   use the encodeComponent() and decodeComponent() methods
   */
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);
}

void parsing_URIs() {
  /*If you have a Uri object or a URI string, you can get its parts using Uri fields such as path.
   To create a Uri from a string, use the parse() static method
   */
  var uri = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri.scheme == 'https');
  assert(uri.host == 'example.org');
  assert(uri.path == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin == 'https://example.org:8080');
}

void build_URIs() {
  /*You can build up a URI from individual parts using the Uri() constructor
   */
  var uri = Uri(
      scheme: 'https',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag',
      queryParameters: {'lang': 'dart'});
  assert(uri.toString() == 'https://example.org/foo/bar?lang=dart#frag');

  /*If you don’t need to specify a fragment, to create a URI with a http or https scheme, 
  you can instead use the Uri.http or Uri.https factory constructors
   */
  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});

  assert(httpUri.toString() == 'http://example.org/foo/bar?lang=dart');
  assert(httpsUri.toString() == 'https://example.org/foo/bar?lang=dart');
}
