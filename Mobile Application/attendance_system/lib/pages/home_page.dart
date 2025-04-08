import 'package:flutter/material.dart';
import '../widgets/subject_card.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/common_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> subjects = const [
    'Mathematics',
    'Physics',
    'Chemistry',
    'Biology',
    'English',
    'History',
    'Geography',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Attendance System'),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: SafeArea(
        child: Column(
          children: [
            const SubHeaderBar(title: 'Home'),
            Expanded(
              child: Column(
                children: subjects
                    .map(
                      (subject) => Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: SubjectCard(subjectName: subject),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
