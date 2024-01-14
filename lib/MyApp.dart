// ignore_for_file: non_constant_identifier_names, file_names, unrelated_type_equality_checks

import 'dart:math';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:eslatma/main.dart';
import 'package:eslatma/star.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';
import 'package:eslatma/adapter/todo.dart';
import 'package:eslatma/add.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:eslatma/contap.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'ended/end2.dart';
import 'theme/theme.dart';
import 'adapter/end.dart';

class MyApp extends StatefulWidget {
  final int? index;

  const MyApp({
    super.key,
    this.index,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  bool _flag = true;
  late AnimationController _controller;
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  TextEditingController textEditingController = TextEditingController();
  bool shouldCheck = false;
  bool shouldCheckDefault = false;
  bool icon = false;

  int selectedindex = -1;
  int selectedIndex = 0;

  double textfieldwith = 220.w;
  double fabSize = 55;
  double conwidth = 20.w;
  double FiconS = 40;
  double fi = 25;
  double fik = 40;
  double cw = 20.w;
  double txtw = 310;
  double txtv = 220;
  double fs = 35;
  double fz = 55;
  List<ToDo> list = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    if (widget.index != null) {
      textEditingController =
          TextEditingController(text: textBox.getAt(widget.index!)!.content);
    }
    getList();
  }

  getList() async {
    for (int i = 0; i < textBox.length; i++) {
      list.add(textBox.getAt(i)!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final hintTextList = [
      "Bozorga borish",
      "Hayvonot bog'iga borish",
      'Maktabga borish',
      "Qarindoshlarni ko'rgani borish",
      'Sut harid qilish',
      'Kalitning joyi',
      '7:00 da suv ichish',
      'Shanba tish doktori',
      'Uy Vazifasi',
      '15:00 da dori ichish',
      '9:00 da sport zal',
      'Mushukka ovqat berish',
    ];
    String randomHintText = hintTextList[random.nextInt(hintTextList.length)];
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onVerticalDragEnd: (value) {
        setState(() {
          _key.currentState?.closeSlider();
          _flag = true;
        });
      },
      onTap: () {
        setState(() {
          FocusManager.instance.primaryFocus?.unfocus();
          _flag = true;
          FiconS = FiconS == fi ? fik : fik;
          conwidth = cw == 1.w ? cw.w : cw.w;
          fabSize = fabSize == fz ? fz : fz;
          textfieldwith = textfieldwith == txtv ? txtv : txtv;
          icon = false;
        });
      },
      child: Scaffold(
        body: SliderDrawer(
          key: _key,
          sliderOpenSize: 210,
          splashColor: Colors.deepOrange,
          appBar: SliderAppBar(
            appBarColor:
                (themeProvider.isLightTheme) ? Colors.black : Colors.deepOrange,
            drawerIcon: AnimatedIconButton(
              onPressed: () {
                if (_flag) {
                  _controller.forward();
                  setState(() {
                    _key.currentState?.openSlider();
                  });
                } else {
                  _controller.reverse();
                  setState(() {
                    _key.currentState?.closeSlider();
                  });
                }
                _flag = !_flag;
              },
              icons: const <AnimatedIconItem>[
                AnimatedIconItem(
                    icon: Icon(
                  MaterialCommunityIcons.hamburger,
                  // color: (themeProvider.isLightTheme)
                  //     ? Colors.deepOrangeAccent
                  //     : Colors.black,
                )),
                AnimatedIconItem(
                    icon: Icon(
                  MaterialCommunityIcons.hamburger,
                  // color: (themeProvider.isLightTheme)
                  //     ? Colors.deepOrangeAccent
                  //     : Colors.black,
                )),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Barchasi',
                  style: TextStyle(
                    color: (themeProvider.isLightTheme)
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            trailing: Row(
              children: [
                IconButton(
                    onPressed: () {
                      //showSearch
                    },
                    icon: Icon(
                      Icons.search,
                      color: (themeProvider.isLightTheme)
                          ? Colors.deepOrangeAccent
                          : Colors.black,
                    )),
                IconButton(
                  onPressed: () {
                    themeProvider.toggleThemeData();
                  },
                  highlightColor: Colors.deepOrange,
                  icon: Icon(
                    color: (themeProvider.isLightTheme)
                        ? Colors.deepOrangeAccent
                        : Colors.black,
                    (themeProvider.isLightTheme)
                        ? Icons.dark_mode_outlined
                        : Feather.sun,
                  ),
                ),
              ],
            ),
          ),
          slider: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: const Alignment(-0.8, -0.3),
                  colors: themeProvider.themeMode().gradientColors!),
            ),
            child: Column(
              children: [
                Container(
                  height: 60.h,
                ),
                const StyledDivider(
                  lineStyle: DividerLineStyle.dashed,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _key.currentState?.closeSlider();
                      _flag = true;
                    });
                  },
                  title: const Text(
                    'Barchasi',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: const Icon(
                      MaterialCommunityIcons.format_list_checkbox,
                      color: Colors.white),
                ),
                Visibility(
                    child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Muhim()));
                  },
                  title: const Text("Muhim",
                      style: TextStyle(color: Colors.white)),
                  titleAlignment: ListTileTitleAlignment.top,
                  leading: const Icon(
                    AntDesign.staro,
                    color: Colors.white,
                  ),
                )),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const EndIkki()));
                  },
                  title: const Text('Yakunlangan',
                      style: TextStyle(color: Colors.white)),
                  leading: const Icon(Icons.done_outline, color: Colors.white),
                ),
                const ListTile(
                  title:
                      Text('Keraksiz', style: TextStyle(color: Colors.white)),
                  leading: Icon(AntDesign.delete, color: Colors.white),
                ),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: const Alignment(-0.8, -0.3),
                  colors: themeProvider.themeMode().gradientColors!),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: textBox.listenable(),
                      builder: (context, value, child) {
                        return ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: textBox.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                              child: MaterialButton(
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
                                  color: (themeProvider.isLightTheme)
                                      ? Colors.black
                                      : Colors.amber,
                                  swipeThreshold: 0.1,
                                  direction: SwipeDirection.horizontal,
                                  onSwiped: (direction) {
                                    if (direction ==
                                        SwipeDirection.startToEnd) {
                                      setState(() {
                                        textBox.deleteAt(index);
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
                                            color: Colors.red),
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
                                            onPressed: () {
                                              setState(() {
                                                endBox.add(Endi(
                                                  end: textEditingController
                                                      .text,
                                                ));
                                                textBox.deleteAt(index);
                                              });
                                            },
                                            icon: const Icon(MaterialCommunityIcons
                                                .checkbox_blank_circle_outline),
                                            color: (themeProvider.isLightTheme)
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: (themeProvider.isLightTheme)
                                              ? Colors.black
                                              : Colors.amber,
                                        ),
                                        child: Expanded(
                                          child: Text(
                                            textBox.getAt(index)?.content ??
                                                "null",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color:
                                                    (themeProvider.isLightTheme)
                                                        ? Colors.white
                                                        : Colors.black),
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
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: textfieldwith,
                        height: 35.h,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Expanded(
                                child: AutoSizeTextField(
                                  style:
                                  const TextStyle(color: Colors.deepOrange),
                                  cursorColor: Colors.deepOrangeAccent,
                                  fullwidth: false,
                                  maxLines: 1,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: textEditingController,
                                  onTap: () {
                                    setState(() {
                                      FiconS = FiconS == fik ? fi : fi;
                                      fabSize = fabSize == fs ? fs : fs;
                                      conwidth = cw.w == cw.w ? 1.w : 1.w;
                                      textfieldwith = textfieldwith == txtv.w
                                          ? txtw.w
                                          : txtw.w;
                                      icon = true;
                                    });
                                  },
                                  onSubmitted: (value) {
                                    setState(() {
                                      textfieldwith = textfieldwith == txtv.w
                                          ? txtv.w
                                          : txtv.w;
                                      icon = false;
                                      textBox.add(
                                          textEditingController.text as ToDo);
                                      textEditingController.clear();
                                    });
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Colors.black,
                                    hintStyle: const TextStyle(
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    filled: true,
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(200),
                                      ),
                                    ),
                                    hintText: randomHintText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      width: conwidth.w,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: conwidth.w,
                        height: conwidth.w,
                        color: Colors.transparent,
                      ),
                    ),
                    Center(
                      child: AnimatedContainer(
                        margin: const EdgeInsets.only(bottom: 4),
                        duration: const Duration(milliseconds: 200),
                        width: fabSize,
                        height: fabSize,
                        child: FloatingActionButton(
                          splashColor: Colors.deepOrangeAccent,
                          onPressed: () {
                            if (icon == false) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Add(),
                                  )).then((value) {
                                setState(() {});
                              });
                            } else if (icon == true) {
                              textBox.add(
                                ToDo(
                                  content: textEditingController.text,
                                ),
                              );
                              textEditingController.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                fabSize = fabSize == fs ? fz : fz;
                                FiconS = FiconS == fi ? fik : fik;
                                conwidth = cw == 1.w ? cw.w : cw.w;
                                textfieldwith =
                                    textfieldwith == txtv.w ? txtv.w : txtv.w;
                                icon = false;
                              });
                            }
                          },
                          child: Icon(
                            (icon == true) ? Icons.done_outline : Icons.add,
                            color: Colors.white,
                            size: FiconS,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
