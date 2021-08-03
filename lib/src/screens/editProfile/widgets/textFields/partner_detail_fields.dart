import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PartnerDetailFields extends StatelessWidget {
  const PartnerDetailFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileEditFormBloc = context.read<AppBloc>().profileEditFormBloc;

    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
              width: SizeConfig.blockSizeHorizontal * 80,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]),
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    profileEditFormBloc.documentNumber,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  labelText: "Document",
                  labelStyle:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              )),
          Container(
              width: SizeConfig.blockSizeHorizontal * 80,
              margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]),
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    profileEditFormBloc.profession,
                keyboardType: TextInputType.text,
               
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    labelText: "profession",
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              )
            ),
          Container(
              width: SizeConfig.blockSizeHorizontal * 80,
              margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]),
            child: DropdownFieldBlocBuilder<String>(
              showEmptyItem: false,
              selectFieldBloc: profileEditFormBloc.scholarship,
              decoration: 
                InputDecoration(
                labelText: "scholarship" ,//I18n.of(context).creditScreenUseOfCredit,
                suffixIcon: Icon(Icons.keyboard_arrow_down),
                  labelStyle:
                    TextStyle(fontSize: 12, 
                    fontWeight: FontWeight.w700)
                ),
                itemBuilder: (context, value) => value,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 80,
            margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 3,
                  spreadRadius: 3,
                )
              ]),
              child: StreamBuilder(
                stream: profileEditFormBloc.birthDateStream,
                builder: (BuildContext context , AsyncSnapshot birthDateSnapshot) {

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(profileEditFormBloc.birthDateFormat()),
                      ElevatedButton(
                        child: Text('select date'),
                          onPressed: (){
                            showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(), 
                              firstDate: DateTime(1900), 
                              lastDate: DateTime(2222)
                            ).then((value){
                              profileEditFormBloc.updateBirdate(value.toString());
                            }
                          );
                        },
                      ),
                    ]
                  );
                }
              )
          )
        ],
      ),
    );
  }
}
