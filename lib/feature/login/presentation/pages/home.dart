import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 200),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    autoPlay: true, viewportFraction: 2, enlargeFactor: 2),
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Image.network(
                  'https://picsum.photos/250?image=$itemIndex',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Align(
            heightFactor: 1.0,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                AppBar(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
