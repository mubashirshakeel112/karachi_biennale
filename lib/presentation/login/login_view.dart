import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/forgot/forgot_password_view.dart';
import 'package:karachi_biennale/presentation/login/controller/login_controller.dart';
import 'package:karachi_biennale/presentation/register/register_view.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_button.dart';
import 'package:karachi_biennale/widgets/custom_loader.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';
import 'package:karachi_biennale/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  static const String id = '/login_view';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar.primaryAppBar(title: 'Login', subtitle: 'Please sign in to continue'),
      body: SingleChildScrollView(
        child: Consumer<LoginController>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address', style: interBold),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Enter your email address",
                      prefixIcon: SvgPicture.asset(Strings.mailIcon),
                      onChanged: (value) {
                        provider.setEmail(value);
                      },
                      // validator: (value) {
                      //   var nullAbleValue = value ?? "";
                      //   if (nullAbleValue.isEmpty || !nullAbleValue.contains("@")) {
                      //     return "Please enter valid email";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 18),
                    Text('Password', style: interBold),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "Enter your password",
                      prefixIcon: SvgPicture.asset(Strings.passwordIcon),
                      onChanged: (value) {
                        provider.setPassword(value);
                      },
                      // validator: (value) {
                      //   var nullAbleValue = value ?? "";
                      //   if (nullAbleValue.isEmpty || nullAbleValue.length < 8) {
                      //     return "Please enter valid password";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 13),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPasswordView.id);
                      },
                      child: Text("Forgot Password?", style: interLight),
                    ),
                    SizedBox(height: 48),
                    !provider.isLoading ? CustomButton(
                      title: "Sign in",
                      onPressed: () {
                        if (provider.isFormValid) {
                          provider.login(context);
                        }else{
                          // CustomSnackBar.show(context, title: 'Missing Info', message: 'Please all the fields', icon: Icons.warning_amber, iconColor: AppColors.yellowColor);
                        }
                      },
                    ) : CustomLoader(title: 'Signing in...'),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 24),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "Don’t have an account? ", style: interLight),
                              TextSpan(
                                text: "Register now",
                                style: interBold,
                                recognizer:
                                    TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, RegisterView.id),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
