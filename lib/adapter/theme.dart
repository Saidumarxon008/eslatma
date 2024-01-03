import 'package:hive/hive.dart';

part 'theme.g.dart';

@HiveType(typeId: 0)
class Theme {
  @HiveField(1)
  bool isLightTheme;

  Theme({required this.isLightTheme});
}
