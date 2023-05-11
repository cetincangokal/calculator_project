import 'package:calculator_project/colors_constants.dart';
import 'package:calculator_project/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(String buttonList,{super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  

  

  @override
  Widget build(BuildContext context){
    return InkWell(
        splashColor: ColorConstants.buttonPushColor,
        onTap: () {
          setState(() {
            handleButtons(text);
          });
        },
        child: Ink(
            decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.white.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 0.5,
                    offset: const Offset(-3, -3),
                  )
                ]),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: getColor(text),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )));
  }

  void handleButtons(String text) {
    if (text == 'AC') {
      StringConstants.Input = '';
      StringConstants.Result = '0';
      return;
    }
    if (text == 'C') {
      if (StringConstants.Input.isNotEmpty) {
        StringConstants.Input = StringConstants.Input.substring(
            0, StringConstants.Input.length - 1);
        return;
      } else {
        return;
      }
    }

    if (text == '=') {
      StringConstants.Result = calculate();
      StringConstants.Input = StringConstants.Result;
      if (StringConstants.Input.endsWith(".0")) {
        StringConstants.Input = StringConstants.Input.replaceAll(".0", "");
        return;
      }
      if (StringConstants.Result.endsWith(".0")) {
        StringConstants.Result = StringConstants.Result.replaceAll(".0", "");
        return;
      }
    }
    StringConstants.Input = StringConstants.Input + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(StringConstants.Input);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return 'error';
    }
  }

  getColor(String text) {
    if (text == '/' ||
        text == '*' ||
        text == '+' ||
        text == '-' ||
        text == 'C' ||
        text == '(' ||
        text == ')') {
      return ColorConstants.calculateSignColor;
    }
  }

  getBgColor(String text) {
    if (text == 'AC') {
      return ColorConstants.calculateSignColor;
    }
    if (text == '=') {
      return ColorConstants.equalColor;
    }
    return ColorConstants.white;
  }
}
