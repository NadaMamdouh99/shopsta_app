import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/checkOut/controllers/controller.dart';
import 'package:shopsta_app/views/checkOut/controllers/visa_payment_controller.dart';
import 'package:shopsta_app/views/checkOut/states/visa_payment_states.dart';
import 'package:shopsta_app/views/checkOut/widgets/visa_textField.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class VisaForm extends StatelessWidget {

  CheckOutController checkOutController;


  VisaForm(this.checkOutController);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisaPaymentController(),
      child: BlocBuilder<VisaPaymentController,VisaPaymentStates>(
        builder: (context,state)  {
          final visaPaymentController = VisaPaymentController.of(context);
          return Form(
        key: visaPaymentController.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cardholder Name',style: TextStyle(color: Colors.black54,fontSize: 15),),
              VisaTextField(width: MediaQuery.of(context).size.width*0.92,icon: Icons.person_outline,hintText: 'Name',keyBoardType: TextInputType.text,
                validation: (value){
                  if(value.isEmpty) return 'Cardholder Name can\'t be empty';
                  else return null;
                },
                textFieldController: visaPaymentController.cardHolderNameController,
              ),
              Text('Cardholder Number',style: TextStyle(color: Colors.black54,fontSize: 15),),
              VisaTextField(width: MediaQuery.of(context).size.width*0.92,icon: Icons.credit_card,hintText: 'xxxx xxxx xxxx xxxx',keyBoardType: TextInputType.number,
                validation: (value){
                  if(value.isEmpty) return 'Cardholder Name can\'t be empty';
                  else if(value.length < 12) return 'Cardholder Number can\'t be less than 12 digits';
                  else return null;
                },
                textFieldController: visaPaymentController.cardHolderNumberController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expiration',style: TextStyle(color: Colors.black54,fontSize: 15),),
                      Row(
                        children: [
                          VisaTextField(width: MediaQuery.of(context).size.width*0.28,icon: Icons.calendar_today,hintText:'m',keyBoardType: TextInputType.number,
                            validation: (value){
                              if(value.isEmpty) return 'Expiration can\'t be empty';
                              else return null;
                            },
                            textFieldController: visaPaymentController.expirationMonthController,
                          ),
                          SizedBox(width: 6,),
                          VisaTextField(width: MediaQuery.of(context).size.width*0.28,icon: Icons.calendar_today,hintText:'y',keyBoardType: TextInputType.number,
                            validation: (value){
                              if(value.isEmpty) return 'Expiration can\'t be empty';
                              else return null;
                            },
                            textFieldController: visaPaymentController.expirationYearController,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CCV/CVC',style: TextStyle(color: Colors.black54,fontSize: 15),),
                      VisaTextField(width: MediaQuery.of(context).size.width*0.32,icon: Icons.lock_outline,hintText: 'xxx',keyBoardType: TextInputType.number,
                        validation: (value){
                          if(value.isEmpty) return 'CCV/CVC can\'t be empty';
                          else if(value.length < 3) return 'CCV/CVC can\'t be less than 3 digits';
                          else if(value.length > 3) return 'CCV/CVC can\'t be more than 3 digits';
                          else return null;
                        },
                        textFieldController: visaPaymentController.ccvController,
                      ),
                    ],
                  ),
                ],
              ),
              state is VisaPaymentLoading ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: kPrimaryLightColor,
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  )
              ):NavigationButton('Validate', (){
                visaPaymentController.getToken();
              }),
              Center(child: Text('${visaPaymentController.output}',style: TextStyle(color: Colors.green),)),
              // BlocBuilder<VisaPaymentController,VisaPaymentStates>(
              //   builder: (context,state) => state is VisaPaymentLoading ? Center(
              //   child: CircularProgressIndicator(
              //   backgroundColor: kPrimaryLightColor,
              //   valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              // ),
              // ): NavigationButton('Validate',(){
              //
              //   })
            ],
          ),
        ),
      );
        }
      ),
    );
  }
}
