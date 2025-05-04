import 'package:flutter/material.dart';

class StepList extends StatelessWidget {
  final int currentIndex;
  final List<String> locations;

  StepList({required this.currentIndex, required this.locations});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Steps", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Divider(),
          for (int i = 0; i < locations.length; i++)
            ListTile(
              title: Text(locations[i]),
              leading: Icon(
                Icons.circle,
                color: i == currentIndex ? Colors.deepPurple : Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
