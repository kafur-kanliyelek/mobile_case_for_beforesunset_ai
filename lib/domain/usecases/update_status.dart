import 'package:to_do_app/domain/repository/todo_repository.dart';

class UpdateStatusUseCase {
  final ToDoRepository todoRepository;

  UpdateStatusUseCase({required this.todoRepository});

  call(int index, bool status) {
    return todoRepository.updateStatus(index, status);
  }
}
