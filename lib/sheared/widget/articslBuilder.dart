import 'buildArticalItem.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

Widget AritcalBuilder(list) {
  return ConditionalBuilder(
      condition: list.length > 0,
      fallback: (context) => const Center(child: CircularProgressIndicator()),
      builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                itemBuilder: (context, index) {
                  return buildArticalItems(list[index],context);
                },
                itemCount:list.length),
          ));
}
