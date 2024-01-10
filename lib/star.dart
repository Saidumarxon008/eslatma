import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:eslatma/ended/end2.dart';
import 'package:eslatma/main.dart';
import 'package:eslatma/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import 'MyApp.dart';

class Muhim extends StatefulWidget {
  final int? index;

  const Muhim({super.key, this.index});

  @override
  State<Muhim> createState() => _MuhimState();
}

class _MuhimState extends State<Muhim> with TickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  late AnimationController _controller;
  bool _flag = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    if (widget.index != null) {
      textEditingController =
          TextEditingController(text: starBox.getAt(widget.index!)!.star);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
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
        });
      },
      child: Scaffold(
        body: SliderDrawer(
          key: _key,
          sliderOpenSize: 210,
          splashColor: Colors.amber,
          appBar: SliderAppBar(
            appBarColor: Colors.deepOrange,
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
            title: const Text('Muhim'),
            trailing: const Icon(Icons.add),
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
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const MyApp()),
                              (route) => false);
                    });
                  },
                  title: const Text('Barchasi'),
                  leading: const Icon(
                    MaterialCommunityIcons.format_list_checkbox,
                  ),
                ),
                Visibility(
                    child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Muhim()));
                  },
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
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: const Alignment(-0.8, -0.3),
                  colors: themeProvider.themeMode().gradientColors!),
            ),
            child: ValueListenableBuilder(
              valueListenable: starBox.listenable(),
              builder: (context, value, child) {
                return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: starBox.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                        child: MaterialButton(
                          onPressed: () {},
                        ),
                      );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
