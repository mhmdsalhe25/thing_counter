// import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'HomeScreen.dart';
import 'MyWidget/IconWidget.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'main.dart';
import 'model.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _controllerName = TextEditingController();
  final _controllerColor = TextEditingController();
  final _controllerNumber = TextEditingController();

  String name = '';
  int number = 0;


  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) => setState(() => currentColors = colors);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentColor,
        onPressed: () async {
          name = _controllerName.value.text;
          number = _controllerNumber.hashCode;
         // print(Number);
          currentColor = getColor(_controllerColor.value.text);
          final CardWidgetParams params = CardWidgetParams(name: name, color: currentColor,number: number);
          Navigator.pop(context, params);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Halo Alaa ❤'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text(''),
            icon: const Icon(CupertinoIcons.restart),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Theme.of(context).appBarTheme.backgroundColor,
            ),
          ),
          const IconWidget(
            Icoon: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 12, bottom: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: TextField(
                  controller: _controllerName,
                  decoration: const InputDecoration(
                    hintText: 'Category Name',
                    labelText: ' Name',
                    labelStyle: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

              ),
               TextField(
                controller:_controllerNumber,
                decoration: const InputDecoration(
                  hintText: 'Category Name',
                  labelText: ' Name',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 100, right: 50, top: 30, bottom: 100),
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: SingleChildScrollView(
                                  child: BlockPicker(
                                      pickerColor: currentColor,
                                      onColorChanged: changeColor,


                                  ),
                                ),
                              ),
                            );
                          },

                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text(
                                'Choose Color',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(String colorName) {
    switch (colorName) {
      case 'red':
        return currentColor;
      default:
        return currentColor;
    }
  }
}
