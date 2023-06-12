import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final BorderRadius? radius;
  final Function function;
  final double buttonwidth;
  CustomButton(
      {super.key,
      required this.text,
      this.radius,
      required this.function,
      required this.buttonwidth});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (() => function()),
      child: Material(color: Color.fromRGBO(30, 62, 160, 1),
        elevation: 5,
        borderRadius: radius ?? BorderRadius.circular(20),
        child: SizedBox(
          height: size.height / 17,
          width: size.width / buttonwidth,
          child: Text(textAlign:TextAlign.center,
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: size.width / 22,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
