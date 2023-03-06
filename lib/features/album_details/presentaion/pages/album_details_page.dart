import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/core/const/string_constant.dart';
import 'package:sample_app/features/album_details/presentaion/bloc/album_details_bloc.dart';
import 'package:sample_app/features/album_details/presentaion/widgets/album_details_widget.dart';
import 'package:sample_app/injection_container.dart';

class AlbumDetailsPage extends StatefulWidget {
  final int albumId;
  const AlbumDetailsPage({Key? key, required this.albumId}) : super(key: key);

  @override
  State<AlbumDetailsPage> createState() => _MainAlbumPageState();
}

class _MainAlbumPageState extends State<AlbumDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<AlbumDetailsBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AlbumDetailsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(STRING_ALBUM_DETAILS),
        ),
        body: SafeArea(
          child: AlbumDetailsWidget(albumId: widget.albumId),
        ),
      ),
    );
  }
}
