import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BookItem extends StatelessWidget {
  final QueryDocumentSnapshot book;
  final VoidCallback onDelete;

  const BookItem({super.key, required this.book, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = book.data() as Map<String, dynamic>;
    String title = data['title'] ?? 'No Title';
    String author = data['author'] ?? 'Unknown Author';
    Timestamp? createdAt = data['createdAt'];
    String dateStr = createdAt != null
        ? DateFormat('MMM d, yyyy HH:mm').format(createdAt.toDate())
        : 'Recently';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/default_book_cover.png',
            width: 50,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(author, style: TextStyle(color: Colors.blue[800])),
            const SizedBox(height: 4),
            Text(
              'Added: $dateStr',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.grey),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
