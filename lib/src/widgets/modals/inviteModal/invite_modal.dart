import 'dart:ui';
import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal_content.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'contacts/contact_list.dart';
import 'widgets/partner_form.dart';

//NOTE HOW TO CALL IT:
// showDialog(context: context, builder: (BuildContext context) => InviteModal()),
class InviteModal extends StatefulWidget {
  InviteModal({Key key, 
    this.partners, 
    this.isRegister, 
    @required this.tokenUser , 
    @required this.partnerList,
    @required this.menuNavigatorBloc,
    @required this.addPartner
    }) : super(key: key);

  final MenuNavigatorBloc menuNavigatorBloc;
  final int partners;
  final bool isRegister; 
  final String tokenUser;
  final List<PartnerModel> partnerList;
  final addPartner;


  @override
  _InviteModalState createState() => _InviteModalState();
}

class _InviteModalState extends State<InviteModal> {
  final content = InviteModalContent();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    BankRegisterBloc bankBloc = context.read<AppBloc>().bankRegisterBloc;
    SizeConfig().init(context);

    return _popDialog(context, bankBloc);
  }

  BackdropFilter _popDialog(BuildContext context, BankRegisterBloc bankBloc) {
    return BackdropFilter(
      key: Key('filter_invite_modal'),
      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
      child: BlocProvider(
        create: (context) =>
            InviteFormBloc(partnerRepository: partnerRepository),
        child: Builder(
          builder: (context) {
            return Dialog(
              key: Key('dialog_invite_modal'),
              elevation: 100,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  key: Key('column_invite_modal'),
                  children: <Widget>[
                    content.contactButton(
                        context: context,
                        onPressed: () async {
                          List<Map> result = await _showDialog(context);
                          if (result != null) Navigator.pop(context);
                        }
                      ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      )),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          content.titleContainer(context),
                          PartnerForm(
                            inviteBloc:
                                BlocProvider.of<InviteFormBloc>(context),
                                token: widget.tokenUser,
                                addPartner: widget.addPartner,
                          )
                        ],
                      ),
                    ),
                    content.closeContainer(context),
                    SizedBox(height: SizeConfig.blockSizeVertical * 5),
                    content.partnersText(context, widget.partners)
                  ],
                ),
              ),
            );
          },
        )
      )
    );
  }



  Future _showDialog(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return 
          BottomModal(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 90,
            child: ContactList(
              isRegister: widget.isRegister,
              tokenUser: widget.tokenUser,
              partnerList: widget.partnerList,
              menuNavigatorBloc: widget.menuNavigatorBloc,
              addPartner: widget.addPartner,
          )
        );
      }
    );
  }
}
