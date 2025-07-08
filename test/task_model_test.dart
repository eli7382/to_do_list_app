import 'package:test/test.dart';
import 'package:to_do_list_app/models/task.dart';

void main() {
  test('Task toJson and fromJson', () {
    final task = Task(
      id: '1',
      title: 'Test',
      description: 'desc',
      dueDate: DateTime.parse('2023-01-01'),
      completed: true,
      priority: 1,
      notes: 'note',
    );

    final json = task.toJson();
    final fromJson = Task.fromJson(json);

    expect(fromJson.id, equals('1'));
    expect(fromJson.title, equals('Test'));
    expect(fromJson.description, equals('desc'));
    expect(fromJson.dueDate, equals(DateTime.parse('2023-01-01')));
    expect(fromJson.completed, isTrue);
    expect(fromJson.priority, equals(1));
    expect(fromJson.notes, equals('note'));
  });
}
