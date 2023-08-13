import 'package:flutter/material.dart';

import '../common_component/top_bar.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class Worker {
  String name;
  double salary;

  Worker(this.name, this.salary);
}

class Tool {
  String name;
  int quantity;
  double amount;

  Tool(this.name, this.quantity, this.amount);
}

class _CreateTaskState extends State<CreateTask> {
  int _activeStepIndex = 0;

  TextEditingController taskDescription = TextEditingController();
  TextEditingController workerName = TextEditingController();
  TextEditingController totalbudget = TextEditingController();
  TextEditingController workerSalary = TextEditingController();
  TextEditingController toolName = TextEditingController();
  TextEditingController toolQuantity = TextEditingController();
  TextEditingController toolAmount = TextEditingController();
  List<Worker> workers = [];
  List<Tool> tools = [];

  List<Step> stepList() {
    return [
      Step(
        isActive: _activeStepIndex == 0,
        state: _activeStepIndex > 0 ? StepState.complete : StepState.indexed,
        title: const Text('Task'),
        content: Column(
          children: [
            TextField(
              controller: taskDescription,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task Description',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                controller: totalbudget,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Total Budget',
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        isActive: _activeStepIndex == 1,
        state: _activeStepIndex > 1
            ? StepState.complete
            : (_activeStepIndex == 1 ? StepState.editing : StepState.indexed),
        title: const Text('Workers'),
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: workerName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Worker Name',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: workerSalary,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Salary',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      workers.add(Worker(
                          workerName.text, double.parse(workerSalary.text)));
                      workerName.clear();
                      workerSalary.clear();
                    });
                  },
                  child: const Text('Add Worker'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (workers.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Workers List:'),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      const TableRow(
                        children: [
                          TableCell(child: Text('Name')),
                          TableCell(child: Text('Salary')),
                        ],
                      ),
                      for (var worker in workers)
                        TableRow(
                          children: [
                            TableCell(child: Text(worker.name)),
                            TableCell(
                                child: Text(worker.salary.toStringAsFixed(2))),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
      Step(
        isActive: _activeStepIndex == 2,
        state: _activeStepIndex > 2
            ? StepState.complete
            : (_activeStepIndex == 2 ? StepState.editing : StepState.indexed),
        title: const Text('Tools'),
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: toolName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tool Name',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: toolQuantity,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantity',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: toolAmount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tools.add(
                    Tool(
                      toolName.text,
                      int.parse(toolQuantity.text),
                      double.parse(toolAmount.text),
                    ),
                  );
                  toolName.clear();
                  toolQuantity.clear();
                  toolAmount.clear();
                });
              },
              child: const Text('Add Tool'),
            ),
            const SizedBox(height: 10),
            if (tools.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tools List:'),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      const TableRow(
                        children: [
                          TableCell(child: Text('Name')),
                          TableCell(child: Text('Quantity')),
                          TableCell(child: Text('Amount')),
                        ],
                      ),
                      for (var tool in tools)
                        TableRow(
                          children: [
                            TableCell(child: Text(tool.name)),
                            TableCell(child: Text(tool.quantity.toString())),
                            TableCell(
                                child: Text(tool.amount.toStringAsFixed(2))),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
      Step(
        isActive: _activeStepIndex == 3,
        state: _activeStepIndex > 3
            ? StepState.complete
            : (_activeStepIndex == 3 ? StepState.editing : StepState.indexed),
        title: const Text('Confirm'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Task Description: ${taskDescription.text}'),
            const SizedBox(height: 10),
            if (workers.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Workers List:'),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      const TableRow(
                        children: [
                          TableCell(child: Text('Name')),
                          TableCell(child: Text('Salary')),
                        ],
                      ),
                      for (var worker in workers)
                        TableRow(
                          children: [
                            TableCell(child: Text(worker.name)),
                            TableCell(
                                child: Text(worker.salary.toStringAsFixed(2))),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 10),
            if (tools.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tools List:'),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      const TableRow(
                        children: [
                          TableCell(child: Text('Name')),
                          TableCell(child: Text('Quantity')),
                          TableCell(child: Text('Amount')),
                        ],
                      ),
                      for (var tool in tools)
                        TableRow(
                          children: [
                            TableCell(child: Text(tool.name)),
                            TableCell(child: Text(tool.quantity.toString())),
                            TableCell(
                                child: Text(tool.amount.toStringAsFixed(2))),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            print('Submitted');
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
        controlsBuilder:
            (BuildContext context, ControlsDetails controlsDetails) {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Container(
            child: Row(
              children: [
                if (_activeStepIndex != 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controlsDetails.onStepCancel,
                      child: const Text('Back'),
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: controlsDetails.onStepContinue,
                    child:
                        isLastStep ? const Text('Submit') : const Text('Next'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
