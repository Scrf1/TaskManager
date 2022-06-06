import 'package:frontend/models/task_priorities.dart';
import 'package:frontend/models/task_statuses.dart';

class Task {
  int? id;
  String title;
  String description;
  TaskStatus state;
  String deadLine;
  TaskPriorities priority;
  List<String>? links;
  List<String>? files;

  Task(this.id, this.title, this.description, this.state, this.deadLine,
    this.priority, [this.links, this.files]);
}