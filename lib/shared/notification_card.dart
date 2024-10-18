import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final bool withButton = false;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundColor,
    bool withButton = false,
  });

  @override
  _NotificationCardState createState() => _NotificationCardState(
        title: title,
        description: description,
        backgroundColor: backgroundColor,
        withButton: withButton,
      );
}

class _NotificationCardState extends State<NotificationCard> {
  String title;
  String description;
  Color backgroundColor;
  bool withButton;

  _NotificationCardState({
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.withButton,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70, // Slight opacity
                fontSize: 14,
              ),
            ),
            if (withButton) const SizedBox(height: 10),
            if (withButton)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: const Text('Available Notifications'),
              ),
          ],
        ),
      ),
    );
  }
}
