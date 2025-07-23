import 'package:flutter/widgets.dart';
import 'package:karachi_biennale/domain/models/venue_model.dart';
import 'package:karachi_biennale/repository/venue_repo.dart';

class VenueController extends ChangeNotifier{
  final VenueRepository _venueRepository = VenueRepository();
  List<VenueModel> _venueData = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<VenueModel> get venueData => _venueData;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getVenue() async{
    try{
      setLoading(true);
      _venueData = await _venueRepository.getVenue();
    }catch(e){
      debugPrint(e.toString());
    }finally{
      setLoading(false);
    }
  }

}