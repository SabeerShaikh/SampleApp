import 'package:flutter/material.dart';
import 'package:sample_app/core/const/string_constant.dart';
import 'package:sample_app/features/main_album/presentation/bloc/main_album_bloc.dart';
import 'package:sample_app/features/main_album/presentation/widgets/main_album_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/injection_container.dart';

class MainAlbumPage extends StatefulWidget {
  const MainAlbumPage({Key? key}) : super(key: key);

  @override
  State<MainAlbumPage> createState() => _MainAlbumPageState();
}

class _MainAlbumPageState extends State<MainAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<MainAlbumBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainAlbumBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(STRING_APP_NAME),
        ),
        body: const SafeArea(
          child: MainAlbumWidget(),
        ),
      ),
    );
  }
}
