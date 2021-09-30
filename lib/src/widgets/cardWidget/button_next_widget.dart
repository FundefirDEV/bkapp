import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:flutter_form_bloc/flutter_form_bloc.dart';
class ButtonNextWidget extends StatelessWidget {
  final Function onTap;

  const ButtonNextWidget({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final profileRegisterBloc = context.watch<AppBloc>().profileRegisterBloc;

    return Hero(
      tag: 'bg-next-register',
      child: !profileRegisterBloc.loading.value ?  
       Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryColor[50],
              Theme.of(context).colorScheme.primaryColor[100]
            ], stops: [
              0,
              1
            ], begin: Alignment(-1.00, 0.00), end: Alignment(1.00, -0.00))),
        child: Material(
          child: InkWell(
            key: Key('buttonNextStep'),
            borderRadius: BorderRadius.circular(100),
            onTap: this.onTap,
            child: 
              Container(
                width: 85.0,
                height: 85.0,
                child: SvgPicture.asset(
                  'assets/images/path.svg',
                  fit: BoxFit.scaleDown,
              )
            )
          ),
          color: Colors.transparent,
        ),
      ): Container(
        width: 60.0,
        height: 60.0,

        child: CircularProgressIndicator()
      ),
    );
  }
}
