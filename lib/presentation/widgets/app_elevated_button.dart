import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color color;
  final TextStyle? style;

  const AppElevatedButton({
    required this.onTap,
    required this.title,
    this.color = Colors.transparent,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(0.0),
        overlayColor: MaterialStateProperty.all(
          Colors.black.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
