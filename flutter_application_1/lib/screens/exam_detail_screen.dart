import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {

 
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours%24;

    return Scaffold(
      appBar: AppBar(title: Text(exam.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Датум и време: ${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year} ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2,'0')}'),
            const SizedBox(height: 8),
            Text('Лабораториио: ${exam.rooms.join(', ')}'),
            const SizedBox(height: 16),
                       Text(
              isPast ? 'Испитот е завршен': 'Преостанато време до испит: $days дена, $hours часа',
              style: TextStyle(
                fontSize: 18,
                color: isPast ? Colors.red : Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
