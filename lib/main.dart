import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/core/const/string_constant.dart';
import 'package:sample_app/features/main_album/presentation/pages/main_album.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: STRING_APP_NAME,
      home: MainAlbumPage(),
    );
  }
}
