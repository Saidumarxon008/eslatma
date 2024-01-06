import 'package:eslatma/add.dart';
import 'package:eslatma/contap.dart';
import 'package:eslatma/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eslatma/ended/end3.dart';
import 'package:eslatma/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

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
    if (widget.index != null) {
      textEditingController =
          TextEditingController(text:
          endBox.getAt(widget.index!)!.end);
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
                    valueListenable: endBox.listenable(),
                    builder: (context, value, child) {
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: endBox.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                            child: MaterialButton(
                              onLongPress: () {},
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Contap(
                                          index: index,
                                        ))).then((value) {
                                  setState(() {});
                                });
                              },
                              child: SwipeableTile(
                                borderRadius: 20,
                                color: Colors.yellow,
                                swipeThreshold: 0.1,
                                direction: SwipeDirection.horizontal,
                                onSwiped: (direction) {
                                  if (direction ==
                                      SwipeDirection.startToEnd) {
                                    setState(() {
                                      endBox.deleteAt(index);
                                    });
                                  } else if (direction ==
                                      SwipeDirection.endToStart) {
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Add(
                                                index: index,
                                              ))).then((value) {
                                        setState(() {});
                                      });
                                    }
                                  }
                                },
                                backgroundBuilder:
                                    (context, direction, progress) {
                                  if (direction ==
                                      SwipeDirection.endToStart) {
                                  } else if (direction ==
                                      SwipeDirection.startToEnd) {
                                    return Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: const Icon(
                                        MaterialCommunityIcons.delete_sweep,
                                      ),
                                    );
                                  }
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: const Icon(FontAwesome.edit),
                                  );
                                },
                                key: UniqueKey(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                MaterialCommunityIcons
                                                    .checkbox_blank_circle_outline)),
                                      ],
                                    ),
                                    MaterialButton(
                                      onPressed: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            color: Colors.yellow),
                                        child: Expanded(
                                          child: Text(
                                            endBox.getAt(index)?.end??
                                                "null",
                                            textAlign: TextAlign.center,
                                            style:
                                            const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}