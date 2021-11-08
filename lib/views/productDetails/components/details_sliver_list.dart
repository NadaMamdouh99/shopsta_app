import 'package:flutter/material.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/productDetails/widgets/descriptipn_card.dart';
import 'package:shopsta_app/views/productDetails/widgets/note_text_Field.dart';
import 'package:shopsta_app/views/productDetails/widgets/price_and_adding_items_row.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailsSliverList extends StatelessWidget {
  String name;
  String prePrice;
  String price;
  String description;
  int discount;
  int id;


  DetailsSliverList(this.name,this.prePrice, this.price,this.description,this.discount,this.id);
  //int counter=0;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text(name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),textAlign: TextAlign.center,overflow: TextOverflow.visible)),
                SizedBox(height: 20,),
                DescriptionCard(description),
                SizedBox(height: 30,),
                PriceAndAddingItemsRow(prePrice,price,discount,id),
                SizedBox(height: 30,),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ProductDetails.addNote'.tr().toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.left,),
                    NoteTextField('ProductDetails.hintText'.tr().toString(), Icons.note_outlined,TextInputType.text),
                  ],
                ),
                SizedBox(height: 200,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
