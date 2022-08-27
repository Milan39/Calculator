import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final color;
  final textColor;
  final String ButtonText;
  final bottomtapped;

  const MyButton({this.color, this.textColor, required this.ButtonText, this.bottomtapped});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bottomtapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(child: Text(ButtonText, style: TextStyle(fontSize: 24,color: textColor),)),
          ),
        ),
      ),
    );
  }
}

