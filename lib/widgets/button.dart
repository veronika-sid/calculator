import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.value, required this.callback})
      : super(key: key);
  final String value;

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => callback(value),
        child: Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width * .065,
              MediaQuery.of(context).size.height * .075),
        ));
  }
}
