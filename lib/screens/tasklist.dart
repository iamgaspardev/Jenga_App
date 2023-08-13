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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        // Enable scrolling if content doesn't fit on the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blueGrey,
                    Colors.greenAccent
                  ], // Add your desired gradient colors here
                  stops: [0.0, 1.0], // Add stops for each color (optional)
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Manage : Mjini House",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Icon(
              Icons.warning,
              size: 70,
              color: Color.fromARGB(255, 235, 74, 62),
            ),
            const Padding(
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
                child: const Text('Create Task'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
