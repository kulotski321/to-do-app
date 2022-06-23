import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';
import 'package:to_do_app/data/task_model.dart';

void main() {
  group('Task events', () {
    group('AddTask', () {
      test('supports value equality', () {
        expect(
            AddTask(
                task: Task(
              id: 'id',
              title: 'title',
            )),
            equals(AddTask(task: Task(id: 'id', title: 'title'))));
      });

      test('props are correct', () {
        expect(
          AddTask(task: Task(id: 'id', title: 'title')).props,
          equals([Task(id: 'id', title: 'title')]),
        );
      });
    });

    group('UpdateTask', () {
      test('supports value equality', () {
        expect(
            UpdateTask(
                task: Task(
              id: 'id',
              title: 'title',
            )),
            equals(UpdateTask(task: Task(id: 'id', title: 'title'))));
      });

      test('props are correct', () {
        expect(
          UpdateTask(task: Task(id: 'id', title: 'title')).props,
          equals([Task(id: 'id', title: 'title')]),
        );
      });
    });

    group('DeleteTask', () {
      test('supports value equality', () {
        expect(
            DeleteTask(
                task: Task(
              id: 'id',
              title: 'title',
            )),
            equals(DeleteTask(task: Task(id: 'id', title: 'title'))));
      });

      test('props are correct', () {
        expect(
          DeleteTask(task: Task(id: 'id', title: 'title')).props,
          equals([Task(id: 'id', title: 'title')]),
        );
      });
    });
  });
}
