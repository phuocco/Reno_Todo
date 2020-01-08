import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:todo/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 600,
            child: Image.asset(
              'assets/image.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            child: Text(
              "Todo",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            top: 40,
            left: 20,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Consumer<TaskData>(
                      builder: (context, taskData, child) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return TaskTile(
                              taskTitle: taskData.tasks[index].name,
                              isChecked: taskData.tasks[index].isDone,
                              checkboxCallback: (bool checkboxState) {
                                taskData.updateTask(taskData.tasks[index]);
                              },
                              longpressCallback: () {
                                taskData.deleteTask(taskData.tasks[index]);
                              },
                            );
                          },
                          controller: scrollController,
                          itemCount: taskData.taskCount,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(Icons.add, color: Colors.white),
                      backgroundColor: Colors.greenAccent,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => AddTaskScreen(),
                        );
                      },
                    ),
                    top: -30,
                    right: 30,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
