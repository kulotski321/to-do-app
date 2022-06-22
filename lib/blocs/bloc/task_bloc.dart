import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(event.task),
      completedTasks: List.from(state.completedTasks),
      incompletetasks: List.from(state.incompletetasks)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = state.allTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> incompleteTasks = state.incompletetasks;

    final int index = state.allTasks.indexOf(task);
    allTasks = List.from(state.allTasks)..remove(task);

    task.isCompleted == false
        ? {
            allTasks.insert(index, task.copyWith(isCompleted: true)),
            completedTasks = List.from(state.completedTasks)
              ..add(
                task.copyWith(isCompleted: true),
              ),
            incompleteTasks = List.from(state.incompletetasks)..remove(task),
          }
        : {
            allTasks.insert(index, task.copyWith(isCompleted: false)),
            completedTasks = List.from(state.completedTasks)..remove(task),
            incompleteTasks = List.from(state.incompletetasks)
              ..add(
                task.copyWith(isCompleted: false),
              ),
          };

    emit(TaskState(
      allTasks: allTasks,
      completedTasks: completedTasks,
      incompletetasks: incompleteTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    List<Task> completedTasks = List.from(state.completedTasks)..remove(task);
    List<Task> incompleteTasks = List.from(state.incompletetasks)..remove(task);

    emit(TaskState(
      allTasks: allTasks,
      completedTasks: completedTasks,
      incompletetasks: incompleteTasks,
    ));
  }
}
