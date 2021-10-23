import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key, required this.value, required this.callback})
      : super(key: key);
  final String value;
  final Color firstColor = Colors.green;
  final Color secondColor = Colors.red;
  final Function callback;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool animation = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      onEnd: () => {animation = false},
      decoration: BoxDecoration(
          color: animation ? widget.firstColor : widget.secondColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      duration: const Duration(milliseconds: 400),
      child: MaterialButton(
        onPressed: () {
          setState(() => animation = !animation);
          widget.callback(widget.value);
        },
        child: Text(
          widget.value,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
