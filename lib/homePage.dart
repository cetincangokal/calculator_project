import 'package:calculator_project/colors_constants.dart';
import 'package:calculator_project/custom_button.dart';
import 'package:calculator_project/strings_constants.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.bgColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    StringConstants.Input,
                    style: const TextStyle(fontSize: 32, color: ColorConstants.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(10),
                  child:  Text(
                    StringConstants.Result,
                    style: const TextStyle(
                        fontSize: 48,
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: ColorConstants.white,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GridView.builder(
                itemCount: buttonList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CustomButton(buttonList[index]);
                }),
              
          ))
        ],
      ),
    );
  }
}
