import '../models/exam.dart';
import 'package:flutter/material.dart';
import '../widgets/exam_card.dart';

final List<Exam> exams=[
 Exam(
    name: 'Strukturno',
    dateTime: DateTime(2025, 7, 15, 9, 0),
    rooms: ['223', '334'],
  ),
   Exam(
    name: 'APS',
    dateTime: DateTime(2025, 12, 16, 13, 30),
    rooms: ['223', '334'],
  ),
  Exam(
    name: 'MIS',
    dateTime: DateTime(2025, 12, 17, 10, 0),
    rooms: ['103'],
  ),
    Exam(
    name: 'VNP',
    dateTime: DateTime(2025, 12, 18, 14, 0),
    rooms: ['104', '105'],
  ),
    Exam(
    name: 'BAzi',
    dateTime: DateTime(2025, 12, 19, 9, 30),
    rooms: ['106'],
  ),
    Exam(
    name: 'CyberSec',
    dateTime: DateTime(2025, 12, 20, 11, 0),
    rooms: ['107'],
  ),
  Exam(
    name: 'OOP',
    dateTime: DateTime(2025, 12, 21, 13, 0),
    rooms: ['108'],
  ),
  Exam(
    name: 'OS',
    dateTime: DateTime(2025, 12, 22, 9, 0),
    rooms: ['109'],
  ),
  Exam(
    name: 'VVKn',
    dateTime: DateTime(2025, 12, 23, 14, 0),
    rooms: ['110'],
  ),
  Exam(
    name: 'SI',
    dateTime: DateTime(2025, 12, 24, 10, 30),
    rooms: ['111'],
  ),

];

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedExams = List<Exam>.from(exams)..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Распоред за испити - 223156'),
        
      ),
      body: ListView.builder(
        itemCount: sortedExams.length,
        itemBuilder: (context, index) {
          return ExamCard(exam: sortedExams[index]);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.list_alt, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}