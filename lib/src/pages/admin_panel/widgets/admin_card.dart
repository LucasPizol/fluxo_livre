import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const AdminCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 80.0,
                color: Colors.white,
              ),
            ),
            Container(
              color: Colors.black.withAlpha(70),
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
