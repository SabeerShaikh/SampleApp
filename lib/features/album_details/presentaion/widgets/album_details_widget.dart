import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/core/const/string_constant.dart';
import 'package:sample_app/features/album_details/data/models/album_details_model.dart';
import 'package:sample_app/features/album_details/presentaion/bloc/album_details_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumDetailsWidget extends StatefulWidget {
  final int albumId;
  const AlbumDetailsWidget({Key? key, required this.albumId}) : super(key: key);

  @override
  State<AlbumDetailsWidget> createState() => _AlbumDetailsWidgetState();
}

class _AlbumDetailsWidgetState extends State<AlbumDetailsWidget> {
  var _albumDetailsEntity;
  List<AlbumDetailsModel> albumDetailsModelList = const [];
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocBuilder<AlbumDetailsBloc, AlbumDetailsState> buildBody(
      BuildContext context) {
    return BlocBuilder<AlbumDetailsBloc, AlbumDetailsState>(
      builder: (context, state) {
        if (state is MainAlbumInitial) {
          BlocProvider.of<AlbumDetailsBloc>(context)
              .add(AlbumDetailsEventUpdateEvent(widget.albumId));
        }
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is AlbumDetailsLoadedState) {
          _albumDetailsEntity = state.albumDetailsEntity;
          if (_albumDetailsEntity != null) {
            albumDetailsModelList = _albumDetailsEntity;
            AlbumDetailsModel albumDetailsModel = albumDetailsModelList.first;

            return showDefaultView();
          } else {
            return const Center(
              child: Text(
                STRING_NO_DATA_AVAILABLE,
                textAlign: TextAlign.center,
              ),
            );
          }
        }

        if (state is ErrorState) {
          return const Center(
            child: Text(
              STRING_ERROR,
              textAlign: TextAlign.center,
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget showDefaultView() {
    return albumDetailsModelList.length > 0
        ? Container(
            margin: EdgeInsets.all(24.h),
            child: GridView.builder(
              itemCount: albumDetailsModelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.h,
                mainAxisSpacing: 4.h,
              ),
              itemBuilder: (BuildContext context, int index) {
                AlbumDetailsModel albumDetailsModel =
                    albumDetailsModelList[index];

                return Column(
                  children: [
                    Flexible(
                        flex: 1, child: Image.network(albumDetailsModel.thumbnailUrl!)),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 8.w,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        albumDetailsModel.title!.toString().trim(),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        : Container();
  }
}
