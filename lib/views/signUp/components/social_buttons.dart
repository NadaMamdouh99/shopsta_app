import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgw0J7sN6NIpPz7brTGjbby2V9isx82vWreA&usqp=CAU',width: 20,height: 20,),
          Image.network('https://logodix.com/logo/960048.jpg',width: 20,height: 20,),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkb5rIGVawKW8lMuP4gYJC4T_X0L5s3Q8U_A&usqp=CAU',width: 20,height: 20,),
        ],
      ),
    );
  }
}
