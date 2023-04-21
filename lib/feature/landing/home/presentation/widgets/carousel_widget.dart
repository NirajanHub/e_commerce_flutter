import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../bloc/cubit/home_cubit.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    if (state is HomePageLoaded) {
      return CarouselSlider.builder(
        options: CarouselOptions(
            autoPlay: true, viewportFraction: 2, enlargeFactor: 2),
        itemCount: 8,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Image.network(
          (state as HomePageLoaded).carouselImages[itemIndex],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 200),
          fit: BoxFit.fitWidth,
        ),
      );
    } else {
      return const LoadingWidget();
    }
  }
}
