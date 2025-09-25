import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/repository/bookmark_repo.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';

class MyEventController extends ChangeNotifier{
  final BookmarkRepository _bookmarkRepository = BookmarkRepository();
  List<MyEventModel> _eventData = [];

  bool _isLoading = false;

  List<MyEventModel> get myEventData => _eventData;
  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getMyEvent() async{
    try{
      setLoading(true);
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if(uid != null){
        _eventData = await _bookmarkRepository.getMyEvent(uid);
      }else{
        debugPrint('Id not found');
      }
    }catch(e){
      debugPrint(e.toString());
    }finally{
      setLoading(false);
    }
  }

  Future<void> deleteEvent(String myEventId, String uid, context) async{
    try{
      await _bookmarkRepository.deleteMyEvent(myEventId, uid);
      CustomSnackBar.successSnackBar(context: context, title: 'Success', message: 'Delete Event Successfully');
      getMyEvent();
    }catch(e){
      debugPrint(e.toString());
    }
  }
}