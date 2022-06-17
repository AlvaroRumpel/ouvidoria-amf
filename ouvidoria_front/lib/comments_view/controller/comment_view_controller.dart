import 'package:get/get.dart';
import 'package:ouvidoria_front/models/comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentViewController extends GetxController
    with StateMixin<List<CommentModel>> {
  List<CommentModel> comments = [];

  @override
  void onInit() async {
    super.onInit();
    change(comments, status: RxStatus.loading());
    await getData();
  }

  Future<void> getData() async {
    var localStorage = await SharedPreferences.getInstance();

    try {
      var list = await localStorage.getStringList('comments') ?? [];
      if (list.isEmpty) {
        return;
      }
      for (var item in list) {
        comments.add(CommentModel.fromJson(item));
      }
      change(comments, status: RxStatus.success());
    } catch (e) {
      print(e);
    }
  }
}
