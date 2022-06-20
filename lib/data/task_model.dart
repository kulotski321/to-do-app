import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isCompleted;

  Task({
    required this.title,
    this.isCompleted,
  }) {
    isCompleted = isCompleted ?? false;
  }

  Task copyWith({
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      isCompleted: map['isCompleted'],
    );
  }

  @override
  List<Object?> get props => [title, isCompleted];
}
