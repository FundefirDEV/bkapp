import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class GenderImage extends StatelessWidget {
  final Widget image;
  final Function onTap;
  final String genderTitle;
  final String tag;
  final double width;

  const GenderImage({
    Key key,
    @required this.image,
    this.onTap,
    this.genderTitle,
    this.width,
    this.tag
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        width: this.width,
        child: InkWell(
          onTap: this.onTap,
          child: Column(
            children: <Widget>[
              Hero(
                tag: this.tag,
                child: this.image
              ),
              SizedBox(),
              if (this.genderTitle != null) ...[
                Text(
                  this.genderTitle,
                  style: TextStyle(letterSpacing: 3.51),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
