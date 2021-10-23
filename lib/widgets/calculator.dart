import 'package:calculator/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String expression = '0';
  double firstNum = 0.0;
  double secondNum = 0.0;
  String operand = '';

  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * .9,
        height: MediaQuery.of(context).size.height * .65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * .18,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        expression,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                      AnimatedOpacity(
                        opacity: opacityLevel,
                        duration: const Duration(seconds: 3),
                        child: Text(
                          result,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
            ),
            const SizedBox(height: 20),
            Container(
                child: Button(value: '=', callback: equals),
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .9),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                childAspectRatio: (4 / 3),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  Button(value: '7', callback: numClick),
                  Button(value: '8', callback: numClick),
                  Button(value: '9', callback: numClick),
                  Button(value: '+', callback: numClick),
                  Button(value: '4', callback: numClick),
                  Button(value: '5', callback: numClick),
                  Button(value: '6', callback: numClick),
                  Button(value: '-', callback: numClick),
                  Button(value: '1', callback: numClick),
                  Button(value: '2', callback: numClick),
                  Button(value: '3', callback: numClick),
                  Button(value: '/', callback: numClick),
                  AnimatedButton(value: 'C', callback: numClick),
                  Button(value: '0', callback: numClick),
                  Button(value: '.', callback: numClick),
                  Button(value: '*', callback: numClick),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equals(String value) {
    numClick(value);
    _changeOpacity();
  }

  void numClick(String value) {
    switch (value) {
      case 'C':
        expression = '0';
        result = '0';
        firstNum = 0.0;
        secondNum = 0.0;
        operand = '';
        break;
      case '+':
      case '-':
      case '/':
      case '*':
        firstNum = double.parse(expression);
        operand = value;
        result = '0';
        break;
      case '.':
        if (result.contains('.')) {
          return;
        } else {
          result == '0' ? result = value : result = result + value;
        }
        break;
      case '=':
        secondNum = double.parse(expression);
        switch (operand) {
          case '+':
            result = (firstNum + secondNum).toString();
            break;
          case '-':
            result = (firstNum - secondNum).toString();
            break;
          case '*':
            result = (firstNum * secondNum).toString();
            break;
          case '/':
            result = (firstNum / secondNum).toString();
            break;
        }
        firstNum = 0.0;
        secondNum = 0.0;
        operand = '';
        break;
      default:
        result == '0' ? result = value : result = result + value;
    }
    setState(() {
      expression = double.parse(result).toString();
    });
  }
}
