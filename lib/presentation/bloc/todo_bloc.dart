import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/data/data_sources/local/data_source/local_datasource.dart';
import 'package:to_do_app/data/repository/repository_impl.dart';
import 'package:to_do_app/domain/repository/todo_repository.dart';
import 'package:to_do_app/domain/entity/todo_entity.dart';
import 'package:to_do_app/domain/usecases/create_todo.dart';
import 'package:to_do_app/domain/usecases/delete_todo.dart';
import 'package:to_do_app/domain/usecases/update_status.dart';
import 'package:to_do_app/domain/usecases/update_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<CreateToDoItem>(createToDoItemEvent);
    on<ReadToDos>(readToDosEvent);
    on<DeleteToDoItem>(deleteToDoItemEvent);
    on<UpdateToDoItem>(updateToDoItemEvent);
    on<UpdateStatus>(updateStatusEvent);
  }

  createToDoItemEvent(CreateToDoItem event, emit) {
    emit(LoadingState());

    CreateToDoUseCase(
            todoRepository: ToDoRepositoryImpl(dataSource: DataSourceImpl()))
        .call(
            title: event.todoItem.title,
            date: event.todoItem.date,
            tag: event.todoItem.tag);

    emit(LoadedState(todoList: List.from(todoDB)));
  }

  readToDosEvent(ReadToDos event, emit) {
    emit(LoadingState());
    emit(LoadedState(todoList: todoDB));
  }

  deleteToDoItemEvent(DeleteToDoItem event, emit) {
    DeleteToDoUseCase(
            todoRepository: ToDoRepositoryImpl(dataSource: DataSourceImpl()))
        .call(event.index);
    emit(LoadingState());
    emit(LoadedState(todoList: todoDB));
  }

  updateToDoItemEvent(UpdateToDoItem event, emit) {
    UpdateTodoUseCase(
            todoRepository: ToDoRepositoryImpl(dataSource: DataSourceImpl()))
        .call(event.index, event.tag);
    DataSourceImpl().updateToDo(event.index, event.tag);
    emit(LoadingState());
    emit(LoadedState(todoList: todoDB));
  }

  updateStatusEvent(UpdateStatus event, emit) {
    UpdateStatusUseCase(
            todoRepository: ToDoRepositoryImpl(dataSource: DataSourceImpl()))
        .call(event.index, event.status);

    emit(LoadingState());
    emit(LoadedState(todoList: todoDB));
  }
}
