import 'package:test/test.dart';
import 'package:to_do_list_app/models/task.dart';
import 'package:to_do_list_app/models/todo_list.dart';

void main() {
  group('Task model', () {
    test('creates with a title and defaults to not completed', () {
      final task = Task(title: 'Buy milk');
      expect(task.title, equals('Buy milk'));
      expect(task.completed, isFalse);
    });

    test('can be marked completed', () {
      final task = Task(title: 'Write tests');
      task.completed = true;
      expect(task.completed, isTrue);
    });
  });

  group('TodoList model', () {
    test('creates with a name and empty tasks list by default', () {
      final todoList = TodoList(name: 'My List');
      expect(todoList.name, equals('My List'));
      expect(todoList.tasks, isEmpty);
    });

    test('can contain provided tasks', () {
      final task1 = Task(title: 'Task 1');
      final task2 = Task(title: 'Task 2', completed: true);
      final todoList = TodoList(name: 'List with tasks', tasks: [task1, task2]);

      expect(todoList.tasks, hasLength(2));
      expect(todoList.tasks.first.title, equals('Task 1'));
      expect(todoList.tasks.last.completed, isTrue);
    });
  });
}

