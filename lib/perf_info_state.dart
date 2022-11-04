import 'package:flutter_riverpod/flutter_riverpod.dart';

//初期値として東京の12番を入れておく
final prefNumProvider = StateProvider<int>((ref) => 12);
final prefNameProvider = StateProvider<String>((ref)=>"東京都");
final patientNumProvider = StateProvider<int>((ref)=>0);
final riskProvider = StateProvider<double>((ref)=>0);

// final prefInfoProvider = StateProvider<PrefInfoModel>(
//     (ref) => PrefInfoModel(
//         prefName: "東京都",
//         prefNum: 12,
//         patientNum : 0,
//         risk: 0,
//     )
// );



// //保持するデータのモデル
// class PrefInfoModel {
//   String prefName;
//   int prefNum;
//   int patientNum;
//   double risk;
//   PrefInfoModel(
//       {required this.prefName,
//         required this.prefNum,
//         required this.patientNum,
//         required this.risk}
//         );
// }
