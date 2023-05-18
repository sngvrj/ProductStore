import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/src/utils/src/ui_dimens.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class HomeCarousel extends ConsumerStatefulWidget {
  const HomeCarousel({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends ConsumerState<HomeCarousel> {
  final _carousalController = CarouselController();
  List<String> images = [
    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg',
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx6kEpLp_2nkd7h2AKTfhU-gVAUKiMdH-9fw8w1-xE&s",
    "https://images.unsplash.com/photo-1560343090-f0409e92791a?ixlib=rb-4.0.3&ixid=M3wxMjA3[…]HVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
  ];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final indexValue = ref.watch(indexProvider);
    return Column(
      children: [
        Container(
          height: context.screenHeight * 0.30,
          child: CarouselSlider(
            carouselController: _carousalController,
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              fit: BoxFit.cover,
                              width: context.screenWidth * 0.8,
                              (i)),
                        ),
                      ).paddingSymmetric(vertical: 5),
                    ],
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
                autoPlay: true,
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                viewportFraction: 0.9, //866
                pauseAutoPlayOnManualNavigate: true,
                height: MediaQuery.of(context).size.height * 0.41,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.easeIn,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                initialPage: indexValue,
                onPageChanged: (index, reason) async {
                  ref.read(indexProvider.notifier).state = index;
                }),
          ).paddingSymmetric(vertical: 5),
        ),
        AnimatedSmoothIndicator(
          activeIndex: indexValue,
          // controller: _carousalController,
          // activeIndex: _selectedIndex,
          onDotClicked: (index) {
            ref.read(indexProvider.notifier).state = index;
          },
          count: images.length,
          effect: ColorTransitionEffect(
              activeDotColor: Colors.purple,
              dotWidth: UIDimens.size13,
              dotHeight: UIDimens.size13),
        ),
      ],
    );
  }
}

class CarouselSkeleton extends StatefulWidget {
  const CarouselSkeleton({Key? key}) : super(key: key);

  @override
  State<CarouselSkeleton> createState() => _CarouselSkeletonState();
}

class _CarouselSkeletonState extends State<CarouselSkeleton> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (int x = 0; x < 3; x++)
          Container(
            margin: EdgeInsets.fromLTRB(10, 15, 5, 12),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
