import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class RandomRecipe {
  final String url = 'https://www.themealdb.com/api/json/v1/1/random.php';

  Future<dynamic> getRandomRecipe() async {
    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> randomRecipe = new HashMap();

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data = data['meals'][0];

      if (data != null) {
        randomRecipe.addAll(data);
      } else {
        return response.statusCode;
      }
    }
    return randomRecipe;
  }
}
