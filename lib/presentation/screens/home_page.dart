import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/screens/all_task_tab.dart';
import 'package:to_do_app/presentation/screens/complete_tab.dart';
import 'package:to_do_app/presentation/screens/incomplete_tab.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/bloc_exports.dart';
import '../../data/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  void _addNewTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            label: Text('Add a new task'),
                            border: OutlineInputBorder(),
                          ),
                          autofocus: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a task title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                textEditingController.clear();
                              },
                              child: const Text('cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                var uuid = const Uuid();
                                var newTask = Task(
                                  id: uuid.v4(),
                                  title: textEditingController.text,
                                );
                                context
                                    .read<TaskBloc>()
                                    .add(AddTask(task: newTask));
                                Navigator.pop(context);
                                textEditingController.clear();
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> allTasksList = state.allTasks;
        List<Task> completedTasksList = state.completedTasks;
        List<Task> incompleteTasksList = state.incompletetasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('To Do App'),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: _onPageChanged,
            children: [
              AllTaskTab(
                tasksList: allTasksList,
              ),
              CompleteTab(
                tasksList: completedTasksList,
              ),
              IncompleteTab(
                tasksList: incompleteTasksList,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'All',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: 'Complete',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle),
                label: 'Incomplete',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addNewTask(context),
            tooltip: 'Add task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
