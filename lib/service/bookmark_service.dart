import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';

abstract class BookMarkService {
  Future<void> setMyEvent(MyEventModel myEvent, String uid);
  Future<List<MyEventModel>> getMyEvent(String uid);
  Future<void> deleteMyEvent(String myEventId, String uid);
  Future<List<String>> getBookmarkedEventIds(String uid);
}

class WCBookMarkService extends BookMarkService {
  @override
  Future<void> setMyEvent(MyEventModel myEvent, String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).collection('myEvent').doc(myEvent.id).set({
      ...myEvent.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> deleteMyEvent(String myEventId, String uid) async{
    try{
      await FirebaseFirestore.instance.collection('users').doc(uid).collection('myEvent').doc(myEventId).delete();
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<List<MyEventModel>> getMyEvent(String uid) async{
    try{
      final ref = await FirebaseFirestore.instance.collection('users').doc(uid).collection('myEvent').get();
      return ref.docs.map((e){return MyEventModel.fromJson(e.data(), e.id);}).toList();
    }catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<String>> getBookmarkedEventIds(String uid) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('myEvent')
          .get();

      return snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      debugPrint('Error getting bookmarked event ids: $e');
      return [];
    }
  }

}
