import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '/utils/theme.dart';
import '../../../../../gen/assets.gen.dart';

class NoBooksFoundErrorWidget extends StatelessWidget {
  const NoBooksFoundErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShadImage.square(
            Assets.icons.student.noBookFound.path,
            size: 400,
          ),

          // Error Message
          SizedBox(
            child: Text(
              'No books found in the library',
              style: ShadTheme.of(context).textTheme.h3.copyWith(
                    color: primaryColor,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
