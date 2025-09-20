class Student {
  final int? id;
  final String name;
  final String room;
  final String feeStatus;

  Student({this.id, required this.name, required this.room, required this.feeStatus});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'room': room, 'feeStatus': feeStatus};
  }
}
