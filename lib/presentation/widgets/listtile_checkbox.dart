import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/data_sources/local/data_source/local_datasource.dart';
import 'package:to_do_app/presentation/bloc/todo_bloc.dart';

class ListtileCheckbox extends StatelessWidget {
  const ListtileCheckbox({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: todoDB[index].done,
      onChanged: (value) {
        todoDB[index].done = value!;
        BlocProvider.of<TodoBloc>(context)
            .add(UpdateStatus(index: index, status: value));
      },
    );
  }
}
