import 'package:database_app/Screens/Dashboard.dart';
import 'package:database_app/Screens/Task.dart';
import 'package:database_app/Screens/Task_Work.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTaskScreen extends StatefulWidget {
  Task_Model task_model;
  int? id;
  EditTaskScreen({super.key, required this.task_model, required this.id});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Screen"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${widget.task_model.name}"),
            SizedBox(
              height: 30,
            ),
            Text("Description: ${widget.task_model.description}"),
            SizedBox(
              height: 30,
            ),
            Text("Date: ${widget.task_model.date}"),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() async {
                    var task_model1 = Task_Model();
                    task_model1.id = widget.id;
                    task_model1.name = widget.task_model.name;
                    task_model1.description = widget.task_model.description;
                    task_model1.date = widget.task_model.date;
                    task_model1.priority = "Completed";
                    var service = Taskservice();
                    await service.updateservice(task_model1);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoardScreen(),
                        ));
                  });
                },
                child: Text("Completed"))
          ],
        ),
      ),
    );
  }
}
