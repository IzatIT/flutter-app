import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231921), // Scaffold background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage(
                    'assets/images/profile.jpg'), // Replace with actual image
              ),
            ),
            const SizedBox(height: 16),
            // User Name
            const Center(
              child: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
            ),
            const Center(
              child: Text(
                'johndoe@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70, // Slightly lighter text
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Action Buttons Section
            const Text(
              'Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Action Buttons
            _buildActionButton(
              context,
              'Edit Profile',
              const Color(0xFF8AC186),
              Icons.edit,
              () {
                // Add your logic here
              },
            ),
            const SizedBox(height: 16),

            _buildActionButton(
              context,
              'Order History',
              const Color(0xFF7868D8),
              Icons.history,
              () {
                // Add your logic here
              },
            ),
            const SizedBox(height: 16),

            _buildActionButton(
              context,
              'Favorites',
              const Color(0xFF8AC186),
              Icons.favorite,
              () {
                // Add your logic here
              },
            ),
            const SizedBox(height: 16),

            _buildActionButton(
              context,
              'Account Settings',
              const Color(0xFF7868D8),
              Icons.settings,
              () {
                // Add your logic here
              },
            ),
            const SizedBox(height: 32),

            // Additional Sections
            const Text(
              'More Options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            _buildActionButton(
              context,
              'Log Out',
              const Color(0xFF7868D8),
              Icons.logout,
              () {
                // Add your logic here
              },
            ),
            const SizedBox(height: 16),

            _buildActionButton(
              context,
              'Help & Support',
              const Color(0xFF8AC186),
              Icons.help_outline,
              () {
                // Add your logic here
              },
            ),
            const SizedBox(height: 16),

            _buildActionButton(
              context,
              'Give Feedback',
              const Color(0xFF7868D8),
              Icons.feedback,
              () {
                // Add your logic here
              },
            ),
            const SizedBox(height: 32),

            const SizedBox(height: 50), // Add some space at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String title, Color color,
      IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Button color
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
