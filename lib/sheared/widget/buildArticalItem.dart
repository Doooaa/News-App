import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildArticalItems(articales, context) => InkWell(
      onTap: () async {
        final Uri parsedUri = Uri.parse('${articales['url']}');
        //print(parsedUri);
        if (!await launchUrl(parsedUri,
            mode: LaunchMode.externalNonBrowserApplication)) {
          throw Exception('Could not launch $parsedUri');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(articales['urlToImage'] == null
                            ? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'
                            : articales['urlToImage'])),
                    borderRadius: const BorderRadius.all(Radius.circular(15)))),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        articales['title'],

                        style: Theme.of(context).textTheme.bodyMedium,

                        maxLines: 2,

                        overflow: TextOverflow.ellipsis, //
                      ),
                    ),
                    Expanded(
                      child: Text(
                        articales['publishedAt'],

                        style: const TextStyle(
                          color: Color.fromARGB(255, 137, 148, 153),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ), //
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
