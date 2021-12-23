import 'package:audioplayer/styles/styles.dart';
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
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    initialPage: 0,
                    viewportFraction: 1,

                   )),
          ),
        ),
    ),
  );
}
class AudioListBuild extends StatelessWidget {

  String audioName;
  Function onTap;
   AudioListBuild({Key key,this.audioName,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          // color: Colors.white54,
          elevation: 20,
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                  // Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ])),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Center(
                child: Text(
                  audioName
                  ,
                  style:  Theme.of(context).textTheme.bodyText1,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget audioListBuild(String audioName,Function onTap){
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        // color: Colors.white54,
        elevation: 20,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              gradient: LinearGradient(colors: gradientColors)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Center(
              child: Text(
                  audioName
               ,
                // style:  Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}