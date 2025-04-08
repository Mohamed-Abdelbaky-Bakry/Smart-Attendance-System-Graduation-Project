import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/common_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Attendance System'),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeaderBar(
            title: 'Notifications',
            onBack: () => Navigator.pop(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add mark-all-as-read logic here
                },
                child: const Text('Mark All as Read',
                    style: TextStyle(color: Colors.teal)),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                NotificationCard(
                    title: 'Missed Attendance',
                    subtitle: 'You missed a session on 12/05/2024',
                    label: 'Alert'),
                NotificationCard(
                    title: 'Lecture Late',
                    subtitle: 'You are 5 minutes late for the lecture',
                    label: 'Update'),
                NotificationCard(
                    title: 'New Message',
                    subtitle: 'You have a new message from John Doe',
                    label: 'Alert'),
                NotificationCard(
                    title: 'Notice',
                    subtitle: 'Your next lecture is at Room 302 at 10:55',
                    label: 'Update'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title, subtitle, label;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: label == 'Alert' ? Colors.red : Colors.blue,
          ),
        ),
      ),
    );
  }
}
