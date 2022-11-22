import 'package:e_commerce/views/widgets/shimmers/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../helper/constants/app_colors.dart';

class VerticalShimmerLoading extends StatelessWidget {
  const VerticalShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            height: 100,
            decoration: BoxDecoration(
             color: Colors.white,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade100,
                  baseColor: Colors.grey.shade200,
                  direction: ShimmerDirection.ltr,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Shimmer.fromColors(
                          highlightColor: Colors.grey.shade100,
                          baseColor: Colors.grey.shade200,
                          direction: ShimmerDirection.ltr,

                          child: Container(
                              height: 20,
                              width: 180,
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
                              height: 20,
                              width: 70,
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
                              height: 20,
                              width: 70,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              decoration:    BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          )
                      ),
                    ],
                  ),
                ),

              ],
            ),
          );
        });
  }
}
