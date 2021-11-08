import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/search/components/search_body.dart';
import 'package:shopsta_app/views/search/controllers/controler.dart';
import 'package:shopsta_app/widgets/app_bar.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller= SearchController();
    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        appBar: homeAppBar(5.0, context,false,false),
        body: SearchBody(),
      ),
    );
  }
}
