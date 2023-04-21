// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:e_commerce/feature/landing/home/domain/entities/carousel_images.dart';

class CarouselImagesModel extends CarouselImagesEntity {
  const CarouselImagesModel({
    required super.images,
  });

  CarouselImagesModel copyWith({
    List<String>? images,
  }) {
    return CarouselImagesModel(
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'images': images,
    };
  }

  factory CarouselImagesModel.fromMap(Map<String, dynamic> map) {
    return CarouselImagesModel(
        images: List<String>.from(
      (map['images'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory CarouselImagesModel.fromJson(String source) =>
      CarouselImagesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CarouselImagesModel(images: $images)';

  @override
  bool operator ==(covariant CarouselImagesModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.images, images);
  }

  @override
  int get hashCode => images.hashCode;
}
