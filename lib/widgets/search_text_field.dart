import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/search/controllers/controler.dart';
import 'package:shopsta_app/views/search/states/controller.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller= SearchController();
    return BlocProvider(
      create: (context) => controller,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(29),
        ),
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            cursorColor: kPrimaryColor,
              autofocus: false,
              decoration: InputDecoration(
                // suffixIcon: IconButton(
                //     icon: Icon(Icons.search,color: Colors.black,),
                //     color: Colors.white,
                //     onPressed: () async{
                //       await controller.getSearchResults();
                //     }
                // ),
                  icon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    ),
                    onPressed: () async{
                        await controller.getSearchResults();
                    }
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none,
                  fillColor:Colors.grey.shade100,
              )
          ),
          hideOnEmpty: true,
          suggestionsCallback: (pattern) async {
            return await BackendService.getSuggestions(pattern,3,controller);
          },
          itemBuilder: (context, suggestion) {
            return BlocBuilder(
                cubit: controller,
                builder: (context,state) => state is SearchLoading ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: kPrimaryLightColor,
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  ),
                  //heightFactor: 8,
                ) :controller.result == null ? Text('No result'):Expanded(
                  child: Container(
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
                                //Image.network(controller.result.data.searchdata[index].image,width: 100,height: 100,fit: BoxFit.fill,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8),
                                  child: Column(
                                    children: [
                                      Text(suggestion['name'],overflow: TextOverflow.clip,textAlign: TextAlign.center ,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(suggestion['price'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black)),
                                          //Icon(controller.result.data.searchdata[index].inFavorites ? Icons.favorite:Icons.favorite_outline,color: controller.result.data.searchdata[index].inFavorites ? kPrimaryColor:Colors.black,),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                )
            );
          },
          onSuggestionSelected: (suggestion) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => null
            ));
          },
        ),
      ),
    );
  }
}


class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query,int count,SearchController controller) async {
    await Future<void>.delayed(Duration(seconds: 1));

    return List.generate(count, (index) {
      print(controller.result.data.searchdata[index].name.startsWith(query));
      return {
        if(controller.result.data.searchdata[index].name.contains(query) == true )
          'name': controller.result.data.searchdata[index].name,
          'price': controller.result.data.searchdata[index].price.toString(),

        // if(controller.result.data.searchdata[index].name.contains(query) == false)
        //   'name': '',
        //   'price': ''
      };
    });
  }
}


// List.generate(2, (index) {
// print(controller.result.data.searchdata[index].name.contains(query));
// return {
// if(controller.result.data.searchdata[index].name.contains(query) == true )
// 'name': controller.result.data.searchdata[index].name,
// 'price': controller.result.data.searchdata[index].price.toString(),
//
// if(controller.result.data.searchdata[index].name.contains(query) == false)
// 'name': '',
// 'price': ''
// };
// });

// return Container(
// width: MediaQuery.of(context).size.width,
// height: 40,
// padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
// decoration: BoxDecoration(
// color: Colors.grey.shade100,
// borderRadius: BorderRadius.circular(29),
// ),
// child: TextFormField(
// cursorColor: kPrimaryColor,
// decoration: InputDecoration(
// icon: Icon(
// Icons.search,
// color: kPrimaryColor,
// ),
// hintText: 'Search...',
// border: InputBorder.none,
// fillColor:Colors.grey.shade100,
// ),
// ),
// );
