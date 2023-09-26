import 'package:flutter/material.dart';

import '../models/task.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              CheckboxChange: (newValue) {
                taskData.updateTask(taskData.tasks[index]);
              },
              listTileDelte: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}





class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) CheckboxChange;
  final void Function() listTileDelte;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.CheckboxChange,
      required this.listTileDelte});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: CheckboxChange,
      ),
      onLongPress: listTileDelte,
    );
  }
}
