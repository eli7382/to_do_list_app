class Validators {
  static String? nonEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  /// Validate that a task title is provided and not excessively long.
  static String? taskTitle(String? value) {
    final error = nonEmpty(value);
    if (error != null) {
      return 'Task title cannot be empty';
    }
    if (value!.length > 100) {
      return 'Task title is too long';
    }
    return null;
  }

  /// Validate that a list name is provided and not excessively long.
  static String? listName(String? value) {
    final error = nonEmpty(value);
    if (error != null) {
      return 'List name cannot be empty';
    }
    if (value!.length > 50) {
      return 'List name is too long';
    }
    return null;
  }

  /// Validate a due date string. It must be a valid date in the future.
  static String? dueDate(String? value) {
    final error = nonEmpty(value);
    if (error != null) {
      return 'Due date is required';
    }
    final parsed = DateTime.tryParse(value!);
    if (parsed == null) {
      return 'Invalid date format';
    }
    if (parsed.isBefore(DateTime.now())) {
      return 'Due date must be in the future';
    }
    return null;
  }
}

