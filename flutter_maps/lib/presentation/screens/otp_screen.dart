 import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final phoneNumber = "" ;
  late String otpCode ;

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Verify your phone number',
            style: TextStyle(color: Colors.black,fontSize: 24 , fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2), 
          child: RichText(text:TextSpan(
          children: [
            TextSpan(
              text: "Enter the 6-digit code number that sent to ",
              style: TextStyle(color: Colors.black , fontSize: 18)
            ),
            TextSpan(
              text: '$phoneNumber',
              style: TextStyle(color: MyColors.blue , fontSize: 18 , height: 1.4)
            ),
          ]
        ))
        )
      ],);
  }


  _buildPindCodeFields(BuildContext context){
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: MyColors.blue,
          inactiveColor: MyColors.blue,
          inactiveFillColor: Colors.white,
          activeFillColor: MyColors.lightBlue,
          selectedColor: MyColors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }


  _buildVerifyButton(){
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          
        },
       child: Text('Verify', style: TextStyle(color: Colors.white , fontSize:  16)
       ,),

       style: ElevatedButton.styleFrom(
        minimumSize: Size(110, 50),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6))
        ),
       ),
       
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32,vertical: 88),
          child: Column(
            children: [
              _buildIntroTexts(),
              SizedBox(height: 88,),
              _buildPindCodeFields(context),
              SizedBox(height: 80,),
              _buildVerifyButton(),
            ],
          )
        )
      ),
    );
  }
}