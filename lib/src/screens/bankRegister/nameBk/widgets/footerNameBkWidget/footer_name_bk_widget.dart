import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/widgets/number_page_namebk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FooterNameBkWidget extends StatelessWidget {
  const FooterNameBkWidget({Key key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: ButtonLineRoundedWidget(
              key: Key('footer-button-next-step'),
              onPressed: () async {
                var request = await bankBloc.makeSubmit();
                if (request != 'error')
                  Navigator.pushNamed(context, bankCreatedRoute,
                      arguments: BankCreatedScreenArgs(bankBloc.name.value));
              },
              firstText: I18n.of(context).bankNameCreate,
            ),
          ),
          NumberPageNameBkWidget()
        ],
      ),
    );
  }
}
