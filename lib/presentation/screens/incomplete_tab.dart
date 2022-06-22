import 'package:flutter/material.dart';
import 'package:to_do_app/data/task_model.dart';
import 'package:to_do_app/presentation/widgets/task.dart';

class IncompleteTab extends StatefulWidget {
  final List<Task> tasksList;

  const IncompleteTab({Key? key, required this.tasksList}) : super(key: key);

  @override
  State<IncompleteTab> createState() => _AllTaskTabState();
}

class _AllTaskTabState extends State<IncompleteTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.tasksList.length,
            itemBuilder: ((context, index) {
              var task = widget.tasksList[index];
              return TaskWidget(task: task);
            })));
  }
}
