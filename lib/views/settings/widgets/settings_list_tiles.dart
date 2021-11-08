import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/changePassword/view.dart';
import 'package:shopsta_app/views/editProfile/view.dart';
import 'package:shopsta_app/views/profileInfo/view.dart';

class SettingsListTiles extends StatelessWidget {

  List icons;
  List titles;


  SettingsListTiles(this.icons, this.titles);
  List pages=[ProfileInfoView(),ChangePasswordView(),EditProfileView(),ProfileInfoView()];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 15),
        shrinkWrap: true,
        itemCount: icons.length,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 15,left: 6,right: 6),
              padding: EdgeInsets.symmetric(vertical: 8.0),
              height: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                  leading:  Icon(icons[index],color: kPrimaryColor),
                  title:Text(titles[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.black,),),
                  trailing:IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages[index])
                      );
                    },
                    color: kPrimaryColor,)
              ),
          );
        }
    );
  }
}
