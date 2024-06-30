import 'package:flutter/material.dart';
import 'package:to_do_app/core/constants.dart';
import 'package:to_do_app/data/data_sources/local/data_source/local_datasource.dart';

class ListtileSubtitleAddTag extends StatelessWidget {
  const ListtileSubtitleAddTag({
    super.key,
    required this.index,
    this.onPressed,
  });

  final int index;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(todoDB[index].tag ?? ProjectConstants.addTag),
    );
  }
}
