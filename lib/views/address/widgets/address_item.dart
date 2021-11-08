import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/address/controllers/controller.dart';
import 'package:shopsta_app/views/address/models/address_model.dart';
import 'package:shopsta_app/views/checkOut/controllers/controller.dart';

class AddressItem extends StatefulWidget {

 AddressData addressData;
 bool isCanceable;

 AddressItem(this.addressData,this.isCanceable);
 // String city;
  // String region;
  // String details;
  // AddressController addressController;
  // int id;
  // int index;


  //AddressItem({this.city, this.region, this.details, this.addressController, this.id,this.index});

  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  int value = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 6,right: 6),
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height/4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 12.0,bottom: 12,left: 8,right: 8),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.addressData.city,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text('${widget.addressData.region} , ${widget.addressData.details}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey),overflow: TextOverflow.ellipsis,)
            ],
          ),
          leading: widget.isCanceable ?  Radio(
            value: 0,
            activeColor: kPrimaryColor,
            groupValue: value,
            onChanged: (int val){
              setState(() {
                value = val;
              });
              Navigator.pop(context, widget.addressData);
            },
            //toggleable: true,
          ) : null,
          trailing: IconButton(
            onPressed: (){
              if(widget.isCanceable) {
                AddressController.of(context).deleteAddress(widget.addressData.id, context);
              }
              else {
                CheckOutController.of(context).selectAddress(null);
              }
            },
            icon: Icon(Icons.delete, color: kPrimaryColor,),
          ),
        )
      ),
    );
  }
}
