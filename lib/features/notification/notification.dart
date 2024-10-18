import 'package:first_app/shared/notification_card.dart';
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
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF23232C),
            child: Column(
              children: [
                // Header: Back icon (left) and Notification icon (right)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                        // Action for notification icon, you can add more functionality
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Body: Cards for notifications
                Expanded(
                  child: ListView(
                    children: const [
                      NotificationCard(
                        title: 'Notification 1',
                        description:
                            'This is the description of the notification 1',
                        backgroundColor: const Color(0xFF7868D8),
                      ),
                      NotificationCard(
                        title: 'Notification 2',
                        description:
                            'This is the description of the notification 2',
                        backgroundColor: const Color(0xFF8AC186),
                        withButton: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
