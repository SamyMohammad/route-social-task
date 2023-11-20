import 'package:route_social_app/Features/home/presentation/cubit/home_cubit.dart';

class DetailsObject {
  String name;
  HomeCubit homeCubit;
  String avatarUrl;
  String title;
  String content;
  int postId;

  DetailsObject(
      {required this.name,
      required this.homeCubit,
      required this.avatarUrl,
      required this.title,
      required this.content,
      required this.postId});
}
