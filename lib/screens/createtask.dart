// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jenga_app/common_component/top_bar.dart';

import '../services/service.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  String? budget;
  String? projectName;
  String? leaderName;
  String? category;
  String? projectSupervisor;
  String? startDate;
  String? endDate;

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final service = Services();
      final success = await service.createProject(
        projectName!,
        leaderName!,
        projectSupervisor!,
        category!,
        startDate!,
        endDate!,
        budget!,
      );

      if (success) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to create project.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                Container(
                  height: 80,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
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
                        "Align Your Task of : Jenga Nasi",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter task',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Task to continue';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    projectName = value;
                  },
                ),
                // const SizedBox(height: 16),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Enter Leader Name',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter the leader name';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     leaderName = value;
                //   },
                // ),
                // const SizedBox(height: 16),
                // DropdownButtonFormField<String>(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Select Category',
                //   ),
                //   items: ['Road Construction', 'House Construction', 'Others']
                //       .map((String category) {
                //     return DropdownMenuItem<String>(
                //       value: category,
                //       child: Text(category),
                //     );
                //   }).toList(),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       category = newValue;
                //     });
                //   },
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please select a category';
                //     }
                //     return null;
                //   },
                // ),
                // const SizedBox(height: 16),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Enter Project Supervisor',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter the project supervisor';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     projectSupervisor = value;
                //   },
                // ),
                // const SizedBox(height: 16),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Enter Budget',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter project budget';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     budget = value;
                //   },
                // ),
                // const SizedBox(height: 16),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Enter Start Date',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter the start date';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     startDate = value;
                //   },
                // ),
                // const SizedBox(height: 16),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Enter End Date',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter the end date';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     endDate = value;
                //   },
                // ),
                //
                 const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 150, // Set the desired width of the button
                      child: ElevatedButton(
                        onPressed: _saveForm,
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
