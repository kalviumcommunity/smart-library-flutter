import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collectionPath = 'books_demo';

  // Get stream of books
  Stream<QuerySnapshot> getBooksStream() {
    return _db
        .collection(collectionPath)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Add book
  Future<void> addBook(String title, String author, {String? imageUrl}) async {
    await _db.collection(collectionPath).add({
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Update book
  Future<void> updateBook(
    String id,
    String title,
    String author, {
    String? imageUrl,
  }) async {
    await _db.collection(collectionPath).doc(id).update({
      'title': title,
      'author': author,
      if (imageUrl != null) 'imageUrl': imageUrl,
    });
  }

  // Delete book
  Future<void> deleteBook(String id) async {
    await _db.collection(collectionPath).doc(id).delete();
  }
}
