import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/common_app_bar.dart';

class RequestAbsenceScreen extends StatelessWidget {
  const RequestAbsenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Attendance System'),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeaderBar(
            title: 'Request Absence',
            onBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text('Request Form',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Reason for Absence',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Start Date',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'End Date',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Upload logic
                  },
                  icon: const Icon(Icons.attach_file),
                  label: const Text('Choose File'),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Submit logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Request submitted')),
                    );
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Submit Request'),
                ),
                const Divider(height: 40),
                const Text('Previous Requests',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                _buildStatusTile(
                  status: 'Pending',
                  submitted: '2023-10-01',
                  resolved: '',
                  comment: 'Awaiting review',
                  color: Colors.yellow[100]!,
                ),
                _buildStatusTile(
                  status: 'Approved',
                  submitted: '2023-09-15',
                  resolved: '2023-09-20',
                  comment: 'Approved for medical reasons',
                  color: Colors.green[100]!,
                ),
                _buildStatusTile(
                  status: 'Rejected',
                  submitted: '2023-08-10',
                  resolved: '2023-08-12',
                  comment: 'Insufficient documentation',
                  color: Colors.red[100]!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTile({
    required String status,
    required String submitted,
    required String resolved,
    required String comment,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Submitted on: $submitted'),
          if (resolved.isNotEmpty) Text('$status on: $resolved'),
          Text('Admin comments: $comment'),
        ],
      ),
    );
  }
}
