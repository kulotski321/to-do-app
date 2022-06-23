import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';
import 'package:to_do_app/data/task_model.dart';

void main() {
  group('Task state', () {
    final mockTaskComplete = Task(id: 'id', title: 'title', isCompleted: true);
    final mockTaskIncomplete =
        Task(id: 'id', title: 'title', isCompleted: false);

    TaskState createSubject({
      List<Task> allTasks = const [],
      List<Task> completedTasks = const [],
      List<Task> incompleteTasks = const [],
    }) {
      return TaskState(
          allTasks: allTasks,
          completedTasks: completedTasks,
          incompletetasks: incompleteTasks);
    }

    test('supports value equality', () {
      expect(createSubject(), equals(createSubject()));
    });

    test('props are correct', () {
      expect(
          createSubject(
              allTasks: [mockTaskComplete, mockTaskIncomplete],
              completedTasks: [mockTaskComplete],
              incompleteTasks: [mockTaskIncomplete]).props,
          equals(TaskState(
              allTasks: [mockTaskComplete, mockTaskIncomplete],
              completedTasks: [mockTaskComplete],
              incompletetasks: [mockTaskIncomplete]).props));
    });
  });
}
