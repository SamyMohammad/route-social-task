import 'package:flutter/material.dart';

import '../../../../core/utils/functions.dart';
import '../../../home/domain/entities/comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem(
      {super.key, required this.comment, required this.picturesIndex});

  final Comment? comment;
  final int picturesIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        // height: 80,

        // margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0xFFF6F7F9)),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(getUsersPictures()[picturesIndex]),
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
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      comment?.name ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      comment?.body ?? '',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Row(
                      children: [
                        Text(
                          '2 minutes ago',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '15',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
