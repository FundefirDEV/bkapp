import 'dart:convert';

import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/widgets/button_image_botton_modal_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/widgets/title_image_bottom_modal_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageBottomModal extends StatelessWidget {
  const ImageBottomModal(
      {Key key,
      this.modalHeight,
      this.title,
      this.titleBold,
      this.isBold,
      this.isBtnAccept,
      this.titleAcceptButton,
      this.titleCloseButton,
      @required this.image,
      this.isImageBg: false,
      this.onPressAccept,
      this.onPressCancel,
      this.technicalData})
      : super(key: key);

  final double modalHeight;
  final String title;
  final String titleBold;
  final bool isBold;
  final bool isBtnAccept;
  final bool isImageBg;
  final String titleAcceptButton;
  final String titleCloseButton;
  final String image;
  final Function onPressAccept;
  final Function onPressCancel;
  final String technicalData;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BottomModal(
        key: Key('image_bottom_modal'),
        height: SizeConfig.blockSizeVertical * modalHeight,
        child: Container(
          key: Key('container_image_bottom_modal'),
          color: Colors.transparent,
          child: Stack(
            key: Key('stack_image_bottom_modal'),
            children: <Widget>[
              if (isImageBg) SvgPicture.asset('assets/images/confetti_2.svg'),
              Column(
                key: Key('column_image_bottom_modal'),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TitleImageBottomModalWidget(
                    title: title,
                    titleBold: titleBold,
                    isBold: isBold,
                  ),
                  SvgPicture.asset(image),
                  ButtonImageBottonModalWidget(
                      isBtnAcept: isBtnAccept,
                      titleAcceptButton: titleAcceptButton,
                      titleCloseButton: titleCloseButton,
                      onPressAccept: onPressAccept,
                      onPressCancel: onPressCancel),
                  Center(
                      child: Text(
                    buildTechnicalData(),
                    style: TextStyle(fontSize: 10),
                  ))
                ],
              )
            ],
          ),
        ));
  }

  String buildTechnicalData() {
    var error = '';
    try {
      error = jsonDecode(technicalData)['error'];
    } catch (e) {
      error = technicalData == null ? '' : technicalData;
    }
    return error;
  }
}
