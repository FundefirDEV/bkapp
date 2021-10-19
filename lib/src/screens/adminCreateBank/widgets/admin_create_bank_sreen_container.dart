import 'package:bkapp_flutter/core/bloc/adminCreateBank/admin_create_bank_form_bloc.dart';
import 'package:bkapp_flutter/core/models/dropdown_model.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AdminCreateBankScreenContainer extends StatelessWidget {
  AdminCreateBankScreenContainer({@required this.isAdmin});

  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    AdminCreateBankFormBloc adminCreateBankFormBloc =
        context.read<AdminCreateBankFormBloc>();
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
        child: Column(children: [
          TitleCard(),
          SelectItemContainer(
            selectFieldBloc: adminCreateBankFormBloc.countryList,
            title: 'Select country',
            borderRadius: null,
          ),
          SelectItemContainer(
            selectFieldBloc: adminCreateBankFormBloc.departamentList,
            title: 'Select departament',
            borderRadius: null,
          ),
          SelectItemContainer(
            selectFieldBloc: adminCreateBankFormBloc.cityList,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            title: 'Select city',
          ),
          addPartnerButton(context)
        ]));
  }

  GestureDetector addPartnerButton(BuildContext context) {
    return GestureDetector(
      onTap: () => print('manaos'),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                child: Text(
                  'Add partner',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Container(
              child: Icon(
                Icons.add_circle,
                color: Theme.of(context).colorScheme.primaryColor[100],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectItemContainer extends StatelessWidget {
  const SelectItemContainer(
      {Key key,
      @required this.selectFieldBloc,
      @required this.title,
      @required this.borderRadius})
      : super(key: key);

  final SelectFieldBloc selectFieldBloc;
  final String title;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 45.0, right: 25.0),
      decoration:
          BoxDecoration(borderRadius: borderRadius, color: Colors.white),
      child: DropdownFieldBlocBuilder<DropDownModel>(
          key: Key('list-state-kgh'),
          showEmptyItem: false,
          selectFieldBloc: selectFieldBloc,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: title,
              suffixIcon: Icon(Icons.keyboard_arrow_down,
                  size: 32.0,
                  color: Theme.of(context).colorScheme.primaryColor[100])),
          itemBuilder: (context, value) => value.text),
    );
  }
}

class TitleCard extends StatelessWidget {
  const TitleCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Theme.of(context).colorScheme.primaryColor[100]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Create a new Bank !',
            style: TextStyle(
                fontFamily: 'nunito',
                color: Colors.white,
                fontSize: SizeConfig.blockSizeHorizontal * 6,
                fontWeight: FontWeight.w100,
                letterSpacing: 2),
          ),
        ]));
  }
}
