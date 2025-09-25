import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Consumer<ForgetPasswordController>(
        builder: (context, provider, child) {
          return Column(
            children: [
              PrimaryAppBar(title: 'Forgot Password', subtitle: 'Lorem ipsum dolor sit amet,'),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
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
                      ),
                      SizedBox(height: 29),
                      !provider.isLoading?CustomButton(
                        title: "Send Email",
                        onPressed: () {
                          if(provider.isFormValid){
                            provider.forgetPassword(context);
                          }else{
                            CustomSnackBar.warningSnackBar(context: context, title: 'Missing Info', message: 'Please fill the field');
                          }
                        },
                      ): CustomLoader(title: 'Forget password...'),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
