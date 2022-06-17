import 'package:get/get.dart';
import 'package:ouvidoria_front/models/comment_model.dart';

class ResponseFormController extends GetxController {
  CommentModel data = Get.arguments ??
      CommentModel(subject: 'aaaa', department: 'aaaa', message: 'aaa');
}
