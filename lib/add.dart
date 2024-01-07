import 'package:eslatma/MyApp.dart';
import 'package:flutter/material.dart';
import 'package:eslatma/adapter/todo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'theme/theme.dart';

class Add extends StatefulWidget {
  final int? index;

  const Add({super.key, this.index});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController textEditingController = TextEditingController();
  bool _icon = true;

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      textEditingController =
          TextEditingController(text: textBox.getAt(widget.index!)!.content);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            center: const Alignment(-0.8, -0.3),
            colors: themeProvider.themeMode().gradientColors!),
      ),
      child: Column(children: [
        Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              TextField(
                controller: textEditingController,
                textAlignVertical: TextAlignVertical.center,
                minLines: 1,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.deepOrange,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 70),
                  hintText: "  Yozuv",
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 30.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.deepOrange,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Fontisto.picture),
                        SizedBox(
                          width: 20.w,
                        ),
                        const Icon(Feather.check_circle),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 40,),
              Container(
                color: Colors.deepOrange,
                child: ExpansionTile(
                  title: const Text('Vaqt'),
                  onExpansionChanged: (bool expanded) {
                    if (_icon == true) {
                      setState(() {
                        _icon = false;
                      });
                    } else if (_icon == false) {
                      setState(() {
                        _icon = true;
                      });
                    }
                  },
                  trailing: Icon(_icon
                      ? Icons.toggle_off_outlined
                      : Icons.toggle_on_rounded),
                  children: const [
                    Column(
                      children: [],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 40.h,
          color: Colors.black,
          // decoration: BoxDecoration(
          //   gradient: RadialGradient(
          //       center: const Alignment(-0.8, -0.3),
          //       colors: themeProvider.themeMode().gradientColors!),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MyApp()),
                      (route) => false);
                },
                color: Colors.deepOrange[700],
                colorBrightness: Brightness.light,
                splashColor: Colors.grey,
                child: const Text(
                  "Bekor qil",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (widget.index == null) {
                    ToDo toDo = ToDo(content: textEditingController.text);
                    textBox.add(toDo);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const MyApp()),
                        (route) => false);
                  } else {
                    ToDo toDo = ToDo(content: textEditingController.text);
                    textBox.putAt(widget.index!, toDo);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const MyApp()),
                        (route) => false);
                  }
                },
                color: Colors.deepOrange[700],
                child: const Text(
                  "Saqlash",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
