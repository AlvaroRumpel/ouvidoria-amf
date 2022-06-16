import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvidoria_front/coment_forms/view/coment_forms_page.dart';
import 'package:ouvidoria_front/comments_view/view/comments_view_page.dart';
import 'package:ouvidoria_front/login/view/login_page.dart';
import 'package:ouvidoria_front/response_form/view/response_form_page.dart';
import 'package:ouvidoria_front/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ouvidoria AMF',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: CustomColors.primaryColor,
        scaffoldBackgroundColor: CustomColors.whiteStandard,
      ),
      initialRoute: '/coment-form',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/coment-form',
          page: () => ComentFormsPage(),
        ),
        GetPage(
          name: '/comments-view',
          page: () => CommentsViewPage(),
        ),
        GetPage(
          name: '/response-form',
          page: () => ResponseFormPage(),
        ),
      ],
    );
  }
}
