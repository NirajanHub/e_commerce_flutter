// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:e_commerce/feature/landing/home/domain/entities/home_data.dart';

import 'carousel_images_model.dart';
import 'home_menus_model.dart';

class HomeDataModel extends HomeDataEntity {
  const HomeDataModel({
    required super.carouselImagesModel,
    required super.homeMenusModel,
  });

  HomeDataModel copyWith({
    CarouselImagesModel? carouselImagesModel,
    List<HomeMenusModel>? homeMenusModel,
  }) {
    return HomeDataModel(
      carouselImagesModel: carouselImagesModel ?? this.carouselImagesModel,
      homeMenusModel: homeMenusModel ?? this.homeMenusModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carouselImagesModel': carouselImagesModel.toMap(),
      'homeMenusModel': homeMenusModel.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    return HomeDataModel(
      carouselImagesModel: CarouselImagesModel.fromMap(
          map['carouselImagesModel'] as Map<String, dynamic>),
      homeMenusModel: List<HomeMenusModel>.from(
        (map['homeMenusModel'] as List<int>).map<HomeMenusModel>(
          (x) => HomeMenusModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeDataModel.fromJson(String source) =>
      HomeDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HomeDataModel(carouselImagesModel: $carouselImagesModel, homeMenusModel: $homeMenusModel)';

  @override
  bool operator ==(covariant HomeDataModel other) {
    if (identical(this, other)) return true;

    return other.carouselImagesModel == carouselImagesModel &&
        listEquals(other.homeMenusModel, homeMenusModel);
  }

  @override
  int get hashCode => carouselImagesModel.hashCode ^ homeMenusModel.hashCode;
}
