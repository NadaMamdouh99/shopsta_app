import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/categoryDetails/controllers/controller.dart';
import 'package:shopsta_app/views/categoryDetails/states/controller.dart';
import 'package:shopsta_app/widgets/alternative_view.dart';
import 'package:shopsta_app/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryDetailsListView extends StatefulWidget {
  @override
  _CategoryDetailsListViewState createState() => _CategoryDetailsListViewState();
}

class _CategoryDetailsListViewState extends State<CategoryDetailsListView> {
  @override
  Widget build(BuildContext context) {
    final categoryDetailsController = CategoryDetailsController.of(context);
    return BlocBuilder(
      cubit: categoryDetailsController,
      builder: (context,state) => state is CategoryDetailsLoading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLightColor,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
        //heightFactor: 8,
      ): categoryDetailsController.result == null ? AlternativeView('https://image.freepik.com/vecteurs-libre/avertissement-erreur-concept-systeme-exploitation-illustration-vectorielle-page-web-erreur-404-systeme-exploitation-fenetre-avertissement-erreur_126608-442.jpg', 'ErrorsMsgs.errorWhenLoadPage'.tr().toString(), false,false) :
      categoryDetailsController.result.data.catData.isEmpty ? AlternativeView('assets/images/empty_category.png','ErrorsMsgs.categoryEmpty'.tr().toString(),true,false) : GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemCount: categoryDetailsController.result.data.catData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7
        ),
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            image: categoryDetailsController.result.data.catData[index].image,
            name: categoryDetailsController.result.data.catData[index].name,
            price: categoryDetailsController.result.data.catData[index].price,
            oldPrice: categoryDetailsController.result.data.catData[index].oldPrice,
            discount: categoryDetailsController.result.data.catData[index].discount,
            isFavourite: categoryDetailsController.result.data.catData[index].inFavorites,
            productId: categoryDetailsController.result.data.catData[index].id,
          );
        },
      ),
    );
  }
}


//bool pressed =false;

//int _currentIndex =0;
// void onTapped(int index) {
//   setState(() {
//     _currentIndex = index;
//     pressed=!pressed;
//   });
// }

//   InkWell(
//   onTap: (){
//     Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => DetailsView(
//           controller.result.data.catData[index].images,
//           controller.result.data.catData[index].name,
//           controller.result.data.catData[index].oldPrice.toString(),
//           controller.result.data.catData[index].price.toString(),
//           controller.result.data.catData[index].description,
//         )
//         )
//     );
//   },
//   child: Container(
//     padding: EdgeInsets.all(5),
//     decoration: BoxDecoration(
//       boxShadow: [
//         //BoxShadow(color: Colors.black,blurRadius: 0.2)
//       ],
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15),
//       /*border: Border.all(
//       //color: Colors.black,
//       width: 0.5,
//     )
//        */
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       //crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Stack(
//           alignment: Alignment.bottomLeft,
//           children: [
//             Image.network(controller.result.data.catData[index].image,width: 100,height: 100,fit: BoxFit.fill,),
//             controller.result.data.catData[index].discount == 0 ? SizedBox() :Container(
//               color: Colors.red,
//               child: Text('Discount ${controller.result.data.catData[index].discount}%',style: TextStyle(color: Colors.white),),
//             ),
//           ],
//         ),
//         Container(
//           height: 55,
//           padding: const EdgeInsets.only(top:10.0, bottom: 5),
//           child: Text(controller.result.data.catData[index].name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),textAlign: TextAlign.center,overflow: TextOverflow.fade,),
//         ),
//         Expanded(
//           child: Container(
//             //width: double.maxFinite,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               mainAxisSize:MainAxisSize.max,
//               children: [
//                 Text(controller.result.data.catData[index].price.toString(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500,color: Colors.black,)),
//                 SizedBox(width: 3,),
//                 Text(controller.result.data.catData[index].discount == 0 ?  "":controller.result.data.catData[index].oldPrice.toString(),
//                     style: TextStyle(
//                         fontSize: 11, fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,color: Colors.grey
//                     )
//                 ),
//                 //SizedBox(width: 3,),
//                 IconButton(
//                   onPressed: (){
//                     setState(() {
//                       _currentIndex = index;
//                       //pressed=!pressed;
//                     });
//                     favController.addProductToFav(controller.result.data.catData[index].id);
//                   },
//                   padding: const EdgeInsets.all(0),
//                   icon: Icon(controller.result.data.catData[index].inFavorites || (_currentIndex == index) ? Icons.favorite:Icons.favorite_outline,color: controller.result.data.catData[index].inFavorites||( _currentIndex == index) ? kPrimaryColor:Colors.black,),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// );