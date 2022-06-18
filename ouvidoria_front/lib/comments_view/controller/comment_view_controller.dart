import 'dart:convert';

import 'package:get/get.dart';
import 'package:ouvidoria_front/models/comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
    try {
      var url = Uri.parse('http://127.0.0.1:8000/get-all-comments');
      var list = await http.get(url, headers: {
        "Access-Control-Allow-Origin": "*",
      });
      var temp = jsonDecode(list.body);
      for (var item in temp) {
        comments.add(CommentModel(
          id: item[0],
          subject: item[1],
          message: item[2],
          email: item[3],
          response: item[4],
          department: item[5],
          isAnonymous: item[6] == 'False' ? false : true,
        ));
      }
      change(comments, status: RxStatus.success());
    } catch (e) {
      print(e);
    }
  }
}
