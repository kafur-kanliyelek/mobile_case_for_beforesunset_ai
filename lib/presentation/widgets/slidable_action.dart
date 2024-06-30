import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/core/todo_theme.dart';

class SlidableActionWidget extends StatelessWidget {
  const SlidableActionWidget({
    super.key,
    required this.icon,
    this.onPressed,
  });
  final IconData icon;
  final Function(BuildContext)? onPressed;
  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: onPressed,
      icon: icon,
      foregroundColor: ProjectColors.aquaLake.color,
    );
  }
}
