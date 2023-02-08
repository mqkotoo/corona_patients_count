import 'networking.dart';

const dataUrl = "https://www3.nhk.or.jp/n-data/special/coronavirus/data/latest-pref-data-max.json";

class DataModel {

  Future<dynamic> getPrefData(int prefNum) async {
    NetworkHelper networkHelper = NetworkHelper(dataUrl);

    var prefData = await networkHelper.getData();

    //県の番号を付与すると以下のような結果を返す
    //{name: 栃木県,new: 590, cumulative: 254536, newdead: 1, cumulativedead: 545, ismax: false, maxdate: 2022/8/4, maxvalue: 3371}
    prefData = prefData[prefNum];
    return prefData;
  }
}