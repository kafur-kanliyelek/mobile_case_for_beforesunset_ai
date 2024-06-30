part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class ReadToDos extends TodoEvent {}

final class CreateToDoItem extends TodoEvent {
  final ToDoEntity todoItem;

  const CreateToDoItem({required this.todoItem});

  @override
  List<Object> get props => [todoItem];
}

final class DeleteToDoItem extends TodoEvent {
  final int index;

  const DeleteToDoItem({required this.index});

  @override
  List<Object> get props => [index];
}

//Tag word changes
final class UpdateToDoItem extends TodoEvent {
  final int index;
  final String tag;

  const UpdateToDoItem({required this.tag, required this.index});

  @override
  List<Object> get props => [index, tag];
}

final class UpdateStatus extends TodoEvent {
  final int index;
  final bool status;

  const UpdateStatus({required this.index, required this.status});

  @override
  List<Object> get props => [index, status];
}
