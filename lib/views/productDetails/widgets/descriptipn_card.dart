import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class DescriptionCard extends StatelessWidget {
  String description;


  DescriptionCard(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey,blurRadius: 0.6,offset: Offset.fromDirection(1))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          /*border: Border.all(
                //color: Colors.black,
                width: 0.5,
              )
                 */
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.description_outlined,color:kPrimaryColor),
                Text('ProductDetails.description'.tr().toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,)
              ],
            ),
            SizedBox(height: 10,),
            Text(description,
              style: TextStyle(color: Colors.black54,fontSize: 15),
              textAlign: TextAlign.start,
              //textAlign: '${SharedHelper.getLanguageCode}' == 'en' ? TextAlign.left : TextAlign.right,
            ),
          ],
        )
    );
  }
}
