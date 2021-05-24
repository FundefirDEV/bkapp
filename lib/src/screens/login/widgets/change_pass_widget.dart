
import 'package:bkapp_flutter/core/bloc/changePassbloc/change_pass_bloc.dart';
import 'package:bkapp_flutter/core/bloc/changePassbloc/change_pass_provider.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/changePass/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

showForgetPasswordAlert(BuildContext context){

    final dialogChangePassBloc = DialogChangePassBloc();

    return 
      Alert(
        context: context,
        title: I18n.of(context).changePasswordDialogTittle,
        content: DialogChangePassProvider(dialogChangePassBloc: dialogChangePassBloc,
          child: Column(
            children: <Widget>[
              _create_email(context, dialogChangePassBloc),
              _create_phone(context, dialogChangePassBloc),
              SizedBox(height: 20.0,),
              _create_button(context, dialogChangePassBloc)
            ],
          ),
        ),
        buttons: [
          //_create_button(context, dialogChangePassBloc)
        ]
      )
    .show();
  }


  Widget _create_email(BuildContext context , DialogChangePassBloc dialogChangePassBloc){
    return StreamBuilder(
      stream: dialogChangePassBloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot emailSnapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress ,
          decoration: InputDecoration(
            icon: Icon(Icons.mail),
            labelText: I18n.of(context).formEmail,
            errorText: emailSnapshot.error,
            counterText: emailSnapshot.data
          ),
          onChanged: (value) => dialogChangePassBloc.changeEmail(value),
        );
      } 
    );
  }

  Widget _create_phone(BuildContext context , DialogChangePassBloc dialogChangePassBloc){

    return StreamBuilder(
      stream: dialogChangePassBloc.phoneStream,
      builder: (BuildContext context, AsyncSnapshot phoneSnapshot){
        return TextField(
          keyboardType: TextInputType.number ,
          decoration: InputDecoration(
            icon: Icon(Icons.phone),
            labelText: I18n.of(context).formPhone,
            errorText: phoneSnapshot.error,
            counterText: phoneSnapshot.data
          ),
          onChanged: (value) => dialogChangePassBloc.changePhone(value),
        );
      } 
    );
  }

  Widget _create_button(BuildContext context , DialogChangePassBloc dialogChangePassBloc){

    return StreamBuilder(
      stream: dialogChangePassBloc.loadingStream,
      builder: (BuildContext context,AsyncSnapshot loginSnapshot) {
        return  StreamBuilder(
          stream: dialogChangePassBloc.formValidStream,
          builder: (BuildContext context, AsyncSnapshot formValidSnapshot){
            return DialogButton(
                height: 40,
                onPressed:
                formValidSnapshot.hasData ? ()=> _congirmEmailAndPass(context , dialogChangePassBloc): null,
                child: loginSnapshot.data != null && loginSnapshot.data ? 
                      Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ) 
                      :Text(
                  I18n.of(context).changePasswordDialogSend,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
            );
          } 
        );
      }
    );
  }



_congirmEmailAndPass(BuildContext context, DialogChangePassBloc dialogChangePassBloc) async {

  print(dialogChangePassBloc.email);
  print(dialogChangePassBloc.phone);

  final res = await dialogChangePassBloc.changePassSendMail();
  print(res);
    dialogChangePassBloc.changeLoading(false);

  if(res){

    //Navigator.pushNamed(context, changePasswordScreen);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> 
        ChangePassPage(email: dialogChangePassBloc.email, phone: dialogChangePassBloc.phone)
    ));
  }
}