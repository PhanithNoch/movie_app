import 'package:get/get.dart';
import 'package:movie_app/models/movie_res_model.dart';
import 'package:movie_app/services/movie_service.dart';

class HomeController extends GetxController with StateMixin<MovieResModel> {
  final service = MovieService();

  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  void getMovies() async {
    change(null, status: RxStatus.loading());
    final res = await service.fetchMovie();
    res.fold((l) => change(null, status: RxStatus.error(l)),
        (r) => change(r, status: RxStatus.success()));
  }
}
