import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/models/carousel_model.dart';

class CarouselSliderData extends StatefulWidget {
  final List<Carousel> carouselList;
   const CarouselSliderData(this.carouselList, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderDataState createState() => _CarouselSliderDataState();
}

class _CarouselSliderDataState extends State<CarouselSliderData> {
  int _current = 0;
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.carouselList
        .map((e) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: e.image.toString(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageSlider,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.carouselList.map((e) {
            int index = widget.carouselList.indexOf(e);
            return Container(
              width: 15,
              height: 2,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // shape: BoxShape.circle,
                color: _current == index
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
