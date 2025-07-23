// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:karachi_biennale/domain/models/my_event_model.dart';
// import 'package:karachi_biennale/service/my_event_service.dart';
//
// class EventRepository {
//   final WCMyEventService _wcMyEventService = WCMyEventService();
//   Stream<List<MyEventModel>> getEvents() {
//     return _wcMyEventService.getEvents().map((snapshot) {
//       return snapshot.docs.map((doc) {
//         return MyEventModel.fromJson(doc.data());
//       }).toList();
//     });
//   }
// }