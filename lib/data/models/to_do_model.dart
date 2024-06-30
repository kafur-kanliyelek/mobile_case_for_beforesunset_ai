import 'package:to_do_app/domain/entity/todo_entity.dart';

const String tableToDo = 'todoTable';

class ToDoFields {
  static final List<String> values = [id, title, tag, done, date];
  static const String id = '_id';
  static const String title = 'title';
  static const String tag = 'tag';
  static const String done = 'done';
  static const String date = 'date';
}

class ToDoModel extends ToDoEntity {
  ToDoModel({
    required super.title,
    super.tag,
    required super.done,
    required super.date,
  });

  Map<String, Object?> toJson() {
    return {
      ToDoFields.title: title,
      ToDoFields.tag: tag,
      ToDoFields.done: done ? 1 : 0,
      ToDoFields.date: date.toIso8601String(),
    };
  }

  static ToDoModel fromJson(Map<String, Object?> json) => ToDoModel(
        title: json[ToDoFields.title] as String,
        tag: json[ToDoFields.tag] as String,
        done: json[ToDoFields.done] == 1 ? true : false,
        date: DateTime.parse(json[ToDoFields.date] as String),
        //date: json[ToDoFields.date] as DateTime,
      );

  ToDoModel copy(
      {String? id, String? title, String? tag, bool? done, DateTime? date}) {
    return ToDoModel(
        title: title ?? this.title,
        tag: tag ?? this.tag,
        done: done ?? this.done,
        date: date ?? this.date);
  }
}
