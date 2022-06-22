import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/screens/all_task_tab.dart';
import 'package:to_do_app/presentation/screens/complete_tab.dart';
import 'package:to_do_app/presentation/screens/incomplete_tab.dart';

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
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    const Text(
                      'Add a new task',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        label: Text('Task name'),
                        border: OutlineInputBorder(),
                      ),
                      autofocus: true,
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
                            var newTask =
                                Task(title: textEditingController.text);
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
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('To Do App'),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: _onPageChanged,
            children: [
              AllTaskTab(
                tasksList: tasksList,
              ),
              CompleteTab(),
              IncompleteTab(),
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
