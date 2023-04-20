// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class CarouselImagesEntity extends Equatable {
  final List<String> images;
  const CarouselImagesEntity({
    required this.images,
  });

  @override
  List<Object?> get props => [images];
}
