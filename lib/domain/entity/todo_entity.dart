// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ToDoEntity extends Equatable {
  String title;
  String? tag;
  DateTime date;

  bool done;
  ToDoEntity({
    required this.title,
    this.tag,
    required this.date,
    required this.done,
  });

  @override
  List<Object?> get props => [title, date];
}
