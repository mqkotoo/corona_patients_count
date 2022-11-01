import 'networking.dart';

const dataUrl = "https://www3.nhk.or.jp/n-data/special/coronavirus/data/latest-pref-data-max.json";

class DataModel {

  Future<dynamic> getCityData(int cityNum) async {
    NetworkHelper networkHelper = NetworkHelper(dataUrl);

    var weatherData = await networkHelper.getData();
    //県の番号まで付与
    weatherData = weatherData[cityNum];
    return weatherData;
  }
}