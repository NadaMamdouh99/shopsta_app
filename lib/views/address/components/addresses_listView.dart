import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/addAdress/view.dart';
import 'package:shopsta_app/views/address/controllers/controller.dart';
import 'package:shopsta_app/views/address/states/controller.dart';
import 'package:shopsta_app/views/address/widgets/address_item.dart';

class AddressesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.of(context);
    return BlocBuilder(
      cubit: addressController,
      builder: (context, state) => state is AddressLoading ? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          )
      ):addressController.addressResult == null ? Center(child: Text('Loading ... '),): addressController.addressResult.data.addressData.isEmpty ?
      Center(
        child: TextButton(
          child: Text('Add new address ...'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressView()));
          },
        ),
      ):RefreshIndicator(
        onRefresh: addressController.getAddresses,

        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.2,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: addressController.addressResult.data.addressData.length,
                itemBuilder: (BuildContext context, int index){
                  return AddressItem(
                    addressController.addressResult.data.addressData[index],
                    true
                    // city: addressController.addressResult.data.addressData[index].city,
                    // region: addressController.addressResult.data.addressData[index].region,
                    // details: addressController.addressResult.data.addressData[index].details,
                    // addressController: addressController,
                    // id: addressController.addressResult.data.addressData[index].id,
                    // index: index,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressView()));
                },
                backgroundColor: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
