import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  MyTextButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return Theme.of(context).colorScheme.primary;
              }
              return Theme.of(context).colorScheme.surface;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.black;
              }
              return Colors.white;
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontWeight: FontWeight.w900,
            fontSize: MediaQuery.of(context).size.width * 0.01,
          ),
        ),
      ),
    );
  }
}
