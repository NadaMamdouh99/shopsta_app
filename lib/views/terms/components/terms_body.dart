import 'package:flutter/material.dart';
import 'package:shopsta_app/views/mainView/view.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class TermsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30,top: 15),
      child: Column(
        children: [
          Text('By using this app you agree that '*20,textAlign: TextAlign.justify,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: NavigationButton('Agree',(){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainView())
              );
            },),
          ),
        ],
      ),
    );
  }
}
