import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/search/controllers/controler.dart';
import 'package:shopsta_app/views/search/states/controller.dart';

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=SearchController.of(context);
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
              cursorColor: Colors.purple,
              controller: controller.searchField,
              decoration: InputDecoration(
                  hintText: "Enter product name",
                  hintStyle: TextStyle(color: Colors.black,),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.search,color: Colors.black,),
                      color: Colors.white,
                      onPressed: () async{
                        await controller.getSearchResults();
                      }
                  )
              )
          ),
          SizedBox(height: 30,),
          BlocBuilder(
            cubit: controller,
            builder: (context,state) => state is SearchLoading ? Center(
            child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          ),
          //heightFactor: 8,
          ) :controller.result == null ? Text('No result'):Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.result.data.searchdata.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10,left: 6,right: 6),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      decoration: BoxDecoration(
                        boxShadow: [
                          //BoxShadow(color: Colors.black,blurRadius: 1)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(top: 12.0,bottom: 12,left: 8,right: 8),
                        child: Row(
                          children: [
                            Image.network(controller.result.data.searchdata[index].image,width: 100,height: 100,fit: BoxFit.fill,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:8.0,right: 8),
                                child: Column(
                                  children: [
                                    Text(controller.result.data.searchdata[index].name,overflow: TextOverflow.clip,textAlign: TextAlign.center ,),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(controller.result.data.searchdata[index].price.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black)),
                                          Icon(controller.result.data.searchdata[index].inFavorites ? Icons.favorite:Icons.favorite_outline,color: controller.result.data.searchdata[index].inFavorites ? kPrimaryColor:Colors.black,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            )
            ),
        ],
      ),
    );
  }
}
