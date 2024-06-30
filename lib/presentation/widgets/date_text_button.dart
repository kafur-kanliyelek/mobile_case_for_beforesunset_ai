import 'package:flutter/material.dart';
import 'package:to_do_app/core/constants.dart';

class DateTextButton extends StatelessWidget {
  DateTextButton({
    super.key,
    required this.context2,
    required this.date,
  });

  final BuildContext context2;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          DateTime? picked = await showDatePicker(
              context: context2,
              firstDate: DateTime.now(),
              lastDate: DateTime(ProjectConstants.lastTimeForDatePicker));
          date = picked;
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(ProjectConstants.datePickerIcon),
            SizedBox(width: 4),
            Text(ProjectConstants.addDate),
          ],
        ));
  }
}
