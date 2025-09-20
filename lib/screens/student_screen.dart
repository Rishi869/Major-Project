import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/student.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<Student> students = [];
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController roomCtrl = TextEditingController();
  String feeStatus = "Unpaid";

  void _loadStudents() async {
    final data = await DBHelper.getStudents();
    setState(() {
      students = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  void _addStudent() async {
    if (nameCtrl.text.isEmpty || roomCtrl.text.isEmpty) return;
    await DBHelper.insertStudent(
      Student(name: nameCtrl.text, room: roomCtrl.text, feeStatus: feeStatus),
    );
    nameCtrl.clear();
    roomCtrl.clear();
    _loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Name")),
                TextField(controller: roomCtrl, decoration: const InputDecoration(labelText: "Room")),
                DropdownButton<String>(
                  value: feeStatus,
                  items: ["Paid", "Unpaid"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (val) => setState(() => feeStatus = val!),
                ),
                ElevatedButton(onPressed: _addStudent, child: const Text("Add Student")),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(students[i].name),
                  subtitle: Text("Room: ${students[i].room}, Fee: ${students[i].feeStatus}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
