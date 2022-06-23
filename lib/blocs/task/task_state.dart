part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  final List<Task> completedTasks;
  final List<Task> incompletetasks;

  const TaskState({
    this.allTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.incompletetasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks, completedTasks, incompletetasks];
}
