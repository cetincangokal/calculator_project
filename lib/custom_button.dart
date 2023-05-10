
import 'package:calculator_project/strings_constants.dart';
import 'package:flutter/material.dart';

  
  Widget CustomButton(String text) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: () {
        
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: const Offset(-3, -3),
            )
          ]
        ),
        child: Center(
          child: Text(text,style: TextStyle(color: getColor(text),
          fontSize: 30,fontWeight: FontWeight.bold),
        ),
      )
      )
    );
  }
  
  void handleButtons(String text) {
    if (text == 'AC') {
      StringConstants.Input = '';
      StringConstants.Result = '0';
      return;
    }
    if(text == 'C'){
      if (StringConstants.Input.isNotEmpty) {
        StringConstants.Input = StringConstants.Input.substring(0, StringConstants.Input.length -1);
        return;
      }else{
        return;
      }
    }
  }


  getColor(String text){
      if(text == '/' ||
         text == '*' || 
         text == '+' || 
         text == '-' || 
         text == 'C' || 
         text == '(' || 
         text == ')' ){
        return const Color.fromARGB(255, 252, 100, 100);
      }
  }

  getBgColor(String text){
    if(text == 'AC'){
      return const Color.fromARGB(255, 252, 100, 100);
    }
    if (text == '=') {
      return  const Color.fromARGB(255, 90, 73, 22);
    }
    return const Color(0xFF1d2630);
  }
