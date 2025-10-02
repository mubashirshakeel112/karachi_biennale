import 'package:cloud_firestore/cloud_firestore.dart';

class VoteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> voteArtist(String userId, String artistId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('artist_votes')
        .doc(artistId)
        .set({
      'voted': true,
      'voteTime': FieldValue.serverTimestamp(),
    });
  }

  Future<void> unvoteArtist(String userId, String artistId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('artist_votes')
        .doc(artistId)
        .delete();
  }

  Future<List<String>> getVotedArtistIds(String userId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('artist_votes')
        .get();

    return snapshot.docs.map((doc) => doc.id).toList();
  }
}
