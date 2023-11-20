import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:route_social_app/Features/home/domain/entities/post.dart';
import 'package:route_social_app/Features/home/presentation/cubit/home_cubit.dart';
import 'package:route_social_app/Features/home/presentation/widgets/shimmer_post.dart';
import 'package:route_social_app/core/resources/assets_manager.dart';
import 'package:route_social_app/core/resources/routes_manager.dart';
import 'package:route_social_app/core/services/injection/injection.dart';
import 'package:route_social_app/core/utils/details_object.dart';
import 'package:route_social_app/core/utils/functions.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/default_textfield.dart';
import '../widgets/post_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<HomeCubit>()..getUsers(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = context.read<HomeCubit>();
              if (kDebugMode) {
                print(cubit.posts?.length);
              }
              if (kDebugMode) {
                print(cubit.users?.length);
              }
              List<String> listOfnNames =
                  cubit.users?.map((e) => e.name ?? '').toList() ?? [];

              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SearchRow(),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                      child: PostsListWidget(
                          cubit: cubit, listOfnNames: listOfnNames)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class PostsListWidget extends StatefulWidget {
  const PostsListWidget({
    super.key,
    required this.cubit,
    required this.listOfnNames,
  });

  final HomeCubit cubit;
  final List<String> listOfnNames;

  @override
  State<PostsListWidget> createState() => _PostsListWidgetState();
}

class _PostsListWidgetState extends State<PostsListWidget> {
  PagingController<int, Post> pagingController = PagingController<int, Post>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    // Future.wait([
    //   widget.cubit.getPosts(
    //       page: pagingController.firstPageKey,
    //       pagingController: pagingController)
    // ]);
    pagingController.addPageRequestListener((pageKey) {
      widget.cubit.getPosts(page: pageKey, pagingController: pagingController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => pagingController.refresh(),
      ),
      child: PagedListView.separated(
        // 4
// physics: const BouncingScrollPhysics(),
        pagingController: pagingController,
        // padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        builderDelegate: PagedChildBuilderDelegate<Post>(
          animateTransitions: true,
          newPageErrorIndicatorBuilder: (context) => buildLoading(),
          transitionDuration: const Duration(milliseconds: 600),
          newPageProgressIndicatorBuilder: (context) => buildLoading(),
          firstPageProgressIndicatorBuilder: (context) =>
              buildShimmerList(context),
          itemBuilder: (context, post, index) {
            int picturesIndex = index % getUsersPictures().length;
            int nameIndex = 0;
            if (widget.listOfnNames.isNotEmpty) {
              nameIndex = index % widget.listOfnNames.length;
            }
            // var user = getUserPost(0);
            return InkWell(
              splashColor: Colors.white,
              onTap: () {
                goToDetails(context, post, nameIndex, picturesIndex);
              },
              child: ItemWidget(
                  index: index,
                  avatarUrl: getUsersPictures()[picturesIndex],
                  contentImg: '',
                  title: '${post.title}',
                  contentText: '${post.body}',
                  date: '2 hours ago',
                  userName: widget.listOfnNames.isNotEmpty
                      ? widget.listOfnNames[nameIndex]
                      : ''),
            );
          },
          firstPageErrorIndicatorBuilder: (context) => buildEmptyState(),
          noItemsFoundIndicatorBuilder: (context) => buildEmptyState(),
        ),
      ),
    );
    Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.cubit.posts?.length ?? 10,
        itemBuilder: (context, index) {
          int picturesIndex = index % getUsersPictures().length;
          int nameIndex = 0;
          if (widget.listOfnNames.isNotEmpty) {
            nameIndex = index % widget.listOfnNames.length;
          }
          // var user = getUserPost(0);
          return widget.cubit.posts == null
              ? const ShimmerPost()
              : InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.detailsRoute,
                        arguments: DetailsObject(
                            homeCubit: widget.cubit,
                            postId: widget.cubit.posts?[index].id?.toInt() ?? 0,
                            name: widget.listOfnNames[nameIndex],
                            avatarUrl: getUsersPictures()[picturesIndex],
                            title: widget.cubit.posts?[index].title ?? '',
                            content: widget.cubit.posts?[index].body ?? ''));
                  },
                  child: ItemWidget(
                    avatarUrl: getUsersPictures()[picturesIndex],
                    contentImg: '',
                    title: '${widget.cubit.posts?[index].title}',
                    contentText: '${widget.cubit.posts?[index].body}',
                    date: '2 hours ago',
                    userName: widget.listOfnNames[nameIndex] ?? '',
                    index: 2,
                  ),
                );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }

  SizedBox buildLoading() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Lottie.asset(JsonAssets.loading),
    );
  }

  Column buildEmptyState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/json/embty.json', width: 170, fit: BoxFit.contain),
        SizedBox(
          height: 10.h,
        ),
        Center(
            child: Text(
          'There is no comments here !!',
          style: getSemiBoldStyle(color: Colors.black87),
        ))
      ],
    );
  }

  void goToDetails(
      BuildContext context, Post post, int nameIndex, int picturesIndex) {
    Navigator.of(context).pushNamed(Routes.detailsRoute,
        arguments: DetailsObject(
            homeCubit: widget.cubit,
            postId: post.id?.toInt() ?? 0,
            name: widget.listOfnNames[nameIndex],
            avatarUrl: getUsersPictures()[picturesIndex],
            title: post.title ?? '',
            content: post.body ?? ''));
  }

  Column buildShimmerList(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: cubit.userProfile?.data == null ?  150.h :null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                height: 250,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: cubit.userProfile?.data == null ?  150.h :null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                height: 250,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: cubit.userProfile?.data == null ?  150.h :null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                height: 250,
              )),
        ),
      ],
    );
  }
}

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
              child: DefaultTextField(
            isHidden: false,
            hintText: 'Search for a post',
          )),
          const SizedBox(
            width: 20,
          ),
          Material(
            elevation: 6,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: CircleAvatar(
                backgroundColor: const Color(0xFFF6F7F9),
                radius: 20,
                // decoration: BoxDecoration(
                //   color:  Colors.teal,
                //   shape: BoxShape.circle,
                //
                // ),
                child: Image.asset(
                  ImageAssets.send,
                  fit: BoxFit.fill,
                  height: 20,
                )),
          )
        ],
      ),
    );
  }
}
