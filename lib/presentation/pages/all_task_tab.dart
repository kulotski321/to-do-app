import 'package:flutter/material.dart';

import 'package:to_do_app/data/task_model.dart';
import 'package:to_do_app/presentation/widgets/task_widget.dart';

class AllTaskTab extends StatefulWidget {
  final List<Task> tasksList = [
    Task(title: 'task 1'),
    Task(title: 'task 2'),
    Task(title: 'task 3'),
    Task(title: 'task 4'),
    Task(title: 'task 5'),
  ];

  AllTaskTab({Key? key}) : super(key: key);

  @override
  State<AllTaskTab> createState() => _AllTaskTabState();
}

class _AllTaskTabState extends State<AllTaskTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.tasksList.length,
            itemBuilder: ((context, index) {
              var task = widget.tasksList[index];
              return TaskWidget(title: task.title);
            })));
  }
}
