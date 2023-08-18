import 'package:flutter/material.dart';
 import 'package:flutter/cupertino.dart';

navigateToScreen(context,widget)
 {
  Navigator.push(context, MaterialPageRoute(
    builder: (context)=>widget,
  ));
 }