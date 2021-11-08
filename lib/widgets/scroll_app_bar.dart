import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/widgets/search_text_field.dart';

ScrollingAppBar(controller) => ScrollAppBar(
  controller: controller,
  backgroundColor: Colors.white,
  elevation: 0,
  automaticallyImplyLeading: false,
  title: SearchTextField(),
);

