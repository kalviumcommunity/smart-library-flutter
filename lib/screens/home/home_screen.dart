import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/auth_service.dart';
import '../../services/firestore_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bookController = TextEditingController();
  final _authorController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.user;

    if (user == null) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Library Home'),
        actions: [
          IconButton(
            onPressed: () => authService.logout(),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${user.email}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Add a Favorite Book:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _bookController,
              decoration: const InputDecoration(labelText: 'Book Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_bookController.text.isNotEmpty &&
                    _authorController.text.isNotEmpty) {
                  await _firestoreService.addBook(
                    user.uid,
                    _bookController.text.trim(),
                    _authorController.text.trim(),
                  );
                  _bookController.clear();
                  _authorController.clear();
                }
              },
              child: const Text('Save to Firestore'),
            ),
            const Divider(height: 40),
            const Text(
              'Your Saved Books:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestoreService.getBooksStream(user.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final docs = snapshot.data?.docs ?? [];
                  if (docs.isEmpty) return const Text('No books saved yet.');

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final data = docs[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['title'] ?? 'No Title'),
                        subtitle: Text(data['author'] ?? 'Unknown Author'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _firestoreService.deleteBook(
                            user.uid,
                            docs[index].id,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
