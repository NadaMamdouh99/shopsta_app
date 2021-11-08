import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/category/controllers/categories_controller.dart';
import 'package:shopsta_app/views/category/states/cat_controller.dart';
import 'package:shopsta_app/views/home/widgets/categories_items.dart';

class CategoriesListView extends StatelessWidget {

  String text;
  CategoriesListView(this.text);

  @override
  Widget build(BuildContext context) {
    final categoryController= CategoriesController.of(context);
    return Container(
        width: 180,
        height: 175,
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold,), ),
            SizedBox(height: 10,),
            BlocBuilder(
              cubit: categoryController,
              builder: (context, state) => state is CategoryLoading ? Center(
              child: CircularProgressIndicator(
              backgroundColor: kPrimaryLightColor,
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
                heightFactor: 3,
              )
              :categoryController.result == null ? Center(child: Text('Error when getting data')) : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryController.result.data.catdata.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoriesItems(index);
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}


// final controller= CategoriesController.of(context);
// return BlocBuilder(
// cubit: controller,
// builder:  (context, state) => state is CategoryLoading ? Center(
// child: CircularProgressIndicator(
// backgroundColor: kPrimaryLightColor,
// valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
// ),
// heightFactor: 4,
// ):
//)


// InkWell(
// onTap: (){
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => CategoryDetailsView(controller.result.data.catdata[index].id)
// )
// );
// },
// child:
//)

//controller.result.data.catdata[index].image
//controller.result.data.catdata[index].name