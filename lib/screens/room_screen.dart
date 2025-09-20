import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rooms = List.generate(10, (i) => "Room ${i + 1}");
    return Scaffold(
      appBar: AppBar(title: const Text("Rooms")),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: ListTile(
              title: Text(rooms[i]),
              subtitle: Text(i % 2 == 0 ? "Occupied" : "Available"),
            ),
          );
        },
      ),
    );
  }
}
