import 'package:flutter/material.dart';

class AddressSelectFeature extends StatefulWidget {
  const AddressSelectFeature({super.key});

  @override
  _AddressSelectFeatureState createState() => _AddressSelectFeatureState();
}

class _AddressSelectFeatureState extends State<AddressSelectFeature> {
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
    return Padding(
      padding: EdgeInsets.zero, // Use zero padding or customize as needed
      child: TextButton.icon(
        icon: const Icon(Icons.location_on, color: Color(0xFF7868D8)),
        label: const Row(
          children: [
            Text('Адрес доставки', style: TextStyle(color: Color(0xFFFFFFFF))),
            Icon(Icons.arrow_drop_down, color: Color(0xFF7868D8)),
          ],
        ),
        onPressed: _openAddressSelection,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
