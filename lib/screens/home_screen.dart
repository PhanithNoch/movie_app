import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.results!.length,
          itemBuilder: (context, index) {
            /// return movie item as beautiful ui
            return Column(
              children: [
                Text(state.results![index].title!),
                Image.network(
                    "https://image.tmdb.org/t/p/w500${state.results![index].posterPath}"),
                Text(state.results![index].overview!),
              ],
            );
          },
        ),
        onError: (error) => Center(
          child: Image.asset('assets/app_state/7_Error.png'),
        ),
        onLoading: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text('Loading...'),
          ],
        )),
      ),
    );
  }
}
