import 'package:flutter/cupertino.dart';
import 'package:karachi_biennale/domain/models/venue_model.dart';
import 'package:karachi_biennale/repository/venue_repo.dart';

class VenueDetailController extends ChangeNotifier{
  final VenueRepository _venueRepository = VenueRepository();
  bool _isLoading = false;
  VenueModel? _venue;

  bool get isLoading => _isLoading;
  VenueModel? get venue => _venue;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getVenueById(String id) async{
    setLoading(true);
    try{
      _venue = await _venueRepository.getVenueById(id);
      notifyListeners();
    }catch(e){
      throw Exception(e.toString());
    }finally{
      setLoading(false);
    }
  }

}