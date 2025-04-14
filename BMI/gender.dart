import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final String gender;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  GenderButton({
    required this.gender,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? Colors.blueAccent
                    : const Color.fromARGB(255, 200, 196, 196),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(icon, size: 40),
              SizedBox(height: 20),
              Text(
                gender,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
