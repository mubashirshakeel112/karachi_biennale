import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karachi_biennale/domain/models/venue_model.dart';

abstract class VenueService {
  Future<List<VenueModel>> getVenue();
}

class WCVenueService extends VenueService {
  @override
  Future<List<VenueModel>> getVenue() async {
    try {
      final ref = await FirebaseFirestore.instance.collection('vanue').get();
      return ref.docs.map((e) {
        return VenueModel.fromJson(e.data());
      }).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
