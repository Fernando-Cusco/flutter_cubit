import 'dart:convert';

import 'package:appcubit/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String base = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    const apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(base + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
