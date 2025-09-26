import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Consumer<LoginController>(
        builder: (context, provider, child) {
          return Column(
            children: [
              PrimaryAppBar(
                title: 'Login',
                subtitle: 'Please sign in to continue',
                onHomeTap: (){
                  CustomSnackBar.warningSnackBar(context: context, title: 'Login Required', message: 'Please login to continue to the Home page.');
                },
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: ListView(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
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
                            CustomSnackBar.warningSnackBar(context: context, title: 'Missing Info', message: 'Please all the fields',);
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
              ),
            ],
          );
        }
      ),
    );
  }
}
