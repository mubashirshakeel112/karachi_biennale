import 'package:karachi_biennale/service/check_user_exist_service.dart';

class CheckUserExistRepository extends CheckUserExistService{
  final WCUserService _wcUserService = WCUserService();
  @override
  String isUserExist() {
    return _wcUserService.isUserExist();
  }
}