import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/categoryDetails/view.dart';
import 'package:shopsta_app/views/category/controllers/categories_controller.dart';
import 'package:easy_localization/easy_localization.dart';
class CategoriesListTiles extends StatelessWidget {

  CategoriesListTiles();

  @override
  Widget build(BuildContext context) {
    final controller= CategoriesController.of(context);
    return ListView(
      padding: const EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 30),
      children: [
        Text('HomeView.categoriesTitle'.tr().toString(),style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.bold,)),
        ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: controller.result.data.catdata.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                      leading:  ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(controller.result.data.catdata[index].image,height: 100,width: 80,fit: BoxFit.fill),
                      ),
                      title:Text(controller.result.data.catdata[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.black,),),
                      trailing:IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoryDetailsView(controller.result.data.catdata[index].id)
                            )
                        );
                      },color: kPrimaryColor,)
                  ),
                ),
              );
            }
        ),
      ],
    );
  }
}
