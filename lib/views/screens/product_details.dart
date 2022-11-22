import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/helper/constants/app_strings.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/views/widgets/buttons/favorit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../widgets/buttons/cart_button.dart';
import '../widgets/product_details_widgets/dots_indicator.dart';
import '../widgets/product_details_widgets/images_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
   final Product product ;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentIndex = 0;
  bool isExpanded = true;
  int colorIndex = 0;
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: mainColor
        ),
        elevation: 0.0,
        title: const Text(''),
        actions: [
          CartBadge()
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),

        children: [
          Stack(
            children: [
              CarouselImagesSlider(image: widget.product.image,
              onTap: (index,reason){
                 setState(() {
                   currentIndex = index;
                 });
              },),
              DotsIndicator(currentIndex: currentIndex),
              Positioned(
                bottom: 10,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black26
                  ),
                  height: 110,
                  width: 40,

                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                             colorIndex = index;
                            });

                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(color:index == colorIndex?Colors.grey.shade600:Colors.white, width: 1.0),
                                color: Color(colors[index]),
                                shape: BoxShape.circle),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
                 Text(widget.product.title,style: const TextStyle(fontSize: 20,color: Colors.black),),
                  Row(

                    children: [
                      Text('(${widget.product.rating.rate})',style: const TextStyle(fontSize: 16,color: Colors.black),),

                      RatingStars(rating: widget.product.rating.rate),
                    ],
                  )
             ],
                ),
              ),
              FavoritButton(id: widget.product.id,size: 35,)
            ],
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: isExpanded ? 10 : 0,
                vertical: 10,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: isExpanded ? 55: 260,
              curve: Curves.fastLinearToSlowEaseIn,
              duration:  const Duration(milliseconds:300),
              decoration: BoxDecoration(

                color: const Color(0xffFF5050),
                borderRadius: BorderRadius.all(
                  Radius.circular(isExpanded ? 20 : 0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Product Details',
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  isExpanded ? const SizedBox() : const SizedBox(height: 5),
                  AnimatedCrossFade(
                    firstChild: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: Text(
                      widget.product.description,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration:  const Duration(milliseconds:300),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
            ),
          ),
         SizedBox(
            height: 50,
            width: 110,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        colorIndex = index;
                      });

                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(color:index == colorIndex?Colors.black:mainColor, width: 2.0),
                           borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(sizes[index],style: const TextStyle(color: Colors.black),),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 70,)
        ],
      ),
      bottomSheet: GetBuilder<CartController>(
        builder: (context) {
          return SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Price: ',style:  TextStyle(fontSize: 18,color: Colors.grey),),

                  Text('${widget.product.price} DZD',style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                  const Spacer(),
                  MaterialButton(
                    color: mainColor,
                    height: 40,
                    minWidth: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed:(){cartController.addToCart(widget.product);},
                    child: const Text('Add To Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.all(0),
      itemBuilder: (context, _) =>  const SizedBox(
        height: 5,
        width: 5,
        child: Icon(
          Icons.star,
          color: Colors.orange,
          size: 3,
        ),
      ),
      onRatingUpdate: (rating) {
      },
    );
  }
}


