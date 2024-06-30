import 'package:to_do_app/domain/repository/todo_repository.dart';

class CreateToDoUseCase {
  final ToDoRepository todoRepository;

  CreateToDoUseCase({required this.todoRepository});

  call({required String title, required DateTime date, String? tag}) {
    todoRepository.createToDo(title, date, tag);
  }
}
