import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/login/login_view.dart';
import 'package:karachi_biennale/presentation/register/controller/signup_controller.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_button.dart';
import 'package:karachi_biennale/widgets/custom_loader.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';
import 'package:karachi_biennale/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  static const String id = '/register_view';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar.primaryAppBar(title: 'Register', subtitle: 'Please sign in to continue'),
      body: SingleChildScrollView(
        child: Consumer<SignupController>(
          builder: (context, provider, child) {
            return Form(
              key: formKey,
              child: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name', style: interBold),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: nameController,
                          hintText: "Enter your full name",
                          prefixIcon: SvgPicture.asset(Strings.userIcon),
                          onChanged: (value) {
                            provider.setUserName(value);
                          },
                          // validator: (value) {
                          //   var nullAbleValue = value ?? "";
                          //   if (nullAbleValue.isEmpty) {
                          //     return "Input field is required";
                          //   }
                          //   return null;
                          // },
                        ),
                        SizedBox(height: 16),
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
                          //   if (nullAbleValue.isEmpty) {
                          //     return "Email required";
                          //   }
                          //   final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                          //
                          //   if (!emailRegex.hasMatch(nullAbleValue.trim())) {
                          //     return 'Please enter a valid email address';
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
                          //     return "Please enter valid email";
                          //   }
                          //   return null;
                          // },
                        ),
                        SizedBox(height: 18),
                        Text('Confirm Password', style: interBold),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: confirmPasswordController,
                          hintText: "Enter your password",
                          prefixIcon: SvgPicture.asset(Strings.passwordIcon),
                          onChanged: (value) {
                            provider.setConfirmPassword(value);
                          },
                          // validator: (value) {
                          //   var nullAbleValue = value ?? "";
                          //   if (nullAbleValue.isEmpty || nullAbleValue.length < 8) {
                          //     return "Please enter valid email";
                          //   }
                          //   return null;
                          // },
                        ),
                        SizedBox(height: 29),
                        !provider.isLoading
                            ? CustomButton(
                              title: "Sign up",
                              onPressed: () {
                                if (provider.isSignFormValid) {
                                  if (provider.isPasswordValid) {
                                    provider.signup(context);
                                  } else {
                                    // CustomSnackBar.show(
                                    //   context,
                                    //   title: 'Error',
                                    //   message: 'Invalid Password',
                                    //   icon: Icons.cancel,
                                    //   iconColor: AppColors.danger,
                                    // );
                                  }
                                } else {
                                  // CustomSnackBar.show(
                                  //   context,
                                  //   title: 'Missing Info',
                                  //   message: 'Please fill all the fields',
                                  //   icon: Icons.warning_amber,
                                  //   iconColor: AppColors.yellowColor,
                                  // );
                                }
                              },
                            )
                            : CustomLoader(title: 'Singing up...'),
                        Padding(
                          padding: const EdgeInsets.only(top: 39, bottom: 24),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(style: interLight, text: "Already have an account? "),
                                  TextSpan(
                                    style: interBold,
                                    text: "Login now",
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () => Navigator.pushNamed(context, LoginView.id),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
