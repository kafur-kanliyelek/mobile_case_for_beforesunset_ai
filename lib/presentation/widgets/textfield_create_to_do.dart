import 'package:flutter/material.dart';
import 'package:to_do_app/core/constants.dart';

class CreateToDoTextField extends StatelessWidget {
  CreateToDoTextField({
    super.key,
    required this.title,
  });

  String? title;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        title = value;
      },
      decoration: const InputDecoration(
          border: InputBorder.none, hintText: ProjectConstants.todoHintText),
    );
  }
}
