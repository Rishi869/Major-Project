import 'package:flutter/material.dart';
import 'package:hostel_management/screens/fee_screen.dart';
import 'package:hostel_management/screens/report_screen.dart';
import 'package:hostel_management/screens/room_screen.dart';
import 'package:hostel_management/screens/student_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: const Color(0xFF4A3636), // dark brown bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFlatCard(
              context,
              icon: Icons.person,
              label: "Students",
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StudentScreen()),
                );
              },
            ),
            _buildFlatCard(
              context,
              icon: Icons.meeting_room,
              label: "Rooms",
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RoomScreen()),
                );
              },
            ),
            _buildFlatCard(
              context,
              icon: Icons.attach_money,
              label: "Fees",
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FeeScreen()),
                );
              },
            ),
            _buildFlatCard(
              context,
              icon: Icons.bar_chart,
              label: "Reports",
              color: Colors.purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReportScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlatCard(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
