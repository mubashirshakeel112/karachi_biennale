import 'package:karachi_biennale/domain/models/program_model.dart';
import 'package:karachi_biennale/service/program_service.dart';

class ProgramRepository extends ProgramService{
  final WCProgramService _wcProgramService = WCProgramService();
  @override
  Future<List<ProgramModel>> getProgram() async{
    return await _wcProgramService.getProgram();
  }

  @override
  Future<ProgramModel> getProgramById(String id) async{
    return await _wcProgramService.getProgramById(id);
  }
}