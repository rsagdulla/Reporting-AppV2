class UserFields {
  static final String or = "OR";
  static final String task = "Task";
  static final String date = "Date";

  static List<String> getFields() => [or, task, date];
}

class TODO {
  final String or;
  final String task;
  final String date;

  const TODO({
    required this.or,
    required this.task,
    required this.date,
  });

  static TODO fromJson(Map<String, dynamic> json) => TODO(
        or: json[UserFields.or],
        task: json[UserFields.task],
        date: json[UserFields.date],
      );
}
