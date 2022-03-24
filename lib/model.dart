import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'model.g.dart';

@JsonSerializable()
class ListOfCardsModel {
  final List<CardWidgetParams> models;
  const ListOfCardsModel({required this.models});

  factory ListOfCardsModel.fromJson(json) {
    print('im here and josn is ${json}');
    Map<String, dynamic> abc = jsonDecode(jsonEncode(json));
    return ListOfCardsModel(
        models: (abc['models'] as List)
            .map((e) => CardWidgetParams.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() =>
      {'models': models};
}

@JsonSerializable(createToJson: true)
class CardWidgetParams {
  final String name;
  final Color color;
  final int number;

  const CardWidgetParams(
      {required this.name, required this.color, required this.number});

  factory CardWidgetParams.fromJson(Map<String, dynamic> json) =>
      CardWidgetParams(
          name: json['name'], color: json['color'], number: json['number']);

  Map<String, dynamic> toJson() =>
      {'name': name, 'color': color, 'number': number};
}
