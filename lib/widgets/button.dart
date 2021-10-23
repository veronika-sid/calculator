import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.value, required this.callback})
      : super(key: key);
  final String value;

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: MaterialButton(
        onPressed: () => callback(value),
        child: Text(
          value,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
