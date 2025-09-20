import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalStudents = 20;
    int availableRooms = 5;
    int pendingFees = 7;

    return Scaffold(
      appBar: AppBar(title: const Text("Reports")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Students: $totalStudents", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Available Rooms: $availableRooms", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Pending Fees: $pendingFees", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
