
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'items_model.g.dart';

@JsonSerializable()
class ItemsModel extends Equatable {

  @JsonKey(name: 'total_count')
  final int totalCount;
  final List<Item> items;

  const ItemsModel({
    required this.totalCount,
    required this.items,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) => _$ItemsModelFromJson(json);


  @override
  List<Object?> get props => [totalCount, items];

  @override
  String toString() => 'ItemsModel(totalCount: $totalCount, items: $items)';
}