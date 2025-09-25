import 'package:flutter/material.dart';
import 'package:karachi_biennale/repository/forget_password_repo.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';

class ForgetPasswordController extends ChangeNotifier {
  final ForgetPasswordRepository _forgetPasswordRepository = ForgetPasswordRepository();
  bool _isLoading = false;
  String _email = '';

  bool get isFormValid => _email.isNotEmpty;

  bool get isLoading => _isLoading;

  String get email => _email;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  Future<void> forgetPassword(BuildContext context) async {
    try {
      setLoading(true);
      bool isForgetPassword = await _forgetPasswordRepository.forgetPassword(email);
      if (isForgetPassword) {
        if (context.mounted) CustomSnackBar.successSnackBar(context: context, title: 'Success', message: 'Check your email',);
      } else {
        if (context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: 'Forget Password Failed');
      }
    } catch (e) {
      if (context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: e.toString(),);
    } finally {
      setLoading(false);
    }
  }
}
