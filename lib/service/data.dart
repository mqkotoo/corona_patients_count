import 'networking.dart';

const dataUrl = "https://www3.nhk.or.jp/n-data/special/coronavirus/data/latest-pref-data-max.json";

class DataModel {

  Future<dynamic> getPrefData(int prefNum) async {
    NetworkHelper networkHelper = NetworkHelper(dataUrl);

    var prefData = await networkHelper.getData();

    //県の番号まで付与
    prefData = prefData[prefNum];
    return prefData;
  }
}