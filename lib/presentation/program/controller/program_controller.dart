import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/domain/models/program_model.dart';
import 'package:karachi_biennale/repository/bookmark_repo.dart';
import 'package:karachi_biennale/repository/program_repo.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';

class ProgramController extends ChangeNotifier{
  final ProgramRepository _programRepository = ProgramRepository();
  final BookmarkRepository _bookmarkRepository = BookmarkRepository();
  List<ProgramModel> _programData = [];
  List<ProgramModel> _filteredProgramData = [];
  String _searchQuery = '';
  bool _isLoading = false;
  List<String> _bookmarkedEventIds = [];

  bool get isLoading => _isLoading;
  List<ProgramModel> get programData => _programData;
  List<String> get bookmarkedEventIds => _bookmarkedEventIds;
  List<ProgramModel> get filteredProgramData => _filteredProgramData;
  String get searchQuery => _searchQuery;


  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getProgram() async{
    try{
      setLoading(true);
      _programData = await _programRepository.getProgram();
      _filteredProgramData = List.from(_programData);
    }catch(e){
      debugPrint(e.toString());
    }finally{
      setLoading(false);
    }
  }

  // Future<void> setMyEvent(MyEventModel myEvent, String uid, BuildContext context) async{
  //  try{
  //    await _bookmarkRepository.setMyEvent(myEvent, uid);
  //    if(context.mounted) CustomSnackBar.successSnackBar(context: context, title: 'Success', message: 'Added Event Successfully');
  //  }catch(e){
  //    debugPrint(e.toString());
  //  }
  // }

  Future<void> toggleBookmark(MyEventModel myEvent, String uid, BuildContext context) async {
    try {
      if (_bookmarkedEventIds.contains(myEvent.id)) {
        await _bookmarkRepository.deleteMyEvent(myEvent.id, uid);
        _bookmarkedEventIds.remove(myEvent.id);
        if (context.mounted) {
          CustomSnackBar.successSnackBar(
            context: context,
            title: 'Removed',
            message: 'Event removed from your bookmarks',
          );
        }
      } else {
        await _bookmarkRepository.setMyEvent(myEvent, uid);
        _bookmarkedEventIds.add(myEvent.id);
        if (context.mounted) {
          CustomSnackBar.successSnackBar(
            context: context,
            title: 'Success',
            message: 'Event bookmarked successfully',
          );
        }
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadBookmarkedEventIds() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      _bookmarkedEventIds = await _bookmarkRepository.getBookmarkedEventIds(uid);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading bookmarks: $e');
    }
  }

  void filterPrograms(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredProgramData = List.from(_programData);
    } else {
      _filteredProgramData = _programData
          .where((program) => program.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

}