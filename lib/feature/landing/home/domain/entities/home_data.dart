import 'package:e_commerce/feature/landing/home/data/models/carousel_images_model.dart';
import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeDataEntity extends Equatable {
  final CarouselImagesModel carouselImagesModel;
  final List<HomeMenusModel> homeMenusModel;
  const HomeDataEntity({
    required this.carouselImagesModel,
    required this.homeMenusModel,
  });

  @override
  List<Object?> get props => [carouselImagesModel, homeMenusModel];
}
