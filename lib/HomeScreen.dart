// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddCard.dart';
import 'MyWidget/CardWidget.dart';
import 'MyWidget/IconWidget.dart';
import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Widget> adds = [];
  List<CardWidgetParams> models = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () async {
          final prefs= await SharedPreferences.getInstance();
          prefs.getBool('SaveWidget');

          final CardWidgetParams params = await Navigator.of(context).push(

            MaterialPageRoute(
              builder: (_) => const AddCard(),
            ),
          );
          models.add(params);
          final ListOfCardsModel a = ListOfCardsModel(models: models);
          final json = a.toJson();

          final SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("models", json.toString());
          String? s = preferences.getString("models");

          final decode = jsonEncode(s!);
          // print('m is $m');
          final aaa = ListOfCardsModel.fromJson(jsonDecode(decode));
          print(aaa.models.first);
          print('the name is ${params.name} ${params.color} ${params.number}');
          adds.add(CardWidget(
            params: params,
          ));
          setState(() {});
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Hello Alaa ❤'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              if (adds.isNotEmpty) {
                adds.clear();
                setState(() {});
              }
            },
            label: const Text(''),
            icon: const Icon(CupertinoIcons.restart),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Theme.of(context).appBarTheme.backgroundColor,
            ),
          ),
          const IconWidget(
            Icoon: Icon(CupertinoIcons.settings),
          ),
          const IconWidget(
            Icoon: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: adds,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

