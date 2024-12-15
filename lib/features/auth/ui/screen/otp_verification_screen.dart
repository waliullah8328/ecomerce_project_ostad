
import 'package:ecomerce_project_ostad/app/app_colors.dart';
import 'package:ecomerce_project_ostad/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
                      if(_formKey.currentState!.validate()){

                      }
                    }, child:const Text("Next")),
                const SizedBox(height: 24,),

                // TODO: enable button when 120s is done and invisible the text
                RichText(text: const TextSpan(
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  text: "This code will be expired in ",
                  children: [
                    TextSpan(text: "120s",style: TextStyle(color: AppColors.themeColor))
                  ]
                )),
                TextButton(onPressed: (){}, child: const Text("Resend Code")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
