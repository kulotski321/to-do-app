import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final String title;

  const TaskWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: _isCompleted,
      onChanged: _onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  void _onChanged(bool? newStatus) {
    setState(() {
      _isCompleted = newStatus!;
    });
  }
}
