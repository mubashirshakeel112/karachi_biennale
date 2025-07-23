import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/forgot/controller/forget_password_controller.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_button.dart';
import 'package:karachi_biennale/widgets/custom_loader.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';
import 'package:karachi_biennale/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String id = '/forgot_password_view';
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar.primaryAppBar(title: 'Forgot Password', subtitle: 'Lorem ipsum dolor sit amet,'),
      body: Consumer<ForgetPasswordController>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email Address', style: interBold,),
                  SizedBox(height: 10,),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter your email address",
                    prefixIcon: SvgPicture.asset(Strings.mailIcon),
                    onChanged: (value){provider.setEmail(value);},
                    // validator: (value) {
                    //   var nullAbleValue = value ?? "";
                    //   if (nullAbleValue.isEmpty || !nullAbleValue.contains("@")) {
                    //     return "Please enter valid email";
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 29),
                  !provider.isLoading?CustomButton(
                    title: "Send Email",
                    onPressed: () {
                      if(provider.isFormValid){
                        provider.forgetPassword(context);
                      }else{
                        // CustomSnackBar.show(context, title: 'Missing Info', message: 'Please fill the field', icon: Icons.warning_amber, iconColor: AppColors.yellowColor);
                      }
                    },
                  ): CustomLoader(title: 'Forget password...'),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
