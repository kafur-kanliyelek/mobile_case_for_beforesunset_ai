import 'package:to_do_app/domain/repository/todo_repository.dart';

class ReadToDoUseCase {
  final ToDoRepository todoRepository;

  ReadToDoUseCase({required this.todoRepository});

  call() {
    return todoRepository.readToDo();
  }
}
