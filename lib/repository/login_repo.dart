import 'package:karachi_biennale/service/login_service.dart';

class LoginRepository extends LoginService{
  final WCLoginService _wcLoginService = WCLoginService();
  @override
  Future<bool> login(String email, String password) async{
    return await _wcLoginService.login(email, password);
  }
}