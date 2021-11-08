import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/category/controllers/categories_controller.dart';
import 'package:shopsta_app/views/categoryDetails/view.dart';

class CategoriesItems extends StatelessWidget {

  int index;
  CategoriesItems(this.index);

  @override
  Widget build(BuildContext context) {
    final categoryController= CategoriesController.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:5.0, top: 10,bottom: 0,right: 5),
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryDetailsView(categoryController.result.data.catdata[index].id)
                  )
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
              child: Image.network(categoryController.result.data.catdata[index].image,height: 90,width: 100,fit: BoxFit.fill),
            ),
          ),
        ),
        Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              width: 100,
              alignment: Alignment.center,
              child: FittedBox(child: Text(categoryController.result.data.catdata[index].name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.white),textAlign: TextAlign.center,)),
              decoration: BoxDecoration(
                boxShadow: [
                  //BoxShadow(color: Colors.black,blurRadius: 0.2)
                ],
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15)),
                // border: Border.all(
                //   color: Colors.black,
                //   width: 0.5,
                // )
              ),
            ),
        ),
      ],
    );
  }
}
