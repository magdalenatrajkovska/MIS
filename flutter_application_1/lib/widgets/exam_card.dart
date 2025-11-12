import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget{
  final Exam exam;

   const ExamCard({Key? key, required this.exam}) : super(key: key);


@override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Card(
      color: isPast ? Colors.orange[300] : Colors.green[100],
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(exam.name, style: const TextStyle(fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text('${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text('${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2,'0')}'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );

  }
}