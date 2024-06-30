import 'package:to_do_app/data/models/to_do_model.dart';

abstract class DataSource {
  createToDo(String title, DateTime date, String? tag);
  readToDo();
  updateToDo(int index, String tag);
  updateStatus(int index, bool status);
  deleteToDo(id);
}

List<ToDoModel> todoDB = [
  ToDoModel(title: 'Lorem ipsum', done: false, date: DateTime.now()),
  ToDoModel(
      title: 'Lorem ipsum dolor sit amet', done: false, date: DateTime.now()),
  ToDoModel(title: 'Lorem ipsum dolor', done: false, date: DateTime.now())
];

class DataSourceImpl extends DataSource {
  @override
  createToDo(String title, DateTime date, String? tag) {
    return todoDB
        .add(ToDoModel(title: title, done: false, date: date, tag: tag));
  }

  @override
  deleteToDo(id) {
    todoDB.removeAt(id);
  }

  @override
  readToDo() {
    return todoDB;
  }

  @override
  updateToDo(int index, String tag) {
    todoDB[index].tag = tag;
  }

  @override
  updateStatus(int index, bool status) {
    todoDB[index].done = status;
  }
}
