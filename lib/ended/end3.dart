import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../MyApp.dart';
import '../main.dart';

class EndUch extends StatefulWidget {
  final int? index;

  const EndUch({super.key, this.index});

  @override
  State<EndUch> createState() => _AddState();
}

class _AddState extends State<EndUch> {
  TextEditingController textEditingController = TextEditingController();

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
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
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
                    fillColor: Colors.blue,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 70),
                    hintText: "  Yozuv",
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.blue,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Feather.check_circle),
                          SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MyApp(
                                  index: widget.index,
                                )));
                      },
                      color: Colors.blue,
                      child: const Column(
                        children: [
                          Icon(
                            MaterialIcons.replay_circle_filled,
                            color: Colors.black,
                          ),
                          Text(
                            "Tiklash",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: MaterialButton(
                      onPressed: () {
                        textEditingController.clear();
                        textBox.deleteAt(widget.index!);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const MyApp()),
                                (route) => false);
                      },
                      color: Colors.blue,
                      colorBrightness: Brightness.light,
                      splashColor: Colors.grey,
                      child: const Column(
                        children: [
                          Icon(
                            AntDesign.delete,
                            color: Colors.black,
                          ),
                          Text(
                            "O'chir",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )
        ]));
  }
}