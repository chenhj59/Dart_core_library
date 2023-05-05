// dart:convert - decoding and encoding JSON, UTF-8, and more:https://dart.dev/guides/libraries/library-tour#dartconvert---decoding-and-encoding-json-utf-8-and-more
import 'dart:io';
import 'dart:convert';

void main() {
  Decoding_and_encoding_JSON();
  Decoding_and_encoding_UTF8();
}

//Decoding and encoding JSON:https://dart.dev/guides/libraries/library-tour#decoding-and-encoding-json
void Decoding_and_encoding_JSON() {
  //Decode a JSON-encoded string into a Dart object with jsonDecode()
  // NOTE: Be sure to use double quotes ("),
  // not single quotes ('), inside the JSON string.
  // This string is JSON, not Dart
  var jsonString = '''
    [
      {"score": 40},
      {"score": 80},
      {"score": 100, "overtime": true, "special_guest": null}
    ]''';
  var scores = jsonDecode(jsonString);
  assert(scores is List);

  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);

  scores = [
  {'score': 40},
  {'score': 80},
  {'score': 100, 'overtime': true, 'special_guest': null}
];
  var jsonText = jsonEncode(scores);
  print(jsonText);
  assert(jsonText ==
      '[{"score":40},{"score":80},'
        '{"score":100,"overtime":true,'
        '"special_guest":null}]');
}

//Decoding and encoding UTF-8 characters:https://dart.dev/guides/libraries/library-tour#decoding-and-encoding-utf-8-characters
void Decoding_and_encoding_UTF8() async {
  //Use utf8.decode() to decode UTF8-encoded bytes to a Dart string
  List<int> utf8Bytes = [
    0xc3,
    0x8e,
    0xc3,
    0xb1,
    0xc5,
    0xa3,
    0xc3,
    0xa9,
    0x72,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xc3,
    0xb6,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc4,
    0xbc,
    0xc3,
    0xae,
    0xc5,
    0xbe,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xe1,
    0xbb,
    0x9d,
    0xc3,
    0xb1
  ];

  var funnyWord = utf8.decode(utf8Bytes);

  assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');

  /*To convert a stream of UTF-8 characters into a Dart string, 
  specify utf8.decoder to the Stream transform() method
   */
  var inputStream = new File(r"/workspace/Dart_core_library/hello_world").openRead();
  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
  //Use utf8.encode() to encode a Dart string as a list of UTF8-encoded bytes
  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }
}
