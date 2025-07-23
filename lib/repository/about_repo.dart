import 'package:karachi_biennale/domain/models/about_model.dart';
import 'package:karachi_biennale/service/about_service.dart';

class AboutRepository extends AboutService{
  final WCAboutService _wcAboutService = WCAboutService();
  @override
  Future<List<AboutModel>> getAbout() async{
    return await _wcAboutService.getAbout();
  }
}