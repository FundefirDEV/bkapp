import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/widgets/number_page_namebk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FooterNameBkWidget extends StatefulWidget {
  const FooterNameBkWidget({Key key}) : super(key: key);

  @override
  State<FooterNameBkWidget> createState() => _FooterNameBkWidgetState();
}

class _FooterNameBkWidgetState extends State<FooterNameBkWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // ignore: close_sinks
    BankRegisterBloc bankBloc = context.read<AppBloc>().bankRegisterBloc;
    return Container(
      key: Key('footer-name-bk-container'),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 6),
      child: Column(
        key: Key('column-footer-namebk'),
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          !bankBloc.loading.value ?
          createBankButton(context , bankBloc) :
          loading(),
          NumberPageNameBkWidget()
        ],
      ),
    );
  }

  Widget loading(){
    return Container(
      padding: EdgeInsets.only(bottom: 30.0),
      child: CircularProgressIndicator(
        color: Colors.white,
      ) ,
    );
  }

  Widget createBankButton(BuildContext context , BankRegisterBloc bankBloc){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ButtonLineRoundedWidget(
        key: Key('footer-button-next-step'),
        onPressed: () async {

          setState(() { });
          final request = await bankBloc.makeSubmit();
          if (request == 'bank created!'){

            bankBloc.clearData();

            Navigator.pushNamed(context, bankCreatedRoute,
              arguments: BankCreatedScreenArgs(bankBloc.name.value));
          } else {
            _showDialog(context , request);
          }
          
          setState(() { });
        },
        firstText: I18n.of(context).bankNameCreate,
      ),
    );
  }

  void _showDialog(context , String error) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return ImageBottomModal(
          modalHeight: 45.0,
          image: 'assets/images/sad_bot.svg',
          title: I18n.of(context).requestErrorCreatedBankInvalid,
          isBold: true,
          isBtnAccept: false,
          isImageBg: false,
          titleCloseButton: I18n.of(context).administratorAssignmentClose,
          onPressCancel: ()=> Navigator.pop(context),
          technicalData: error,
      );
    });
  }
}
