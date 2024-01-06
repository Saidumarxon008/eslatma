import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class ToDo {
  @HiveField(0)
  String content;

  ToDo({required this.content});
}