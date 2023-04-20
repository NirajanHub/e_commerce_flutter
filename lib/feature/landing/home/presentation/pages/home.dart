import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/feature/landing/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => sl<HomeCubit>(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is CarouselImagesLoaded) {
                          return CarouselSlider.builder(
                            options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 2,
                                enlargeFactor: 2),
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Image.network(
                              state.carouselImages[itemIndex],
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        } else {
                          return const LoadingWidget();
                        }
                      },
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      children: [
                        Image.network('https://picsum.photos/250?image=1'),
                        Image.network('https://picsum.photos/250?image=2'),
                        Image.network('https://picsum.photos/250?image=3'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=5'),
                        Image.network('https://picsum.photos/250?image=6'),
                        Image.network('https://picsum.photos/250?image=7'),
                        Image.network('https://picsum.photos/250?image=8'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              heightFactor: 1.0,
              alignment: Alignment.topCenter,
              child: AppBar(
                backgroundColor: Colors.transparent,
                leading: Image.network('https://picsum.photos/30?image=1'),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon:
                          Image.network('https://picsum.photos/20?image=1')),
                ),
                actions: [
                  Image.network('https://picsum.photos/20?image=1'),
                  Image.network('https://picsum.photos/20?image=1'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
