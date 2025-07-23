import 'package:karachi_biennale/service/signup_service.dart';

class SignupRepository extends SignupService{
  final WCSignupService _wcSignupService = WCSignupService();
  @override
  Future<bool> signup(String email, String password) async{
    return await _wcSignupService.signup(email, password);
  }
}