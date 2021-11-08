import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/address/models/address_model.dart';
import 'package:shopsta_app/views/address/view.dart';
import 'package:shopsta_app/views/address/widgets/address_item.dart';
import 'package:shopsta_app/views/checkOut/controllers/controller.dart';


class AddressCard extends StatelessWidget {

  AddressData addressData;


  AddressCard(this.addressData);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              addressData == null
                  ? Center(
                //heightFactor: 2,
                child: TextButton(
                  child: Text('Choose Your Address ...',style: TextStyle(color: kPrimaryColor),),
                  onPressed: () async {
                    final address =
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AddressView(),
                    ));
                    if (address != null) {
                      CheckOutController.of(context).selectAddress(address);
                    }
                  },
                  // onPressed: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => AddressView()));
                  // },
                ),
              ) : AddressItem(addressData,false)
            ],
          ),
        )
    );
  }
}
