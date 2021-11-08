import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/address/view.dart';
import 'package:shopsta_app/views/cart/view.dart';
import 'package:shopsta_app/views/commonQuestions/view.dart';
import 'package:shopsta_app/views/complaints/view.dart';
import 'package:shopsta_app/views/contactUs/view.dart';
import 'package:shopsta_app/views/mainView/view.dart';
import 'package:shopsta_app/views/notifications/view.dart';
import 'package:shopsta_app/views/orders/view.dart';
import 'package:shopsta_app/views/search/view.dart';
import 'package:shopsta_app/views/terms/view.dart';
import 'package:shopsta_app/widgets/drawer_list_tiles.dart';
import 'package:shopsta_app/widgets/logo.dart';
import 'package:easy_localization/easy_localization.dart';

class ShopstaDrawer extends StatefulWidget {
  @override
  _ShopstaDrawerState createState() => _ShopstaDrawerState();
}

class _ShopstaDrawerState extends State<ShopstaDrawer> {

  int gindex=0;

  List items = [
    DrawerListTiles('drawer.home'.tr().toString(),Icons.home),
    DrawerListTiles('drawer.cart'.tr().toString(),Icons.shopping_cart_rounded),
    //DrawerListTiles('drawer.offers'.tr().toString(),Icons.local_offer),
    DrawerListTiles('drawer.orders'.tr().toString(),Icons.shopping_bag),
    DrawerListTiles('drawer.notifications'.tr().toString(),Icons.notifications),
    DrawerListTiles('drawer.addresses'.tr().toString(),Icons.location_city),
    DrawerListTiles('drawer.shopstaPay'.tr().toString(),Icons.credit_card_outlined),
    DrawerListTiles('drawer.complaints'.tr().toString(),Icons.record_voice_over_sharp),
    DrawerListTiles('drawer.termsAndConditions'.tr().toString(),Icons.assistant_photo_sharp),
    DrawerListTiles('drawer.contactUs'.tr().toString(),Icons.help_outline_outlined),
  ];
  List pages=[MainView(),CartView(),/*CommonQuestionsView(),*/OrdersView(),NotificationsView(),AddressView(),SearchView(),ComplaintsView(),TermsView(),ContactUsView()];

  _onSelected(int index,page) {
    setState(() => gindex= index);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          scrollDirection: Axis.vertical,
          children : [
            Logo(80, 80, 150,40),
            //SizedBox(height: 20,),
            ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: items.length,
                //scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Row (
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: gindex != null && gindex == index? kPrimaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 7,
                        height: 30,
                      ),
                      Expanded(
                        child: InkWell(
                          child: items[index],
                          onTap: () => _onSelected(index,pages[index]),
                        ),
                      )
                    ],
                  );
                }
            ),
          ]
      ),
    );
  }
}
