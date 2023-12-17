// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:eslatma/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';
import 'package:eslatma/adapter/todo.dart';
import 'package:eslatma/add.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:eslatma/contap.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'ended/end2.dart';

class MyApp extends StatefulWidget {
  final int? index;

  const MyApp({super.key, this.index});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  bool _flag = true;
  late AnimationController _controller;
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  TextEditingController textEditingController = TextEditingController();
  bool shouldCheck = false;
  int selectedindex = -1;
  bool shouldCheckDefault = false;
  bool icon = false;
  int selectedIndex = 0;
  double textfieldwith = 220;
  double fabSize = 55;
  double conwidth = 20;
  bool aicon = true;
  double FiconS = 40;

  double fi = 25;
  double fik = 40;
  double cw = 20;
  double aw = 310;
  double av = 220;
  double fs = 40;
  double fz = 55;
  Color _color = Colors.black;
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
    return GestureDetector(
      onVerticalDragEnd: (value) {
        setState(() {
          _key.currentState?.closeSlider();
          _flag = true;
        });
      },
      onTap: () {
        setState(() {
          _flag = true;
          FiconS = FiconS == fi ? fik : fik;
          conwidth = cw == 1 ? cw : cw;
          fabSize = fabSize == fz ? fz : fz;
          textfieldwith = textfieldwith == av ? av : av;
          icon = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: SliderDrawer(
          key: _key,
          sliderOpenSize: 210,
          splashColor: Colors.amber,
          appBar: SliderAppBar(
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
                AnimatedIconItem(icon: Icon(MaterialCommunityIcons.hamburger)),
                AnimatedIconItem(icon: Icon(MaterialCommunityIcons.hamburger)),
              ],
            ),
            appBarColor: Colors.deepOrangeAccent,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Barchasi',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.black),
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
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                IconButton(
                  onPressed: () {
                    if (aicon == true) {
                      setState(() {
                        aicon = false;
                        _color = Colors.black;
                      });
                    } else if (aicon == false) {
                      setState(() {
                        aicon = true;
                        _color = Colors.black;
                      });
                    }
                  },
                  highlightColor: Colors.orangeAccent,
                  icon: Icon(
                    (aicon == true) ? Icons.dark_mode_outlined : Feather.sun,
                    color: _color,
                  ),
                ),
              ],
            ),
          ),
          slider: Container(
            color: Colors.deepOrangeAccent,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Colors.red,
              ),
              child: Column(
                children: [
                  Container(
                    height: 60,
                  ),
                  const StyledDivider(
                    lineStyle: DividerLineStyle.dashed,
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _key.currentState?.closeSlider();
                        _flag = true;
                      });
                    },
                    title: const Text('Barchasi'),
                    leading: const Icon(
                      MaterialCommunityIcons.format_list_checkbox,
                    ),
                  ),
                  Visibility(
                      child: ListTile(
                    onTap: () {},
                    title: const Text("Muhim"),
                    titleAlignment: ListTileTitleAlignment.top,
                    leading: const Icon(AntDesign.staro),
                  )),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const EndIkki()));
                    },
                    title: const Text('Yakunlangan'),
                    leading: const Icon(
                      Icons.done_outline,
                    ),
                  ),
                  const ListTile(
                    title: Text('Keraksiz'),
                    leading: Icon(
                      AntDesign.delete,
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Expanded(
              //   child: CustomScrollView(
              //     slivers: [
              //       SliverAppBar(
              //           expandedHeight: 200.0,
              //           flexibleSpace: FlexibleSpaceBar(
              //             collapseMode: CollapseMode.none,
              //             title: const Center(
              //                 child: Text(
              //               'Barchasi',
              //               style: TextStyle(color: Colors.black),
              //             )),
              //             background: Container(
              //               color: Colors.deepOrangeAccent,
              //             ),
              //           )),
              //       SliverAppBar.large(
              //         backgroundColor: Colors.deepOrangeAccent,
              //         expandedHeight: 20,
              //         title: const Text(
              //           "Barchasi",
              //           style: TextStyle(color: Colors.black),
              //         ),
              //         actions: [
              //           IconButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => const Search()));
              //               },
              //               icon: const Icon(
              //                 Icons.search,
              //                 color: Colors.black,
              //               )),
              //           IconButton(
              //             onPressed: () {
              //               if (aicon == true) {
              //                 setState(() {
              //                   aicon = false;
              //                   _color = Colors.black;
              //                 });
              //               } else if (aicon == false) {
              //                 setState(() {
              //                   aicon = true;
              //                   _color = Colors.black;
              //                 });
              //               }
              //             },
              //             highlightColor: Colors.orangeAccent,
              //             icon: Icon(
              //               (aicon == true)
              //                   ? Icons.dark_mode_outlined
              //                   : Icons.sunny,
              //               color: _color,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SliverList(
              //         delegate: SliverChildBuilderDelegate(
              //             (BuildContext context, int index) {
              //            ValueListenableBuilder(
              //               valueListenable: textBox.listenable(),
              //               builder: (context, value, child) {
              //                 return ListView.builder(
              //                   itemCount: textBox.length,
              //                   itemBuilder: (context, index) {
              //                     return SwipeableTile(
              //                       color: Colors.yellow,
              //                       swipeThreshold: 0.2,
              //                       direction: SwipeDirection.horizontal,
              //                       onSwiped: (direction) {
              //                         if (direction == SwipeDirection.startToEnd) {
              //                           setState(() {
              //                             textBox.deleteAt(index);
              //                           });
              //                         } else if (direction ==
              //                             SwipeDirection.endToStart) {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (context) => const Add()));
              //                         }
              //                       },
              //                       backgroundBuilder:
              //                           (context, direction, progress) {
              //                         if (direction == SwipeDirection.endToStart) {
              //                         } else if (direction ==
              //                             SwipeDirection.startToEnd) {
              //                           return Container(
              //                             height: 50,
              //                             color: Colors.redAccent,
              //                             alignment: Alignment.centerLeft,
              //                             child: const Icon(Icons.delete),
              //                           );
              //                         }
              //                         return Container(
              //                           color: Colors.blue,
              //                           alignment: Alignment.centerRight,
              //                           child: const Icon(Icons.edit),
              //                         );
              //                       },
              //                       key: ValueKey(1),
              //                       child: Row(
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Container(
              //                             color: Colors.yellow,
              //                             margin: const EdgeInsets.all(2),
              //                             child: Expanded(
              //                               child: Text(
              //                                 textBox.getAt(index),
              //                                 textAlign: TextAlign.center,
              //                                 style: const TextStyle(fontSize: 20),
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     );
              //                   },
              //                 );
              //               });
              //         }),
              //       ),
              //     ],
              //   ),
              //   ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: textBox.listenable(),
                    builder: (context, value, child) {
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: textBox.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                                  if (direction == SwipeDirection.startToEnd) {
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
                                  if (direction == SwipeDirection.endToStart) {
                                  } else if (direction ==
                                      SwipeDirection.startToEnd) {
                                    return Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.redAccent,
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
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => Add(
                                                            index: index,
                                                          ))).then((value) {
                                                setState(() {});
                                              });
                                            },
                                            icon: const Icon(MaterialCommunityIcons
                                                .checkbox_blank_circle_outline)),
                                      ],
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Contap()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.yellow),
                                        child: Expanded(
                                          child: Text(
                                            textBox.getAt(index)?.content ??
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
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              controller: textEditingController,
                              onTap: () {
                                setState(() {
                                  FiconS = FiconS == fik ? fi : fi;
                                  fabSize = fabSize == fs ? fs : fs;
                                  conwidth = cw == cw ? 1 : 1;
                                  textfieldwith = textfieldwith == av ? aw : aw;
                                  icon = true;
                                });
                              },
                              onSubmitted: (value) {
                                setState(() {
                                  textfieldwith = textfieldwith == av ? av : av;
                                  icon = false;
                                  textBox
                                      .add(textEditingController.text as ToDo);
                                  textEditingController.clear();
                                });
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              onTapOutside: (value) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              style: const TextStyle(
                                  color: Colors.deepOrangeAccent),
                              cursorColor: Colors.deepOrangeAccent,
                              decoration: InputDecoration(
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
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    width: conwidth,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: conwidth,
                      height: conwidth,
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
                              conwidth = cw == 1 ? cw : cw;
                              textfieldwith = textfieldwith == av ? av : av;
                              icon = false;
                            });
                          }
                        },
                        backgroundColor: Colors.black,
                        child: Icon(
                          (icon == true) ? Icons.done_outline : Icons.add,
                          color: Colors.deepOrangeAccent,
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
    );
  }
}
