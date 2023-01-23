import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmContent extends StatelessWidget {
  final dynamic content;
  const FarmContent({
    Key? key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        print('');
      },
      onTap: () {
        print('');
        // show dialog
      },
      focusColor: Colors.red,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  content['image'],
                  semanticLabel: content['title'],
                  excludeFromSemantics: true,
                  fit: BoxFit.cover,
                  width: Get.width,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      content['slug'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    // ExpandableText(
                    //   content['description'] ?? 'description',
                    //   expandText: "Selengkapnya",
                    //   collapseText: "Sembunyikan",
                    //   animation: true,
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //   ),
                    // ),

                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: content['address']['street'] +
                                ', ' +
                                content['address']['city'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          // display the text with the style you want
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      content['distance'].toString() + ' km dari lokasi anda',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    // make rating from count rating of content
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) {
                                return Icon(
                                  Icons.star,
                                  color: AppTheme.warning,
                                );
                              },
                              rating: content['rating'].toDouble(),
                              itemCount: 5,
                              itemSize: 15.0,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              content['rating'].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        // button save
                        Row(
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.chat,
                                size: 15,
                                color: AppTheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.grey,
                              ),
                            ),
                            // button chat
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
