abstract class ToDoRepository {
  createToDo(String title, DateTime date, String? tag);
  readToDo();
  updateToDo(int index, String tag);
  updateStatus(int index, bool status);
  deleteToDo(id);
}
