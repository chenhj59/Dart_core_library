// Sending and receiving real-time data with WebSockets: https://dart.dev/guides/libraries/library-tour#sending-and-receiving-real-time-data-with-websockets
import 'dart:html';

void main() {
  var ws = WebSocket('ws://echo.websocket.org');
  ws.send('Hello from Dart!');
  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });
  initWebSocket();
}

void initWebSocket([int retrySeconds = 1]) {
  var reconnectScheduled = false;
  var ws = WebSocket('ws://echo.websocket.org');

  print('Connecting to websocket');

  void scheduleReconnect() {
    if (!reconnectScheduled) {
      initWebSocket(retrySeconds * 2);
    }
    reconnectScheduled = true;
  }

  ws.onOpen.listen((e) {
    print('Connected');
    ws.send('Hello from Dart!');
  });

  ws.onClose.listen((e) {
    print('Websocket closed, retrying in $retrySeconds seconds');
    scheduleReconnect();
  });

  ws.onError.listen((e) {
    print('Error connecting to ws');
    scheduleReconnect();
  });

  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });
}
