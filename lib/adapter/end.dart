import 'package:hive/hive.dart';

part 'end.g.dart';

@HiveType(typeId: 0)
class Endi {
  @HiveField(0)
  String end;

  Endi({required this.end});
}