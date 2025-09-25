import 'package:flutter/widgets.dart';
import 'package:karachi_biennale/domain/models/artist_model.dart';
import 'package:karachi_biennale/repository/artist_repo.dart';

class ArtistIdController extends ChangeNotifier{
  final ArtistRepository _artistRepository = ArtistRepository();
  bool _isLoading = false;
  List<ArtistModel> _artists = [];
  
  bool get isLoading => _isLoading;
  List<ArtistModel> get artists => _artists;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getArtistsById(List<String> artistId) async{
    setLoading(true);
    try{
      _artists = await _artistRepository.getArtistByIds(artistId);
    }catch(e){
      throw Exception(e.toString());
    }finally{
      setLoading(false);
    }
  }
}