import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/router/base_router.dart';

class BookpediaApp extends StatelessWidget {
  const BookpediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: getPages,
        title: 'Bookpedia',
        initialRoute: BaseRouter.splashScreen,
      ),
    );
  }
}
