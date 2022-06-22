import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/screens/all_task_tab.dart';
import 'package:to_do_app/presentation/screens/complete_tab.dart';
import 'package:to_do_app/presentation/screens/incomplete_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: [
          AllTaskTab(),
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
    );
  }
}
