
import 'dart:async';


import 'package:ecomerce_project_ostad/app/app_colors.dart';
import 'package:ecomerce_project_ostad/app/app_constant.dart';
import 'package:ecomerce_project_ostad/features/auth/ui/screen/complete_profile_screen.dart';
import 'package:ecomerce_project_ostad/features/auth/ui/widgets/app_logo_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  static const String name = "/otp-verification";

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstant.resentOTPTimeOutInSec.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;

  void _startResendCodeTimer(){
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstant.resentOTPTimeOutInSec;
   timer =  Timer.periodic(const Duration(seconds: 1), (t) {

      _remainingTime.value--;
      if(_remainingTime.value == 0){
        t.cancel();
        _enableResendCodeButton.value = true;
      }


    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _startResendCodeTimer();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80,),
                const AppLogoWidget(),
                const SizedBox(height: 16,),
                Text("Enter OTP Code",style: Theme.of(context).textTheme.titleLarge),

                Text("A 4 digit otp has been sent to your email",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
                const SizedBox(height: 24,),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: AppColors.themeColor,
                    //selectedFillColor: AppColors.themeColor,
                    activeColor: AppColors.themeColor,


                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  //enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: _otpTEController,
                  onCompleted: (v) {
                    print("Completed");
                  },

                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),


                const SizedBox(height: 16,),
                ElevatedButton(

                    onPressed: (){
                      /*
                      if(_formKey.currentState!.validate()){

                      }*/
                      Navigator.pushNamed(context, CompleteProfileScreen.name);
                    }, child:const Text("Next")),
                const SizedBox(height: 24,),

                // TODO: enable button when 120s is done and invisible the text
                Obx(() => Visibility(
                  visible: !_enableResendCodeButton.value,
                  child: RichText(text:  TextSpan(
                    style: TextStyle(
                      color: Colors.grey
                    ),
                    text: "This code will be expired in ",
                    children: [
                      TextSpan(text: "${_remainingTime.value}s",style: TextStyle(color: AppColors.themeColor))
                    ]
                  )),
                )),
                Obx(() => Visibility(
                  visible: _enableResendCodeButton.value,
                  child: TextButton(onPressed: (){
                    _startResendCodeTimer();
                  }, child: const Text("Resend Code")),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
