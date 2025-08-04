import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/repository/bookmark_repo.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';

class MyEventController extends ChangeNotifier{
  // List<MyEventModel> myEventModel = [
  //   MyEventModel(imageUrl: Strings.eventImage1, title: 'Art Think Tank', subtitle: 'Karachi School Art', time: '1 : 00 PM'),
  //   MyEventModel(imageUrl: Strings.eventImage1, title: 'Art Think Tank', subtitle: 'Karachi School Art', time: '1 : 00 PM'),
  //   MyEventModel(imageUrl: Strings.eventImage1, title: 'Art Think Tank', subtitle: 'Karachi School Art', time: '1 : 00 PM')
  // ];
  //
  // final EventRepository _eventRepository = EventRepository();
  // MyEventModel? eventModel;
  //
  // bool _isLoading = false;
  //
  // bool get isLoading => _isLoading;
  //
  // setLoading(bool value){
  //   _isLoading = value;
  //   notifyListeners();
  // }
  //
  // Stream<List<MyEventModel>> get eventsStream => _eventRepository.getEvents();
  //
  // // void getEvent(){
  // //   try{
  // //     var data = _eventRepository.getEvents();
  // //   }catch(e){
  // //     print(e.toString());
  // //   }
  // //
  // // }
  //
  // void removeItems(int index){
  //  try{
  //    setLoading(true);
  //    myEventModel.removeAt(index);
  //    notifyListeners();
  //  }catch(e){
  //    print(e.toString());
  //  }finally{
  //    setLoading(false);
  //  }
  // }

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