import 'package:flutter/material.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import 'request_absence_screen.dart';

class SubjectReportScreen extends StatefulWidget {
  final String subject;

  const SubjectReportScreen({super.key, required this.subject});

  @override
  State<SubjectReportScreen> createState() => _SubjectReportScreenState();
}

class _SubjectReportScreenState extends State<SubjectReportScreen> {
  late String selectedSubject;

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
  void initState() {
    super.initState();
    selectedSubject = widget.subject;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Attendance System'),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: SafeArea(
        child: Column(
          children: [
            SubHeaderBar(
              title: 'Report',
              onBack: () => Navigator.pop(context),
              trailing: DropdownButton<String>(
                value: selectedSubject,
                underline: const SizedBox(),
                items: subjects.map((subject) {
                  return DropdownMenuItem(
                    value: subject,
                    child: Text(subject, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null && newValue != selectedSubject) {
                    setState(() {
                      selectedSubject = newValue;
                    });
                  }
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Attendance Overview',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const Positioned(
                          left: 10,
                          child: Text('75%',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Total Sessions: 25'),
                    const Text('Attended: 15'),
                    const Text('Attendance late : 5'),
                    const Text('Percentage: 75%'),
                    const SizedBox(height: 20),
                    const Divider(),
                    const Text('Detailed List',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // Table inside fixed height box
                    Container(
                      constraints: const BoxConstraints(maxHeight: 280),
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(2),
                            3: FlexColumnWidth(4),
                          },
                          border: TableBorder.all(color: Colors.black12),
                          children: [
                            _buildHeaderRow(),
                            ..._getRowsForSubject(selectedSubject),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // Request Absence button outside scroll view
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RequestAbsenceScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.request_page),
                  label: const Text('Request Absence (Permit)'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return const TableRow(
      decoration: BoxDecoration(color: Color(0xFFEDEDED)),
      children: [
        Padding(padding: EdgeInsets.all(8), child: Text('Date')),
        Padding(padding: EdgeInsets.all(8), child: Text('Session')),
        Padding(padding: EdgeInsets.all(8), child: Text('Status')),
        Padding(padding: EdgeInsets.all(8), child: Text('Remarks')),
      ],
    );
  }

  List<TableRow> _getRowsForSubject(String subject) {
    final data = {
      'Mathematics': [
        ['02/01/2023', 'Calculus', 'Absent', 'Excused Absence'],
        ['03/01/2023', 'Algebra', 'Present', 'On time'],
        ['04/01/2023', 'Geometry', 'Late', '5 min late'],
      ],
      'Physics': [
        ['01/01/2023', 'Thermodynamics', 'Present', 'On time'],
        ['02/01/2023', 'Optics', 'Late', '10 min late'],
      ],
      'Chemistry': [
        ['03/01/2023', 'Organic Chemistry', 'Absent', 'Unexcused'],
      ],
      'Biology': [
        ['04/01/2023', 'Genetics', 'Present', 'On time'],
      ],
      'English': [
        ['05/01/2023', 'Grammar', 'Late', '5 min late'],
      ],
      'History': [
        ['06/01/2023', 'Modern History', 'Absent', 'Excused'],
      ],
      'Geography': [
        ['07/01/2023', 'Climatology', 'Present', 'On time'],
      ],
    };

    final rows = data[subject] ?? [];

    return rows.map((entry) {
      final icon = _buildStatusIcon(entry[2]);
      return TableRow(
        children: [
          _buildTableCell(entry[0]),
          _buildTableCell(entry[1]),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                icon,
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    entry[2],
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          _buildTableCell(entry[3]),
        ],
      );
    }).toList();
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }

  Widget _buildStatusIcon(String status) {
    if (status == 'Present') {
      return const Icon(Icons.check, color: Colors.green, size: 18);
    } else if (status == 'Absent') {
      return const Icon(Icons.close, color: Colors.red, size: 18);
    } else {
      return const Icon(Icons.access_time, color: Colors.orange, size: 18);
    }
  }
}
