import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('Container_update_button_profile_edit_screen'),
      height: SizeConfig.blockSizeVertical * 5,
      width: SizeConfig.blockSizeHorizontal * 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).colorScheme.primaryColor),
      child: FlatButton(
        key: Key('flatButton_profile_edit_screen'),
        onPressed: context.bloc<AppBloc>().profileEditFormBloc.submit,
        child: Text(
          I18n.of(context).profileEditScreenUpdate,
          style: TextStyle(color: Colors.white, letterSpacing: 4),
        ),
      ),
    );
  }
}
