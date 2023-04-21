import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/home_cubit.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/menu_icon_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  return Column(
                    children: [
                      CarouselWidget(state: state),
                      HomeMenuLoadedWidget(state: state),
                    ],
                  );
                },
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
    );
  }
}
