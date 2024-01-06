import 'package:hive/hive.dart';

part 'end.g.dart';

@HiveType(typeId: 1)
class Endi {
  @HiveField(1)
  String end;

  Endi({required this.end});
}
