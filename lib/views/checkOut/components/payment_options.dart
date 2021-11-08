import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/checkOut/components/visa_form.dart';
import 'package:shopsta_app/views/checkOut/controllers/controller.dart';
import 'package:shopsta_app/views/checkOut/widgets/visa_option.dart';


class PaymentOptions extends StatefulWidget {
  CheckOutController checkOutController;


  PaymentOptions(this.checkOutController);

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0,bottom: 12,left: 8,right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Through ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: widget.checkOutController.valueSelected,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    widget.checkOutController.valueSelected = value;
                  });
                },
              ),
              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Money_Flat_Icon.svg/1200px-Money_Flat_Icon.svg.png',width: 35,height: 35,),
              SizedBox(width: 10,),
              Text('Cash', style: TextStyle(fontSize: 17,color: Colors.black87),)
            ],
          ),
          VisaOption(valueSelected: widget.checkOutController.valueSelected,fun: (value) {
            setState(() {
              widget.checkOutController.valueSelected = value;
            });
          },
            checkOutController: widget.checkOutController,
          ),
          // Row(
          //   children: [
          //     Radio(
          //       value: 1,
          //       groupValue: valueSelected,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {
          //         setState(() {
          //           valueSelected = value;
          //         });
          //       },
          //     ),
          //     Image.network('https://namibind.com/wp-content/uploads/2019/06/visa-icon.png',width: 35,height: 35,),
          //     SizedBox(width: 10,),
          //     Text('Debit / Credit Card', style: TextStyle(fontSize: 17,color: Colors.black87),)
          //   ],
          // ),
        ],
      ),
    );
  }
}
