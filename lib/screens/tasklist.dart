import 'package:flutter/material.dart';
import 'package:jenga_app/common_component/top_bar.dart';
import '../services/service.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          // Enable scrolling if content doesn't fit on the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning,
                size: 70,
                color: Color.fromARGB(255, 235, 74, 62),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("No Task Created"),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create-task');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set the button color to blue
                  ),
                  child: Text('Create Task'),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
