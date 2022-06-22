import 'package:flutter/material.dart';

import 'package:to_do_app/data/task_model.dart';

import '../widgets/task_list.dart';

class AllTaskTab extends StatefulWidget {
  final List<Task> tasksList;

  const AllTaskTab({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  @override
  State<AllTaskTab> createState() => _AllTaskTabState();
}

class _AllTaskTabState extends State<AllTaskTab> {
  @override
  Widget build(BuildContext context) {
    return TaskList(taskList: widget.tasksList);
  }
}
