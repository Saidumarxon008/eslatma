import 'package:eslatma/theme/constant.dart';
import 'package:eslatma/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eslatma/MyApp.dart';
import 'package:eslatma/adapter/todo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'adapter/end.dart';
late Box<ToDo> textBox;
late Box<Endi> endBox;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrangeAccent,
      systemNavigationBarColor: Colors.deepOrangeAccent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLightTheme = prefs.getBool(SPref.isLight) ?? true;
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());
  textBox = await Hive.openBox("textBox");
  Hive.registerAdapter(EndiAdapter());
  endBox = await Hive.openBox("endBox");
  runApp(AppStart(isLightTeme: isLightTheme,),);
}
class AppStart extends StatelessWidget {
   const AppStart({super.key, required this.isLightTeme});

  final bool isLightTeme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isLightTheme: isLightTeme),),
    ],
        child: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  final int? index;

  const HomePage({super.key, this.index});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData(),
          home: const MyApp(),
        );
      },
    );
  }
}
