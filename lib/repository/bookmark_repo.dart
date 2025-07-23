import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/domain/models/program_model.dart' hide ProgramModel;
import 'package:karachi_biennale/service/bookmark_service.dart';

class BookmarkRepository extends BookMarkService{
  final WCBookMarkService _wcBookMarkService = WCBookMarkService();
  @override
  Future<void> setMyEvent(MyEventModel myEvent, String uid) async{
    await _wcBookMarkService.setMyEvent(myEvent, uid);
  }

  @override
  Future<void> deleteMyEvent(String myEventId, String uid) async{
    await _wcBookMarkService.deleteMyEvent(myEventId, uid);
  }

  @override
  Future<List<MyEventModel>> getMyEvent(String uid) async{
    return await _wcBookMarkService.getMyEvent(uid);
  }

  @override
  Future<List<String>> getBookmarkedEventIds(String uid) async{
    return await _wcBookMarkService.getBookmarkedEventIds(uid);
  }
}