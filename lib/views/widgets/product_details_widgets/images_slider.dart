import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImagesSlider extends StatelessWidget {
  const CarouselImagesSlider({Key? key, required this.onTap, required this.image}) : super(key: key);
  final Function(int index,CarouselPageChangedReason reason) onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              placeholder: 'images/loading.gif',
              image: image
          ),
        );
      },
      options: CarouselOptions(
          height: 400,
          autoPlay: false,
          viewportFraction: 1,
          onPageChanged: (index,reason){
            onTap(index,reason);
          }
      ),
    );

  }
}
