import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPost extends StatelessWidget {
  const ShimmerPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        elevation: 6,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: MediaQuery.of(context).size.height * .4,
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
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: const CircleAvatar(
                        radius: 25.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const SizedBox(
                              height: 5.0,
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
                const SizedBox(
                  height: 10.0,
                ),

                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 10.0,
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
    Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFF262626),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 25.0,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),

            Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              child: const SizedBox(
                height: 30.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              thickness: 1.5,
              color: Color(0xFF505050),
            ),
            // Row(
            //   children: [
            //     actionButton(Icons.thumb_up, "Like", const Color(0xFF505050)),
            //     actionButton(Icons.comment, "Reply", const Color(0xFF505050)),
            //     actionButton(Icons.share, "Share", const Color(0xFF505050)),
            //   ],
            // )
          ],
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
