// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CarouselImagesModel {
  final List<String> images;
  CarouselImagesModel({
    required this.images,
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
  String toString() => 'CarouselImages(images: $images)';

  @override
  bool operator ==(covariant CarouselImagesModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.images, images);
  }

  @override
  int get hashCode => images.hashCode;
}
