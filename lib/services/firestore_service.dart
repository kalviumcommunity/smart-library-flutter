import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save initial user data
  Future<void> saveUserData(
    String uid,
    String name,
    String favoriteGenre,
  ) async {
    await _db.collection('users').doc(uid).set({
      'name': name,
      'favoriteGenre': favoriteGenre,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Get stream of books for a specific user
  Stream<QuerySnapshot> getBooksStream(String uid) {
    return _db
        .collection('users')
        .doc(uid)
        .collection('books')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Add book for a specific user
  Future<void> addBook(String uid, String title, String author) async {
    await _db.collection('users').doc(uid).collection('books').add({
      'title': title,
      'author': author,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Delete book for a specific user
  Future<void> deleteBook(String uid, String bookId) async {
    await _db
        .collection('users')
        .doc(uid)
        .collection('books')
        .doc(bookId)
        .delete();
  }
}
