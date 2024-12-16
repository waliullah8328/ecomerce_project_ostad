
import 'package:ecomerce_project_ostad/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:ecomerce_project_ostad/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = "/complete-profile_screen";

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 60,),
              const AppLogoWidget(width: 100,height: 100,),
              const SizedBox(height: 16,),
              Text("Complete Profile",style: Theme.of(context).textTheme.titleLarge),

              Text("Get started with us with your details",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
              const SizedBox(height: 24,),

              _buildCompleteProfileForm(),
              const SizedBox(height: 16,),
              ElevatedButton(

                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.pushNamed(context, OTPVerificationScreen.name);

                    }

                  }, child:const Text("Complete")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  const InputDecoration(
                        hintText: "First Name",


                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your first name";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  const InputDecoration(
                        hintText: "Last Name",


                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your last name";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _mobileTEController,

                      keyboardType: TextInputType.phone,
                      maxLength: 11,

                      decoration:  const InputDecoration(
                        hintText: "Mobile",
                        counterText: '',


                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your mobile number";
                        }
                        if(RegExp(r'^01[3-9]\d{8}$').hasMatch(value!)== false){
                          return "Enter a valid number(ex: 01XXXXXXXXX)";

                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _cityTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  const InputDecoration(
                        hintText: "City",


                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter a valid city";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      maxLines: 3,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _shippingAddressTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  const InputDecoration(
                        hintText: "Shipping Address",


                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter a valid shipping address";
                        }

                        return null;
                      },
                    ),

                  ],
                ),
    );
  }
}
