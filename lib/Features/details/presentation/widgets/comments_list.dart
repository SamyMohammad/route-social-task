import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:route_social_app/core/resources/styles_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/functions.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import 'comment_item.dart';

class CommentList extends StatefulWidget {
  const CommentList({super.key, required this.postId, required this.cubit});

  final HomeCubit cubit;
  final int postId;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    // widget.cubit.getComments(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is CommentsFailure) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Lottie.asset('assets/json/embty.json',
                    width: 170, fit: BoxFit.contain),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: Text(
                  'There is no comments here !!',
                  style: getSemiBoldStyle(color: Colors.black87),
                ))
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                int picturesIndex = index % getUsersPictures().length;
                if (widget.cubit.comments == null) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[500]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  );
                }
                if (state is CommentsSuccess) {
                  if (kDebugMode) {
                    print('comments:- ${widget.cubit.comments}');
                  }

                  return CommentItem(
                    picturesIndex: picturesIndex,
                    comment: widget.cubit.comments![index],
                  );
                }
                return Shimmer.fromColors(
                  baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: widget.cubit.comments?.length ?? 5);
        }
      },
    );
  }
}
