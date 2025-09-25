
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karachi_biennale/domain/models/artist_model.dart';

abstract class ArtistService {
  Future<List<ArtistModel>> getArtist();
  Future<List<ArtistModel>> getArtistByIds(List<String> artistId);
}

class WCArtistService extends ArtistService {
  @override
  Future<List<ArtistModel>> getArtist() async {
    try {
      final ref = await FirebaseFirestore.instance.collection('artist').orderBy('order').get();
      return ref.docs.map((e) {
        return ArtistModel.fromJson(e.data(), e.id);
      }).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ArtistModel>> getArtistByIds(List<String> artistId) async{
    if (artistId.isEmpty) {
      return [];
    }
    final ref = await FirebaseFirestore.instance.collection('artist').where(FieldPath.documentId, whereIn: artistId).get();
    try{
      return ref.docs.map((e)=> ArtistModel.fromJson(e.data(), e.id)).toList();
    }catch(e){
      throw Exception(e.toString());
    }
  }
}
