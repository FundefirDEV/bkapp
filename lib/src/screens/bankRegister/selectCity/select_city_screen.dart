import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/footer_select_city_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/select_city_state_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/header_select_city_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_bank_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SelectCityScreen extends StatefulWidget {
  SelectCityScreen({Key key}) : super(key: key);

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCityScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    // ignore: close_sinks
    final bloc = BlocProvider.of<AppBloc>(context).bankRegisterBloc.selectPlace;
    final token = context.read<AppBloc>().bankRegisterBloc.token.value;
    final countryCode =
        context.read<AppBloc>().profileRegisterBloc.phoneBloc.countryCode.value;
    bloc.getLocation(token, countryCode);
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.5, 1.0, curve: Curves.easeIn)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      child: BgBankRegister(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            children: <Widget>[
              Container(child: HeaderSelectCityWidget()),
              Expanded(
                flex: 2,
                child: SelectCityStateWidget(),
              ),
              Container(child: FooterSelectCityWidget())
            ],
          ),
        ),
      ),
    );
  }
}
