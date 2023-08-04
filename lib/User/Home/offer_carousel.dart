import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../CONNECTION/connect.dart';

class ImageCarousel extends StatefulWidget {
  final List<dynamic> offers;

  ImageCarousel({required this.offers});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 245, // Adjust the height of the carousel
        autoPlay: true, // Set to true to enable auto-play
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        autoPlayInterval:
            Duration(seconds: 3), // Adjust the interval for auto-play
      ),
      items: widget.offers.map((offer) {
        return Builder(
          builder: (BuildContext context) {
            var name = offer['username'].toUpperCase();
            return Container(
              alignment: Alignment.bottomCenter,
              height: 300,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          NetworkImage('${Con.url}offer/${offer['offer']}'))),
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Valid:', // Display the offer validity date
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${offer['start_date']}', // Display the offer validity date
                            style: TextStyle(
                                fontSize: 16,
                                //fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            'To', // Display the offer validity date
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${offer['end_date']}', // Display the offer validity date
                            style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '$name, ${offer['place']}, ph: ${offer['phone']}', // Display the offer provider
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
