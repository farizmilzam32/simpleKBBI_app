import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kbbi_app/models/kamusmodels.dart';

class API {
  Future<KamusModels> getKamus(String kata) async {
    var client = http.Client();
    var kamusModels;

    try {
      var response = await client
          .get(Uri.parse('https://kbbi-api-amm.herokuapp.com/search?q=$kata'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        kamusModels = KamusModels.fromJson(jsonMap);
        
      }
    } catch (Exception) {
      return kamusModels;
    }

    return kamusModels;
  }
}
