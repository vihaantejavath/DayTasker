import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference _getUserTaskCollection() {
    User? user = _auth.currentUser;
    if (user == null) {
      throw Exception('No user logged in');
    }
    return FirebaseFirestore.instance.collection('users').doc(user.uid).collection('tasks');
  }
  // Create: Add a new task
  Future<void> addTask(String task, bool isCompleted) {
    return _getUserTaskCollection().add({
      'task': task,
      'isCompleted': isCompleted,
      'timestamp': Timestamp.now(),
    });
  }

  // Read: Get tasks from Firestore
  Stream<List<Map<String, dynamic>>> getTasks() {
    return _getUserTaskCollection().orderBy('timestamp').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'task': doc['task'],
          'isCompleted': doc['isCompleted'],
          'timestamp': doc['timestamp']
        };
      }).toList();
    });
  }

  // Update: Update tasks given a doc ID
  Future<void> updateTask(String id, String task, bool isCompleted) {
    return _getUserTaskCollection().doc(id).update({
      'task': task,
      'isCompleted': isCompleted,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete: Delete tasks given a doc ID
  Future<void> deleteTask(String id) {
    return _getUserTaskCollection().doc(id).delete();
  }
}
