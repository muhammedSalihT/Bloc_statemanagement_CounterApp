import 'dart:async';

enum Operation {
  increment,
  decrement,
  reset,
}

class CounterBlock {
  int counter = 0;
  final streamController = StreamController<int>();
  StreamSink<int> get counterSink => streamController.sink;
  Stream<int> get counterStream => streamController.stream;

  final eventStreamController = StreamController<Operation>();
  StreamSink<Operation> get eventSink => eventStreamController.sink;
  Stream<Operation> get eventStream => eventStreamController.stream;

  CounterBlock() {
    int counter = 0;
    eventStream.listen((event) {
      if (event == Operation.increment)
        counter++;
      else if (event == Operation.decrement)
        counter--;
      else if (event == Operation.reset) counter = 0;
      counterSink.add(counter);
    });
  }
}
