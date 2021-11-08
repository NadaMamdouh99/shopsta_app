import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/address/controllers/controller.dart';
import 'package:shopsta_app/views/address/components/addresses_listView.dart';
import 'package:shopsta_app/widgets/app_bar.dart';

class AddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressController = AddressController()..getAddresses();
    return BlocProvider(
      create: (context) => addressController,
      child: Scaffold(
        appBar: homeAppBar(0.0,context,false,false),
        backgroundColor: Colors.white,
        body: AddressesListView(),
      ),
    );
  }
}
