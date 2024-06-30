import 'package:flutter/material.dart';
import 'package:to_do_app/core/todo_theme.dart';
import 'package:to_do_app/data/data_sources/local/data_source/local_datasource.dart';

class ListtileTitle extends StatelessWidget {
  const ListtileTitle({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      todoDB[index].title,
      style: TextStyle(
          color: todoDB[index].done
              ? ProjectColors.haborMist.color
              : ProjectColors.blackisBack.color,
          decoration: todoDB[index].done
              ? TextDecoration.lineThrough
              : TextDecoration.none),
    );
  }
}
