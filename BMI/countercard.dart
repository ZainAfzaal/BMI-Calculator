import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  CounterCard({
    required this.label,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 196, 196),
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          children: [
            Text(label, style: TextStyle(fontSize: 30)),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
                IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
