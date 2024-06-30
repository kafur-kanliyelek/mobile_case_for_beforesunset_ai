import 'package:to_do_app/domain/repository/todo_repository.dart';

class DeleteToDoUseCase {
  final ToDoRepository todoRepository;

  DeleteToDoUseCase({required this.todoRepository});

  call(id) {
    return todoRepository.deleteToDo(id);
  }
}
