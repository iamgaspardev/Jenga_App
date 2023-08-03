import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditableTable(),
    );
  }
}

class EditableTable extends StatefulWidget {
  @override
  _EditableTableState createState() => _EditableTableState();
}

class _EditableTableState extends State<EditableTable> {
  List<Map<String, String>> tableData = [
    {
      'rowLabel': 'Mchanga',
      'column1': '',
      'column2': '',
      'column3': '',
      'column4': ''
    },
    {
      'rowLabel': 'Vifaa',
      'column1': '',
      'column2': '',
      'column3': '',
      'column4': ''
    },
    {
      'rowLabel': 'Koleo',
      'column1': '',
      'column2': '',
      'column3': '',
      'column4': ''
    },
    {
      'rowLabel': 'Fuso',
      'column1': '',
      'column2': '',
      'column3': '',
      'column4': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill All Requirenments Needed',style: TextStyle(fontSize: 18)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 30.0,
            dataRowHeight: 48.0,
            headingRowHeight: 48.0,
            columns: const [
              DataColumn(label: Text('Label')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Quantity')),
              DataColumn(label: Text('Unit')),
              DataColumn(label: Text('Salary')),
            ],
            rows: tableData.map((data) {
              return DataRow(cells: [
                DataCell(Text(data['rowLabel'] ?? '')),
                DataCell(
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Amount',
                      contentPadding: EdgeInsets.zero,
                    ),
                    initialValue: data['column1'] ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        data['column1'] = newValue;
                      });
                    },
                  ),
                ),
                DataCell(
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Quantity',
                      contentPadding: EdgeInsets.zero,
                    ),
                    initialValue: data['column2'] ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        data['column2'] = newValue;
                      });
                    },
                  ),
                ),
                DataCell(
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Unit',
                      contentPadding: EdgeInsets.zero,
                    ),
                    initialValue: data['column3'] ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        data['column3'] = newValue;
                      });
                    },
                  ),
                ),
                DataCell(
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Salary',
                      contentPadding: EdgeInsets.zero,
                    ),
                    initialValue: data['column4'] ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        data['column4'] = newValue;
                      });
                    },
                  ),
                ),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
