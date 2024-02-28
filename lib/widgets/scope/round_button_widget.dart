import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onClick;

  const RoundButtonWidget(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
