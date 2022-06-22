import 'package:flutter/material.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';

import '../../data/task_model.dart';

class TaskWidget extends StatefulWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.title),
      value: widget.task.isCompleted,
      onChanged: (value) {
        context.read<TaskBloc>().add(UpdateTask(task: widget.task));
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
