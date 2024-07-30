import 'package:daytasker/models/firestore.dart';
import 'package:daytasker/components/dialogue_box.dart';
import 'package:daytasker/components/todo_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Optionally add any initialization code
  }

  void saveNewTask() {
    _firestoreService.addTask(_controller.text, false);
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(String id) {
    _firestoreService.deleteTask(id);
  }

  void checkBoxChanged(bool? value, String id, String task, bool isCompleted) {
    _firestoreService.updateTask(id, task, !isCompleted);
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 20, 33, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 35, 48, 1),
        title: Center(
          child: Text(
            'DayTasker',
            style: TextStyle(
              color: Color.fromRGBO(208, 214, 214, 1),
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout, color: Color.fromARGB(255, 203, 197, 197)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _firestoreService.getTasks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TodoTile(
                taskName: task['task'],
                taskCompleted: task['isCompleted'],
                onChanged: (value) => checkBoxChanged(value, task['id'], task['task'], task['isCompleted']),
                deleteFunction: (context) => deleteTask(task['id']),
              );
            },
          );
        },
      ),
    );
  }
}

