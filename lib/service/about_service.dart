import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karachi_biennale/domain/models/about_model.dart';
import 'package:karachi_biennale/widgets/firebase_error_handler.dart';

abstract class AboutService{
  Future<List<AboutModel>> getAbout();
}

class WCAboutService extends AboutService{
  @override
  Future<List<AboutModel>> getAbout() async{
    try{
      final firestore = await FirebaseFirestore.instance.collection('about').get();
      return firestore.docs.map((e){
        return AboutModel.fromJson(e.data());
      }).toList();
    }catch(e){
      final errorMessage = FirebaseErrorHandler.handleFirebaseError(e);
      throw Exception(errorMessage);
    }
  }
}