import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../gen/assets.gen.dart';
import '/utils/theme.dart';

class BooksSnapshotErrorWidget extends StatelessWidget {
  const BooksSnapshotErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Tell user that something went wrong

          Text(
            'Something went wrong',
            style: ShadTheme.of(context).textTheme.h2.copyWith(
                  color: primaryColor,
                ),
          ),
          const SizedBox(height: 20),

          ShadImage.square(
            Assets.icons.icSomthingWentWrong.path,
            size: 400,
          ),

          // Error Message
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              errorMessage,
              style: ShadTheme.of(context).textTheme.h3.copyWith(
                    color: primaryColor,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),

          // Retry Button
          const SizedBox(height: 20),
          // TODO: add a feedback
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   child: ShadButton(
          //     size: ShadButtonSize.lg,
          //     backgroundColor: primaryColor,
          //     onPressed: () {},
          //     child: Text(
          //       'Contact Developer',
          //       style: ShadTheme.of(context).textTheme.h4.copyWith(
          //             color: Colors.white,
          //           ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
