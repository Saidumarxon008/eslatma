import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eslatma/MyApp.dart';
import 'package:eslatma/adapter/todo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
late Box<ToDo> textBox;
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrangeAccent,
      systemNavigationBarColor: Colors.deepOrangeAccent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());
  textBox = await Hive.openBox("textBox");
  runApp(const HomePage());
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
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        );
      },
    );
  }
}
