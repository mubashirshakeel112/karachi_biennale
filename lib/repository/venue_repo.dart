import 'package:karachi_biennale/domain/models/venue_model.dart';
import 'package:karachi_biennale/service/venue_service.dart';

class VenueRepository extends VenueService{
  final WCVenueService _wcVenueService = WCVenueService();
  @override
  Future<List<VenueModel>> getVenue() async{
    return await _wcVenueService.getVenue();
  }
}