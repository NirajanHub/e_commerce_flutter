import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';
import 'package:flutter/material.dart';

class HomeIconWidget extends StatelessWidget {
  final HomeMenusModel homeMenusModel;

  const HomeIconWidget({super.key, required this.homeMenusModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          homeMenusModel.itemIcon,
          fit: BoxFit.contain,
          width: 100,
          height: 70,
        ),
        Text(homeMenusModel.itemName) 
      ],
    );
  }
}
