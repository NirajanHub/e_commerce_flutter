// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/home_menus.dart';

class HomeMenusModel extends HomeMenuEntity {
  const HomeMenusModel(
    super.itemName,
    super.itemIcon,
  );

  HomeMenusModel copyWith({
    String? itemName,
    String? itemIcon,
  }) {
    return HomeMenusModel(
      itemName ?? this.itemName,
      itemIcon ?? this.itemIcon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'itemIcon': itemIcon,
    };
  }

  factory HomeMenusModel.fromMap(Map<String, dynamic> map) {
    return HomeMenusModel(
      map['itemName'] as String,
      map['itemIcon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeMenusModel.fromJson(String source) =>
      HomeMenusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomeMenus(itemName: $itemName, itemIcon: $itemIcon)';

  @override
  bool operator ==(covariant HomeMenusModel other) {
    if (identical(this, other)) return true;

    return other.itemName == itemName && other.itemIcon == itemIcon;
  }

  @override
  int get hashCode => itemName.hashCode ^ itemIcon.hashCode;
}
