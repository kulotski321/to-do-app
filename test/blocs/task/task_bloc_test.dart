import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';
import 'package:to_do_app/data/task_model.dart';

void main() {
  TaskBloc buildBloc() {
    return TaskBloc();
  }

  group('constructor', () {
    test('works properly', () {
      expect(buildBloc, returnsNormally);
    });

    test('has correct initial state', () {
      expect(buildBloc().state, equals(const TaskState()));
    });
  });

  group('AddTask', () {
    final mockTask = Task(id: 'id', title: 'title', isCompleted: false);
    blocTest<TaskBloc, TaskState>('emits new state with the added task',
        build: buildBloc,
        act: (bloc) => bloc.add(AddTask(task: mockTask)),
        expect: () => [
              TaskState(
                allTasks: [mockTask],
                incompletetasks: [mockTask],
                completedTasks: const [],
              )
            ]);
  });

  group('UpdateTask', () {
    final mockTask = Task(id: 'id', title: 'title', isCompleted: false);
    final updatedTask = Task(id: 'id', title: 'title', isCompleted: true);
    blocTest<TaskBloc, TaskState>('emits new state with the updated task',
        build: buildBloc,
        seed: () => TaskState(
              allTasks: [mockTask],
              incompletetasks: [mockTask],
              completedTasks: const [],
            ),
        act: (bloc) => bloc.add(UpdateTask(task: mockTask)),
        expect: () => [
              TaskState(
                allTasks: [updatedTask],
                incompletetasks: const [],
                completedTasks: [updatedTask],
              )
            ]);
  });

  group('DeleteTask', () {
    final mockTask = Task(id: 'id', title: 'title', isCompleted: false);
    blocTest<TaskBloc, TaskState>('emits new state with the deleted task',
        build: buildBloc,
        seed: () => TaskState(
              allTasks: [mockTask],
              incompletetasks: [mockTask],
              completedTasks: const [],
            ),
        act: (bloc) => bloc.add(DeleteTask(task: mockTask)),
        expect: () => [
              const TaskState(
                allTasks: [],
                incompletetasks: [],
                completedTasks: [],
              )
            ]);
  });
}
