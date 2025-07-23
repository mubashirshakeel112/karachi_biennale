import 'package:karachi_biennale/service/forget_password_service.dart';

class ForgetPasswordRepository extends ForgetPasswordService{
  final WCForgetPasswordService _wcForgetPasswordService = WCForgetPasswordService();
  @override
  Future<bool> forgetPassword(String email) async{
    return await _wcForgetPasswordService.forgetPassword(email);
  }

}