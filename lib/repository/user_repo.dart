import 'package:karachi_biennale/domain/models/user_model.dart';
import 'package:karachi_biennale/service/user_service.dart';

class UserRepository extends UserService{
  final WCUserService _wcUserService = WCUserService();
  @override
  Future<UserModel> getUser(String uid) async{
    return await _wcUserService.getUser(uid);
  }

  @override
  Future<void> setUser(UserModel user) async{
    return await _wcUserService.setUser(user);
  }
}