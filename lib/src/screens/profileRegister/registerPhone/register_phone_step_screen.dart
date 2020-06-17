import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/country_modal_content_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/register_phone_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/items_country.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';

class RegisterPhoneStepScreen extends StatefulWidget {
  final RegisterPhoneStepArgs data;
  RegisterPhoneStepScreen({Key key, this.data}) : super(key: key);

  @override
  _RegisterPhoneStepScreenState createState() =>
      _RegisterPhoneStepScreenState();
}

class _RegisterPhoneStepScreenState extends State<RegisterPhoneStepScreen> with AfterLayoutMixin<RegisterPhoneStepScreen>{
  ItemCountry country = ItemCountry(image: '', phoneCode: '+57', name: 'Colombia');
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(child: SafeArea(child: _containerInfo()));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _showDialog(context);
  }

  Widget _containerInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ButtonBackWidget(),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
              child: RegisterPhoneContainerWidget(
                tag: widget.data.tag, image: widget.data.image,
                country: country
              ),
            ),
        ),
        Expanded(
          child: FooterStepWidget(
            currentStep: 3,
            numberOfSteps: 4,
            route: registerPasswordUser,
            currentBlocSubmit: 
              context.bloc<AppBloc>().profileRegisterBloc.phoneBloc.submit,
            renderNextWidget:
              RegisterPasswordStepArgs(widget.data.tag, widget.data.image),
          )
        )
      ]
    );
  }

  _receiveCountry(ItemCountry data) {
    setState(() {
      country = data;
    });
    print(data.name);
  }

  _showDialog(context) {
    SizeConfig().init(context);
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
      return BottomModal(
        width: SizeConfig.blockSizeHorizontal * 100,
        height:SizeConfig.blockSizeVertical * 30,
        child: CountryModalContentWidget(callback:_receiveCountry)
      );
    });
  }
}

class RegisterPhoneStepArgs {
  final String tag;
  final String image;

  RegisterPhoneStepArgs(this.tag, this.image);
}
