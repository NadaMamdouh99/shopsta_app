import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/home/controllers/controller.dart';
import 'package:shopsta_app/views/home/states/controller.dart';

class HomeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = HomeController.of(context);
    return BlocBuilder (
      cubit: homeController,
      builder: (context,state) => state is HomeLoading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLightColor,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
        heightFactor: 4,
      ): homeController.result == null ? Center(child: Text('Error when getting data'),) : SizedBox(
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left:10.0 , right: 10,bottom: 5),
              child: Carousel(
                //list view.builder أأو  cursoal.builder
                images: [
                  NetworkImage(
                      '${homeController.result.data.banners[0].image}'),
                  NetworkImage(
                      '${homeController.result.data.banners[1].image}'),
                  NetworkImage(
                      '${homeController.result.data.banners[2].image}'),
                  NetworkImage(
                      '${homeController.result.data.banners[3].image}'),
                  NetworkImage(
                      '${homeController.result.data.banners[4].image}'),

                //ListView.builder(
                //    scrollDirection: Axis.horizontal,
                //   itemCount: controller.result.data.banners.length,
                //   itemBuilder: (BuildContext context,int index){
                //     return Image.network('${controller.result.data.banners[index].image}');
                //   },
                // )
                ],
                dotColor: Colors.purple[200],
                dotIncreasedColor: kPrimaryColor,
                autoplay: true,
                overlayShadow: true,
                indicatorBgPadding: 2,
                dotBgColor: Colors.transparent,
              ),
            ),
      ),
    );
  }
}
