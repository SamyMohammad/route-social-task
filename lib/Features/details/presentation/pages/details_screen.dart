import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_social_app/Features/home/presentation/cubit/home_cubit.dart';
import 'package:route_social_app/core/utils/details_object.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/comments_list.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DetailsObject detailsObject =
        ModalRoute.of(context)?.settings.arguments as DetailsObject;
    return BlocProvider<HomeCubit>.value(
      value: detailsObject.homeCubit..getComments(detailsObject.postId),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildDetailsAppBar(),
          body: buildContentBody(detailsObject),
        ),
      ),
    );
  }

  Padding buildContentBody(DetailsObject detailsObject) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                buildAvatarPic(detailsObject),
                const SizedBox(
                  width: 10.0,
                ),
                buildNameAndTime(detailsObject),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              detailsObject.title,
              style: getSemiBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s22,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),

            Text(
              detailsObject.content,
              style: getMediumStyle(
                color: ColorManager.postContent,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildLikesSharesCommentsRow(),
            // const Divider(
            //   thickness: 1.5,
            //   color: Color(0xFF505050),
            // ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: CommentList(
            postId: detailsObject.postId,
            cubit: detailsObject.homeCubit,
          ),
        ),
      ]),
    );
  }

  Padding buildLikesSharesCommentsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
      child: Row(
        children: [
          Text('220',
              style: getMediumStyle(
                color: ColorManager.postContent,
                fontSize: FontSize.s16,
              )),
          const SizedBox(
            width: AppSize.s4,
          ),
          Image.asset('assets/icons/eye.png'),
          const Spacer(),
          Text('220',
              style: getMediumStyle(
                color: ColorManager.postContent,
                fontSize: FontSize.s16,
              )),
          const SizedBox(
            width: AppSize.s4,
          ),
          Image.asset(ImageAssets.chat),
          const Spacer(),
          Text('220',
              style: getMediumStyle(
                color: ColorManager.postContent,
                fontSize: FontSize.s16,
              )),
          const SizedBox(
            width: AppSize.s4,
          ),
          Image.asset(ImageAssets.heart),
          // actionButton(Icons.comment, "Reply", const Color(0xFF505050)),
          // actionButton(Icons.share, "Share", const Color(0xFF505050)),
        ],
      ),
    );
  }

  Expanded buildNameAndTime(DetailsObject detailsObject) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailsObject.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            '2 hours ago',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 11.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Hero buildAvatarPic(DetailsObject detailsObject) {
    return Hero(
      tag: detailsObject.name,
      child: CircleAvatar(
        backgroundImage: AssetImage(detailsObject.avatarUrl),
        radius: 25.0,
      ),
    );
  }

  AppBar buildDetailsAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        Image.asset(ImageAssets.heart2, height: 25, width: 25),
        const SizedBox(
          width: 15,
        ),
        Image.asset(ImageAssets.circlePlus, height: 25, width: 25),
        const SizedBox(
          width: 15,
        ),
        Image.asset(ImageAssets.share, height: 25, width: 25),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
