import 'package:flutter/material.dart';
import 'package:karachi_biennale/domain/models/about_model.dart';
import 'package:karachi_biennale/repository/about_repo.dart';

class AboutController extends ChangeNotifier{
  final AboutRepository _aboutRepository = AboutRepository();
  List<AboutModel> aboutData = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getAbout(BuildContext context) async{
    try{
      setLoading(true);
      aboutData = await _aboutRepository.getAbout();
    }catch(e){
      debugPrint(e.toString());
      // if(context.mounted) CustomSnackBar.errorSnackBar(context, 'Error', e.toString());
    }finally{
      setLoading(false);
    }
    notifyListeners();
  }
}