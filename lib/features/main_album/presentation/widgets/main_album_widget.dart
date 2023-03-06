import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/core/const/string_constant.dart';
import 'package:sample_app/features/album_details/presentaion/pages/album_details_page.dart';
import 'package:sample_app/features/main_album/data/models/main_album_model.dart';
import 'package:sample_app/features/main_album/presentation/bloc/main_album_bloc.dart';

class MainAlbumWidget extends StatefulWidget {
  const MainAlbumWidget({Key? key}) : super(key: key);

  @override
  State<MainAlbumWidget> createState() => _MainAlbumWidgetState();
}

class _MainAlbumWidgetState extends State<MainAlbumWidget> {
  String strStatus = '';
  var _mainAlbumModelEntity;
  List<MainAlbumModel> mainAlbumModel = const [];

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocBuilder<MainAlbumBloc, MainAlbumState> buildBody(BuildContext context) {
    return BlocBuilder<MainAlbumBloc, MainAlbumState>(
      builder: (context, state) {
        if (state is MainAlbumInitial) {
          strStatus = '';
          BlocProvider.of<MainAlbumBloc>(context).add(MainAlbumUpdateEvent());
        }
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchAlbumState) {
          mainAlbumModel.clear();
          _mainAlbumModelEntity = [];
          _mainAlbumModelEntity = state.mainAlbumModelEntity;
          if (_mainAlbumModelEntity != null) {
            mainAlbumModel = _mainAlbumModelEntity;
            return showDefaultView();
          }
        }
        if (state is MainAlbumLoadedState) {
          _mainAlbumModelEntity = state.mainAlbumModelEntity;
          if (_mainAlbumModelEntity != null) {
            mainAlbumModel = _mainAlbumModelEntity;
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
          strStatus = state.message;
          return const Center(
            child: Text(
              STRING_ERROR,
              textAlign: TextAlign.center,
            ),
          );
        }

        return showDefaultView();
      },
    );
  }

  Widget showDefaultView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0.h),
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h),
            child: TextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  BlocProvider.of<MainAlbumBloc>(context)
                      .add(MainAlbumUpdateEvent());
                } else {
                  BlocProvider.of<MainAlbumBloc>(context)
                      .add(SearchAlbumEvent(title: value));
                }
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0.h)))),
            ),
          ),
          mainAlbumModel.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mainAlbumModel.length,
                    itemBuilder: (context, index) {
                      MainAlbumModel albumModel = mainAlbumModel[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AlbumDetailsPage(
                                      albumId: albumModel.id!,
                                    )),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Text(
                              albumModel.title!,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
