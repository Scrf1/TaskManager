import 'package:flutter/material.dart';
import 'package:frontend/models/task.dart';

class TaskPage extends StatefulWidget {

  Task? task;
  TaskPage([task]);

  @override
  State<StatefulWidget> createState() => TaskPageState();

}

class TaskPageState extends State<TaskPage> {

  final _formKey = GlobalKey<FormState>();
  TextStyle textStyle = const TextStyle();
  String? priority = 'urgent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Builder(
            builder: (context) => Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text("Title", style: textStyle,)],),
                  TextFormField(
                    decoration: const InputDecoration(filled: true),
                  ),
                  SizedBox(height: 15,),

                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text("Description", style: textStyle)],),
                  TextFormField(
                    decoration: const InputDecoration(filled: true),
                  ),

                  SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text("Priority", style: textStyle)],),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          value: priority,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              priority = newValue!;
                            });
                          },
                          items: <String>['urgent', 'high', 'medium', 'low', 'tooLow']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
                  )
                ],
              ),
            )
          )
        ),
      )
    );
  }

}