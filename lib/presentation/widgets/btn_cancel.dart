import 'package:flutter/material.dart';
import 'package:to_do_app/core/constants.dart';
import 'package:to_do_app/core/todo_theme.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    this.btnName = ProjectConstants.cancel,
    this.onPressed,
  });

  final String btnName;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: ProjectColors.mangoOrange.color),
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
        child: Text(btnName));
  }
}
