import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TitleModalsMeeting extends StatelessWidget {
  const TitleModalsMeeting({Key key, this.image, this.title}) : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(
            'assets/images/$image.svg',
            fit: BoxFit.contain,
            color: Theme.of(context).colorScheme.primaryColor[100],
          ),
        ),
        Text(title)
      ],
    );
  }
}
