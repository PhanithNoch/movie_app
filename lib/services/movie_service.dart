import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_res_model.dart';

import '../constant/constant.dart';

class MovieService {
  Future<Either<String, MovieResModel>> fetchMovie() async {
    var url = Uri.parse("${kBASE_URL}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Right(MovieResModel.fromJson(data));
    } else {
      return Left("Error");
    }
  }
}
