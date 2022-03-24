import 'package:flutter/material.dart';
// import 'package:thing_counter/HomeScreen.dart';

// import '../main.dart';
import '../model.dart';

class CardWidget extends StatefulWidget {

  final CardWidgetParams params;

  const CardWidget({Key? key, required this.params }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  int Number = 0 ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 2),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: widget.params.color,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              Number--;
                            });
                          },
                          child: const Text(
                            '➖',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.params.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${ Number}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Number++;
                      });
                    },
                    child: const Text(
                      '➕',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


