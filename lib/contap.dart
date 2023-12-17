import 'package:flutter/material.dart';
import 'package:eslatma/add.dart';
import 'package:eslatma/ended/end2.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'main.dart';

class Contap extends StatefulWidget {
  final int? index;

  const Contap({super.key, this.index});

  @override
  State<Contap> createState() => _ContapState();
}

class _ContapState extends State<Contap> {
  TextEditingController textEditingController = TextEditingController();
  bool _icon = false;

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
        backgroundColor: Colors.yellow[700],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      color: Colors.yellow[300],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  if (_icon == true) {
                                    setState(() {
                                      _icon = false;
                                    });
                                  } else {
                                    setState(() {
                                      _icon = true;
                                    });
                                  }
                                },
                                icon: Icon((_icon == false)
                                    ? AntDesign.staro
                                    : AntDesign.star),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: textEditingController,
                          textAlignVertical: TextAlignVertical.center,
                          minLines: 1,
                          maxLines: null,
                          readOnly: true,
                          keyboardType: TextInputType.multiline,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Add(
                                      index: widget.index,
                                    )));
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 70),
                            hintText: "  Yozuv",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EndIkki(
                                  index: widget.index,
                                )));
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.done_outline),
                          Text("Yakunlash")],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Add(
                                  index: widget.index,
                                )));
                      },
                      child: const Column(
                        children: [
                          Icon(FontAwesome.pencil),
                          Text("Tahrirlash")],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          textBox.deleteAt(widget.index!);
                          textEditingController.clear();
                          Navigator.pop(context);
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(AntDesign.delete),
                          Text("O'chirish")],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}