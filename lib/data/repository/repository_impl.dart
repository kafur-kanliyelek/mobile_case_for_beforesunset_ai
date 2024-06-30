import 'package:to_do_app/data/data_sources/local/data_source/local_datasource.dart';
import 'package:to_do_app/domain/repository/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  final DataSourceImpl dataSource;

  ToDoRepositoryImpl({required this.dataSource});
  @override
  createToDo(String title, DateTime date, String? tag) {
    dataSource.createToDo(title, date, tag);
  }

  @override
  deleteToDo(id) {
    dataSource.deleteToDo(id);
  }

  @override
  readToDo() {
    dataSource.readToDo();
  }

  @override
  updateStatus(int index, bool status) {
    dataSource.updateStatus(index, status);
  }

  @override
  updateToDo(int index, String tag) {
    dataSource.updateToDo(index, tag);
  }
}
