import 'package:flutter/material.dart';
import 'package:route_social_app/core/resources/assets_manager.dart';
import 'package:route_social_app/core/resources/color_manager.dart';
import 'package:route_social_app/core/resources/font_manager.dart';
import 'package:route_social_app/core/resources/styles_manager.dart';
import 'package:route_social_app/core/resources/values_manager.dart';

class ItemWidget extends StatelessWidget {
  String avatarUrl;
  String userName;
  String date;
  String contentText;
  String contentImg;
  String title;

  ItemWidget(
      {super.key,
      required this.avatarUrl,
      required this.title,
      required this.contentImg,
      required this.contentText,
      required this.date,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        elevation: 6,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          // margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20.0),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: const Color(0xFFF6F7F9)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarUrl),
                      radius: 25.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 11.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: getSemiBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s22,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if (contentText != "")
                  Text(
                    contentText,
                    style: getMediumStyle(
                      color: ColorManager.postContent,
                      fontSize: FontSize.s16,
                    ),
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                if (contentImg != "") Image.asset(contentImg),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p28),
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
                ),
                // const Divider(
                //   thickness: 1.5,
                //   color: Color(0xFF505050),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget actionButton(IconData icon, String actionTitle, Color iconColor) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Text(
          actionTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
