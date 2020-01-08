import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Function checkboxCallback;
  final String taskTitle;
  final bool isChecked;
  final Function longpressCallback;
  final bool isThreeLine;
  TaskTile(
      {this.longpressCallback,
      this.taskTitle,
      this.isChecked,
      this.checkboxCallback,
      this.isThreeLine});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return null;
//   }
// }

// void checkboxCallback(bool checkboxState) {
//     setState(() {
//       isChecked = checkboxState;
//       print(checkboxState);
//     });
//   }

// class TaskCheckbox extends StatelessWidget {
//   final bool checkboxState;
//   final Function toggleCheckboxState;
//   TaskCheckbox(this.checkboxState, this.toggleCheckboxState);

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
