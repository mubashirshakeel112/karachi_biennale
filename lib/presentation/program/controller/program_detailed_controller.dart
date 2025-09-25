import 'package:flutter/material.dart';
import 'package:karachi_biennale/domain/models/program_model.dart';
import 'package:karachi_biennale/repository/program_repo.dart';

class ProgramDetailedController extends ChangeNotifier{
  final ProgramRepository _programRepository = ProgramRepository();
  bool _isLoading = false;
  ProgramModel? _program;

  bool get isLoading => _isLoading;
  ProgramModel? get program => _program;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getProgramById(String id) async{
    setLoading(true);
   try{
     _program = await _programRepository.getProgramById(id);
     notifyListeners();
   }catch(e){
     throw Exception(e.toString());
   }finally{
     setLoading(false);
   }
  }
}