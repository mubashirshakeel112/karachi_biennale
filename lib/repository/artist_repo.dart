import 'package:karachi_biennale/domain/models/artist_model.dart';
import 'package:karachi_biennale/service/artist_service.dart';

class ArtistRepository extends ArtistService{
  final WCArtistService _wcArtistService = WCArtistService();
  @override
  Future<List<ArtistModel>> getArtist() async{
    return await _wcArtistService.getArtist();
  }
}