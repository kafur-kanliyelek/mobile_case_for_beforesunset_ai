import 'package:to_do_app/domain/repository/todo_repository.dart';

class UpdateTodoUseCase {
  final ToDoRepository todoRepository;

  UpdateTodoUseCase({required this.todoRepository});

  call(int index, String tag) {
    return todoRepository.updateToDo(index, tag);
  }
}
