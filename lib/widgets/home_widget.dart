import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget homeContainer({Function onTap, List<String>images}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 150,
          width: 170,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CarouselSlider(
                items: images
                    .map((e) =>
                    Image(
                      image: AssetImage(
                          e
                      ),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ))
                    .toList(),
                options: CarouselOptions(
                    height: 170,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    initialPage: 0,
                    viewportFraction: 1,

                   )),
          ),
        ),
    ),
  );
}
