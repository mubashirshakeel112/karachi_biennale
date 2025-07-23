// import 'package:cloud_firestore/cloud_firestore.dart';
//
// abstract class MyEventService {
//   Stream<QuerySnapshot<Map<String, dynamic>>> getEvents();
// }
//
// class WCMyEventService extends MyEventService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Stream<QuerySnapshot<Map<String, dynamic>>> getEvents() {
//     try {
//       var snapshot = _firestore.collection('events').snapshots();
//       return snapshot;
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
// }
