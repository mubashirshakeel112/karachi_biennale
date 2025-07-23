import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karachi_biennale/domain/models/program_model.dart';

abstract class ProgramService {
  Future<List<ProgramModel>> getProgram();
}

class WCProgramService extends ProgramService {
  @override
  Future<List<ProgramModel>> getProgram() async {
    try {
      final ref = await FirebaseFirestore.instance.collection('program').get();
      return ref.docs.map((e) {
        return ProgramModel.fromJson(e.data(), e.id);
      }).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
