import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/commonQuestions/components/common_questions_header.dart';
import 'package:shopsta_app/views/commonQuestions/controllers/controller.dart';
import 'package:shopsta_app/views/commonQuestions/states/controller.dart';
import 'package:shopsta_app/views/commonQuestions/widgets/common_questions_tiles.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/background.dart';

class CommonQuestionsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faqsController = FAQsController.of(context);
    return Background(
      FadeAnimation(1,
        BlocBuilder(
          cubit: faqsController,
          builder:(context, state) => state is FAQsLoading ?  Center(
            child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ))
          :faqsController.faQsModel == null ? Center(child: Text('Loading ... '),) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              CommonQuestionsHeader(),
              Expanded(
                child: ListView.builder(
                  itemCount: faqsController.faQsModel.data.fAQsData.length,
                  padding: EdgeInsets.only(left: 10,right: 10),
                  itemBuilder: (BuildContext context ,  int index) {
                    return CommonQuestionsTiles(faqsController.faQsModel.data.fAQsData[index].question,
                        faqsController.faQsModel.data.fAQsData[index].answer,
                        Icons.notifications_none
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      "assets/images/main_top.png",
      "assets/images/login_bottom.png",
    );
  }
}
