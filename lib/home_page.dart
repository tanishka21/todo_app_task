import 'package:flutter/material.dart';
import 'package:todo_app_task/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List todoList = [
    ['Create a flutter project', false],

  ];

  void checkBoxChange(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.end,
          'Welcome to Todo App',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

      ),

      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChange: (value) => checkBoxChange(index),
              // deleteFunction: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add Your Todo Item.',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            )),
            FloatingActionButton(
              onPressed: saveNewTask,
              shape: const CircleBorder(),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
