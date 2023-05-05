// Other functionality: https://dart.dev/guides/libraries/library-tour#other-functionality

import 'dart:html';

void main() {
  Manipulating_the_DOM();
  Manipulating_elements();
  Creating_elements();
  Adding_replacing_removing_nodes();
  Manipulating_CSS_styles();
  Handling_events();
}

//Manipulating the DOM:https://dart.dev/guides/libraries/library-tour#manipulating-the-dom
void Manipulating_the_DOM() {
  /*The querySelector() function returns the first element that matches the selector, 
  while querySelectorAll()returns a collection of elements that match the selector
  */
  // Find an element by id (an-id)
  Element idElement = querySelector('#an-id')!;
  // Find an element by class (a-class)
  Element classElement = querySelector('.a-class')!;
  // Find all elements by tag (<div>)
  List<Element> divElements = querySelectorAll('div');
  // Find all text inputs
  List<Element> textInputElements = querySelectorAll(
    'input[type="text"]',
  );
  // Find all elements with the CSS class 'class'
  // inside of a <p> that is inside an element with
  // the ID 'id'
  List<Element> specialParagraphElements = querySelectorAll('#id p.class');
}

void Manipulating_elements() {
  /*You can use properties to change the state of an element. Node and its subtype Element define the properties that all elements have. 
  For example, all elements have classes, hidden, id, style, and title properties that you can use to set state. 
  Subclasses of Element define additional properties, such as the href property of AnchorElement
   */

  var anchor = querySelector('#example') as AnchorElement;
  anchor.href = 'https://dart.dev';

  const osList = ['macos', 'windows', 'linux'];
  final userOs = 'macos';

  // For each possible OS
  for (final os in osList) {
    // Matches user OS
    bool shouldShow = (os == userOs);
    // Find all elements with class=os. For example, if
    // os == 'windows', call querySelectorAll('.windows')
    // to find all elements with the class "windows".
    // Note that '.$os' uses string interpolation
    for (final elem in querySelectorAll('.$os')) {
      elem.hidden = !shouldShow;
      elem.attributes['someAttribute'] = 'someValue';
    }
  }
}

void Creating_elements() {
  /*You can add to existing HTML pages by creating new elements and attaching them to the DOM. 
  Here’s an example of creating a paragraph (<p>) element
   */
  var elem = ParagraphElement();
  elem.text = 'Creating is easy!';

  var elem2 = Element.html(
    '<p>Creating <em>is</em> easy!</p>',
  );
  document.body!.children.add(elem2);
}

void Adding_replacing_removing_nodes() {
  var elem = ParagraphElement();
  elem.text = 'Creating is easy!';

  querySelector('#inputs')!.nodes.add(elem);
  querySelector('#status')!.replaceWith(elem);
  querySelector('#expendable')?.remove();
}

void Manipulating_CSS_styles() {
  /*CSS, or cascading style sheets, defines the presentation styles of DOM elements. 
  You can change the appearance of an element by attaching ID and class attributes to it
   */
  var elem = querySelector('#message')!;
  elem.classes.add('warning');

  var message = DivElement()
    ..id = 'message2'
    ..text = 'Please subscribe to the Dart mailing list.';
  message.id = 'message2';
  message.text = 'Please subscribe to the Dart mailing list.';

  message.style
    ..fontWeight = 'bold'
    ..fontSize = '3em';
}

void Handling_events() {
  //For example, here’s how you can handle clicks on a button
  querySelector('#submitInfo')!.onClick.listen((e) {
    print('按下了');
  });

  document.body!.onClick.listen((event) {
    final clickedElem = event.target;
  });
}
