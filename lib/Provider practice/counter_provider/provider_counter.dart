import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sand_box/Provider%20practice/counter_provider/counter_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterUI(),
    ),
  ));
}

class CounterUI extends StatefulWidget {
  const CounterUI({super.key});

  @override
  State<CounterUI> createState() => _CounterUIState();
}

class _CounterUIState extends State<CounterUI> {
  @override
  Widget build(BuildContext context) {
    var currentCount = context.watch<CounterProvider>().counter;
    var counterOperations = context.read<CounterProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current count is: $currentCount'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    counterOperations.increment();
                  },
                  child: const Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () {
                    counterOperations.decrement();
                  },
                  child: const Icon(Icons.remove)),
            ],
          )
        ],
      ),
    );
  }
}
