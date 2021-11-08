import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/splash/view.dart';


class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SplashView()),
    );
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,color: Colors.black45);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
      bodyTextStyle: bodyStyle,
      imageFlex: 1,
      descriptionPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
        pages: [
          PageViewModel(
              title: "Get your favourite products",
              body:
              "Choose your favourite products from hundreds of products ! ",
              //https://neurotags-blog.s3.amazonaws.com/blog/wp-content/uploads/2021/01/Consumer-Marketing-Service.png
              //https://img.freepik.com/free-vector/smartphone-ecommerce-technology-with-shopping-cart_24640-43015.jpg?size=626&ext=jpg
              image: Image.network('https://marketing.limited/wp-content/uploads/2020/06/e-commerce-vector-illustration-concept_95561-50.jpg'),
              decoration: pageDecoration
          ),
          PageViewModel(
            title: "Easy Payment",
            body:
            "Order your products by cash on delivery or pay through a faster and more secure payment gateway !",
            //https://img.graphicsurf.com/2020/08/electronic-wallet-vector-free-illustration.jpg
            image: Image.network('https://apicms.thestar.com.my/uploads/images/2021/06/01/1168281.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Express Delivery",
            body:
            "Hundreds of delivery men are waiting for your order, so order now and we will deliver it to your home !",
            image: Image.network('https://thumbs.dreamstime.com/b/delivery-man-ride-motorcycle-come-out-smartphone-food-goods-service-concept-198119381.jpg'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        done: Text('Get Started', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12)),
        skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,)),
        onSkip: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => SplashView()),
          );
        },
        showSkipButton: true,
        next: Icon(Icons.arrow_forward,color: kPrimaryColor,),
        curve: Curves.fastLinearToSlowEaseIn,
        dotsDecorator: DotsDecorator(
          size: Size(10.0, 10.0),
          activeColor: kPrimaryColor,
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
    );
  }
}
