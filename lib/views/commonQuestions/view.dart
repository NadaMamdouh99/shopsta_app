import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/commonQuestions/components/common_questions_body.dart';
import 'package:shopsta_app/views/commonQuestions/controllers/controller.dart';

class CommonQuestionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faqsController = FAQsController()..getFAQs();
    return BlocProvider(
      create: (context) => faqsController,
      child: Scaffold(
        body: CommonQuestionsBody(),
      ),
    );
  }
}
