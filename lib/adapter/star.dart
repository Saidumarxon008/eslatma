import 'package:hive/hive.dart';

part 'star.g.dart';

@HiveType(typeId:2)
class Star{
  @HiveField(2)
String star;
  Star({required this.star});
}