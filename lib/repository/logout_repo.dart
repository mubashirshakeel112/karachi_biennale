import 'package:karachi_biennale/service/logout_service.dart';

class LogoutRepository extends LogoutService{
  final WCLogoutService _wcLogoutService = WCLogoutService();
  @override
  Future<bool> logout() async{
    return await _wcLogoutService.logout();
  }
}