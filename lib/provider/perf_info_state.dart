import 'package:flutter_riverpod/flutter_riverpod.dart';

//初期値として東京の12番を入れておく
final prefNumProvider = StateProvider<int>((ref) => 12);
final prefNameProvider = StateProvider<String>((ref)=>"東京都");
final patientNumProvider = StateProvider<int>((ref)=>0);
final riskProvider = StateProvider<double>((ref)=>0);


//すみませんここでロード状況も管理させてください
final isLoadingProvider = StateProvider<bool>((ref) => false);
