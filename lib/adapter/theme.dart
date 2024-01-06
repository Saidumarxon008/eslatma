import 'package:hive/hive.dart';

part 'theme.g.dart';

@HiveType(typeId: 3)
class Theme {
  @HiveField(3)
  bool isLightTheme;

  Theme({required this.isLightTheme});
}
