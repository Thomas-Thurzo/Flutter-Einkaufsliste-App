import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _itemCounter = 1;

  void _incrementCounter() {
    setState(() {
      _itemCounter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_itemCounter > 1) {
        _itemCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Text(
          _itemCounter.toString(),
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.amber,
          child: IconButton(
            onPressed: _incrementCounter,
            icon: Icon(Icons.add),
          ),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.amber,
          child: IconButton(
            onPressed: _decrementCounter,
            icon: Icon(Icons.remove),
          ),
        ),
      ],
    );
  }
}
