import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/routes/routes.dart';
import 'package:dalel/core/services/servece_locator.dart';
import 'package:dalel/core/utils/app_color.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();

  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColor.offWhite),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
