import 'package:flutter/material.dart';
import 'package:shopping_app/controller/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final counterBlock = CounterBlock();
  late AsyncSnapshot data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Count',
                style: TextStyle(fontSize: 50),
              ),
              StreamBuilder<int>(
                  stream: counterBlock.counterStream,
                  builder: (context, snapshot) {
                    final data  = snapshot.data;
                    if (data == null) {
                      return Text(
                        '${counterBlock.counter}',
                        style: const TextStyle(fontSize: 50),
                      );
                    } else {
                      return Text(
                        '${snapshot.data}',
                        style: const TextStyle(fontSize: 50),
                      );
                    }
                  }),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBlock.eventSink.add(Operation.increment);
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                if (data == 0) {
                  return;
                } else {
                  counterBlock.eventSink.add(Operation.decrement);
                }
              },
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
                onPressed: () {
                  counterBlock.eventSink.add(Operation.reset);
                },
                tooltip: 'Increment',
                child: const Text("Restart")),
          ],
        ));
  }
}
