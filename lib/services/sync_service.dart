import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo_list.dart';
import '../models/task.dart';

/// Service that synchronizes todo lists and tasks with Firebase Cloud Firestore.
///
/// The service exposes streams for real-time updates and persists data locally
/// using Firestore's built-in offline capabilities.
class SyncService {
  final FirebaseFirestore _firestore;

  SyncService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _firestore.settings = const Settings(persistenceEnabled: true);
  }

  /// Watches all todo lists in Firestore.
  Stream<List<TodoList>> watchTodoLists() {
    return _firestore.collection('todoLists').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return TodoList(name: data['name'] as String);
      }).toList();
    });
  }

  /// Adds a new todo list to Firestore.
  Future<DocumentReference> addTodoList(TodoList list) async {
    return _firestore.collection('todoLists').add({'name': list.name});
  }

  /// Updates an existing todo list document.
  Future<void> updateTodoList(String id, TodoList list) async {
    await _firestore.collection('todoLists').doc(id).set({'name': list.name});
  }

  /// Deletes a todo list from Firestore.
  Future<void> deleteTodoList(String id) async {
    await _firestore.collection('todoLists').doc(id).delete();
  }

  /// Watches tasks of a specific todo list document.
  Stream<List<Task>> watchTasks(String listId) {
    return _firestore
        .collection('todoLists')
        .doc(listId)
        .collection('tasks')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Task(
                  title: doc['title'] as String,
                  completed: doc['completed'] as bool? ?? false,
                ))
            .toList());
  }

  /// Adds a task to the given todo list.
  Future<DocumentReference> addTask(String listId, Task task) async {
    return _firestore.collection('todoLists').doc(listId).collection('tasks').add({
      'title': task.title,
      'completed': task.completed,
    });
  }

  /// Updates an existing task document.
  Future<void> updateTask(String listId, String taskId, Task task) async {
    await _firestore
        .collection('todoLists')
        .doc(listId)
        .collection('tasks')
        .doc(taskId)
        .set({'title': task.title, 'completed': task.completed});
  }

  /// Deletes a task from a todo list.
  Future<void> deleteTask(String listId, String taskId) async {
    await _firestore
        .collection('todoLists')
        .doc(listId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }
}
