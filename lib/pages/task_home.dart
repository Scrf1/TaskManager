import 'package:flutter/material.dart';
import 'package:frontend/models/task_add_page.dart';
import 'package:frontend/models/task_priorities.dart';
import 'package:frontend/models/task_statuses.dart';

import '../models/task.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskHomeState();

}

class _TaskHomeState extends State<TaskHome> {

  List<Task> task = [
    Task(1, 'Yep', 'My first thing', TaskStatus.ongoing, '12/12/2022', TaskPriorities.high),
    Task(2, 'Yep2', 'My first thing', TaskStatus.undone, '12/12/2022', TaskPriorities.low),
    Task(3, 'Yep3', 'My first thing', TaskStatus.ongoing, '12/12/2022', TaskPriorities.tooLow),
    Task(4, 'Yep4', 'My first thing', TaskStatus.done, '12/12/2022', TaskPriorities.high),
    Task(5, 'Yep5', 'My first thing', TaskStatus.ongoing, '12/12/2022', TaskPriorities.urgent),
    Task(6, 'Yep5', 'My first thing', TaskStatus.ongoing, '12/12/2022', TaskPriorities.medium),
    Task(6, 'Yep5', 'My first thing', TaskStatus.ongoing, '12/12/2022', TaskPriorities.tooLow),
    Task(6, 'Yep5', 'My first thing', TaskStatus.ongoing, '12/12/2022', TaskPriorities.medium),

  ];
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: ListView(
        children: _displayListElement(task),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<ListTile> _displayListElement(List<Task> tasks) {
    if(tasks == null) {
      return <ListTile>[];
    }

    return tasks.map((task) {
      return ListTile(
              title: Text(task.title),
              subtitle: Row(
                children: [
                  Text("Deadline: ${task.deadLine}   ", style: const TextStyle(fontSize: 10)),
                  Text("Status: ${_getStateName(task.state)}",
                      style: TextStyle(fontSize: 10, color: _getTaskColor(task.state), fontWeight: FontWeight.bold) )
                ],
              ),
              leading: _getPriority(task.priority),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TaskPage(task);
                }));
              }
      );
    }).toList();
  }

  Color _getTaskColor(TaskStatus status) {
    Color c = Colors.black;
    switch(status) {
      case TaskStatus.done:
        c = Colors.teal;
        break;
      case TaskStatus.ongoing:
        c = Colors.indigoAccent;
        break;
      default:
        c;
        break;
    }

    return c;
  }

  String _getStateName(TaskStatus status) {
    String name = "";
    switch(status) {
      case TaskStatus.done:
        name = "Done";
        break;
      case TaskStatus.ongoing:
        name = "Ongoing";
        break;
      case TaskStatus.undone:
        name = "Undone";
        break;
      default:
        name ;
        break;
    }
    return name;
  }

  Icon _getPriority(TaskPriorities priority) {
    Icon i;
    const double size = 14;
    switch(priority) {
      case TaskPriorities.urgent:
        i = const Icon(Icons.arrow_upward, color: Colors.green, size: size,);
        break;
      case TaskPriorities.high:
        i = const Icon(Icons.arrow_upward, color: Colors.lightGreenAccent, size: size,);
        break;
      case TaskPriorities.medium:
        i = const Icon(Icons.commit, color: Colors.black, size: size,);
        break;
      case TaskPriorities.low:
        i = const Icon(Icons.arrow_downward, color: Colors.orangeAccent,size: size,);
        break;
      case TaskPriorities.tooLow:
        i = const Icon(Icons.arrow_downward, color: Colors.red,size: size,);
        break;
      default:
        i = const Icon(Icons.commit, color: Colors.black, size: size,);
        break;
    }

    return i;
  }

}