import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/checkOut/components/visa_form.dart';
import 'package:shopsta_app/views/checkOut/controllers/controller.dart';

class VisaOption extends StatelessWidget {
  int valueSelected;
  Function fun;
  CheckOutController checkOutController;

  VisaOption({this.valueSelected, this.fun,this.checkOutController});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        //margin: EdgeInsets.symmetric(vertical: 10),
        //padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(29),
        ),
        child:  ExpansionTile(
          backgroundColor: Colors.transparent,
          maintainState: false,
          tilePadding: EdgeInsets.only(left: 0),
          childrenPadding: EdgeInsets.only(bottom: 10),
          title: Row(
            children: [
              Radio(
                value: 2,
                groupValue: valueSelected,
                activeColor: kPrimaryColor,
                onChanged: fun
              ),
              Image.network('https://namibind.com/wp-content/uploads/2019/06/visa-icon.png',width: 35,height: 35,),
              Text('   Debit / Credit Card',style: TextStyle(color: Colors.black),),
            ],
          ),
          children: [
            VisaForm(checkOutController),
          ],
        ),
    );
  }
}
