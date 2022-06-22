import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/widgets/task.dart';

import '../../data/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: ((context, index) {
          var task = taskList[index];
          return TaskWidget(task: task);
        }),
      ),
    );
  }
}
