import 'package:eslatma/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eslatma/ended/end3.dart';
import 'package:eslatma/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class EndIkki extends StatefulWidget {
  final int? index;

  const EndIkki({super.key, this.index});

  @override
  State<EndIkki> createState() => _EndedState();
}

class _EndedState extends State<EndIkki> {
  List bir=["iuuguygy"];
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      textEditingController =
          TextEditingController(text:
          textBox.getAt(widget.index!)!.content);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eslatmalarim "),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: const Text(
              "Tahrirlash",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
      body: Container(decoration: BoxDecoration(
        gradient: RadialGradient(
            center: const Alignment(-0.8, -0.3),
            colors: themeProvider.themeMode().gradientColors!),
      ),
        child: Column(
          children: [
            Expanded(
                child: ValueListenableBuilder(
                    valueListenable: textBox.listenable(),
                    builder: (context, value, child) {
                      return ListView.builder(
                          itemCount: bir.length,
                          itemBuilder: (context, index) {
                            {
                              return TextField(
                                controller: textEditingController,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20))),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => EndUch(
                                            index: widget.index,
                                          )));
                                },
                              );
                            }
                          });
                    }))
          ],
        ),
      ),
    );
  }
}