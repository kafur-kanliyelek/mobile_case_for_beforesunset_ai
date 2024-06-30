import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/todo_theme.dart';
import 'package:to_do_app/presentation/bloc/todo_bloc.dart';
import 'package:to_do_app/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Before Sunset',
      debugShowCheckedModeBanner: false,
      theme: themeProject,
      home: BlocProvider(
        create: (context) => TodoBloc()..add(ReadToDos()),
        child: const ToDoHome(),
      ),
    );
  }
}
