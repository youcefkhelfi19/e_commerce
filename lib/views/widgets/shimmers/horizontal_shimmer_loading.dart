import 'package:e_commerce/views/widgets/shimmers/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../helper/constants/app_colors.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
             color: appGrey,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade100,
                  baseColor: Colors.grey.shade200,
                  direction: ShimmerDirection.ltr,
                  child: Container(
                    height: 130,
                    width: 160,

                    decoration:   const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),

                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:   [
                       const SizedBox(height: 10,),
                      Shimmer.fromColors(
                          highlightColor: Colors.grey.shade100,
                          baseColor: Colors.grey.shade200,
                          direction: ShimmerDirection.ltr,

                          child: Container(
                              height: 15,
                              width: 100,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              decoration:    BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          )
                      ),

                      Shimmer.fromColors(
                          highlightColor: Colors.grey.shade100,
                          baseColor: Colors.grey.shade200,
                          direction: ShimmerDirection.ltr,

                          child: Container(
                              height: 15,
                              width: 60,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              decoration:    BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                      )
                      )
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
