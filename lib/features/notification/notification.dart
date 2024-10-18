import 'package:flutter/material.dart';

class NotificationFeature extends StatefulWidget {
  const NotificationFeature({super.key});

  @override
  _NotificationFeature createState() => _NotificationFeature();
}

class _NotificationFeature extends State<NotificationFeature> {
  void _openAddressSelection() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              const Color(0xFF23232C), // Dark background for dialog
          title: const Text('Выберите адрес',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          content: const Text('Здесь будет выбор адреса доставки.',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          actions: <Widget>[
            TextButton(
              child: const Text('Закрыть',
                  style: TextStyle(color: Color(0xFF7868D8))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications, color: Color(0xFF7868D8)),
      onPressed: _openAddressSelection,
    );
  }
}
