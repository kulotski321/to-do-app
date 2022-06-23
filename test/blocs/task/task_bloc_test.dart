import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/blocs/bloc_exports.dart';

void main() {
  TaskBloc taskBloc = TaskBloc();

  tearDown(() {
    taskBloc.close();
  });

  test('TaskBloc should have initial state as [TaskState]', () {
    expect(taskBloc.state.runtimeType, TaskState);
  });
}
