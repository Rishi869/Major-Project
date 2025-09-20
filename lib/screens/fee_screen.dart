import 'package:flutter/material.dart';

class FeeScreen extends StatefulWidget {
  const FeeScreen({super.key});

  @override
  State<FeeScreen> createState() => _FeeScreenState();
}

class _FeeScreenState extends State<FeeScreen> {
  final List<Map<String, String>> fees = [
    {"name": "John", "status": "Paid"},
    {"name": "Mary", "status": "Unpaid"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fee Management")),
      body: ListView.builder(
        itemCount: fees.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: ListTile(
              title: Text(fees[i]["name"]!),
              subtitle: Text("Status: ${fees[i]["status"]}"),
              trailing: IconButton(
                icon: const Icon(Icons.check_circle, color: Colors.green),
                onPressed: () {
                  setState(() {
                    fees[i]["status"] = "Paid";
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
