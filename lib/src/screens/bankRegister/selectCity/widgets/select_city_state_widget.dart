import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SelectCityStateWidget extends StatelessWidget {
  const SelectCityStateWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    BankRegisterBloc bankBloc = context.bloc<AppBloc>().bankRegisterBloc;
    SizeConfig().init(context);

    return Material(
      key: Key('material-content-city-state'),
      color: Colors.transparent,
      child: Container(
        key: Key('container-content-city-state'),
        width: SizeConfig.blockSizeHorizontal * 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              key: Key('theme-dropdown-state'),
              data: Theme.of(context).copyWith(
                textTheme: Theme.of(context).textTheme.copyWith(
                      // FIXME this subhead has to be replaced
                      subhead: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 6,
                          fontWeight: FontWeight.w100),
                    ),
              ),
              child: DropdownFieldBlocBuilder<String>(
                key: Key('list-state'),
                showEmptyItem: false,
                selectFieldBloc: bankBloc.selectPlace.selectState,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon:
                        Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    helperText: I18n.of(context).selectCityState,
                    helperStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 5.5,
                        height: 0.1,
                        fontWeight: FontWeight.w700)),
                itemBuilder: (context, value) => value,
              ),
            ),
            Align(
              key: Key('align-container-division-dropdowns'),
              alignment: Alignment.centerLeft,
              child: Container(
                key: Key('container-division-dropdowns'),
                height: SizeConfig.safeBlockHorizontal * 1.5,
                width: SizeConfig.safeBlockHorizontal * 20,
                margin: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 4,
                    bottom: SizeConfig.safeBlockVertical * 2,
                    left: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12),
              ),
            ),
            Theme(
              key: Key('theme-dropdown-city'),
              data: Theme.of(context).copyWith(
                textTheme: Theme.of(context).textTheme.copyWith(
                      subhead: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 6,
                          fontWeight: FontWeight.w100),
                    ),
              ),
              child: DropdownFieldBlocBuilder<String>(
                key: Key('list-city'),
                showEmptyItem: false,
                selectFieldBloc: bankBloc.selectPlace.selectCity,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon:
                        Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    helperText: I18n.of(context).selectCityCity,
                    helperStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 5.5,
                        height: 0.1,
                        fontWeight: FontWeight.w700)),
                itemBuilder: (context, value) => value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
