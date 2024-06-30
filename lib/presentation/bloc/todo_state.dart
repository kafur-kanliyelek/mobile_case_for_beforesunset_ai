part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class LoadingState extends TodoState {}

final class LoadedState extends TodoState {
  final List todoList;

  const LoadedState({required this.todoList});

  @override
  List<Object> get props => [todoList];
}
