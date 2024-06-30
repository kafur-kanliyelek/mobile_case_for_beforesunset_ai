import 'package:flutter/material.dart';

class ProjectConstants {
  static const String dateFormat = 'EEE, MMM d';

  static const circularLoadingBar = Center(child: CircularProgressIndicator());
  static const IconData actionPaneFirstItem = Icons.play_arrow_outlined;
  static const IconData actionPaneSecondItem = Icons.reply;
  static const IconData actionPaneThirdItem = Icons.delete;
  static const IconData addIcon = Icons.add;
  static const IconData appBarBackIcon = Icons.arrow_back_outlined;
  static const IconData datePickerIcon = Icons.date_range_rounded;

  static const int lastTimeForDatePicker = 2100;

  static const String addTag = '+ Add Tag';
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const String cancel = 'Cancel';
  static const String createToDo = 'Create To Do';
  static const String deleteToDoWarningText =
      'Do you want to delete your to-do permanently ?';
  static const String addDate = 'Add date';
  static const String todoHintText = 'Type your to-do here';
  static const String restOfTheWeek = 'Rest of the week';
  static const String later = 'Later';
  static const String tomorrow = 'Tomorrow';
  static const String today = 'Today';
}
