import 'package:flutter/material.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../bloc/cubit/home_cubit.dart';
import 'home_menu_widget.dart';

class HomeMenuLoadedWidget extends StatelessWidget {
  const HomeMenuLoadedWidget({super.key, required this.state});
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    if (state is HomePageLoaded) {
      List<HomeIconWidget> homeIconWidget = List.empty(growable: true);
      final homeMenuModel = (state as HomePageLoaded).homeMenuModel;
      for (var homeMenuModel in homeMenuModel) {
        homeIconWidget.add(HomeIconWidget(homeMenusModel: homeMenuModel));
      }
      return SizedBox(
          height: MediaQuery.of(context).size.height - 500,
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 20,
            children: homeIconWidget,
          ));
    } else {
      return const LoadingWidget();
    }
  }
}
