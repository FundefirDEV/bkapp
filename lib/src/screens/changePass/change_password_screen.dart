import 'package:bkapp_flutter/core/bloc/changePassbloc/change_pass_bloc.dart';
import 'package:bkapp_flutter/core/bloc/changePassbloc/change_pass_provider.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/changePass/widgets/input_code.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/bloc_providers.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePassPage  extends StatefulWidget {

  final email;
  final phone;
  ChangePassPage({@required this.email , @required this.phone});

  @override
  _ChangePassPageState createState() => _ChangePassPageState(email: email, phone: phone);
}

class _ChangePassPageState extends State<ChangePassPage> {

  final email;
  final phone;
  _ChangePassPageState({@required this.email , @required this.phone});

  @override
  Widget build(BuildContext context) {
  SizeConfig().init(context);

  return 
    Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:<Widget> [
          Positioned(
            bottom: 0,
            child: Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 50,
                child: SvgPicture.asset('assets/images/oval.svg',
                    fit: BoxFit.cover
              )),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 10,
            child: _change_pass_form(context)
          ),
        ],
      ),
    );
  }

  Widget _change_pass_form(BuildContext context) {

    final changePassBloc  = ChangePassBloc();
    final _size = MediaQuery.of(context).size;

    return 
     ChangePassProvider(
      changePassBloc: changePassBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SafeArea(
                  child: Container(
                    height: SizeConfig.blockSizeHorizontal * 50,
                  ),
                ),
              ),

            Container(
              width: _size.width * 0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow> [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0
                )
              ],
            ),
            child:Column(
              children: <Widget> [
                Text( I18n.of(context).changePasswordFormTitle, style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 30.0,),
                InputCode(changePassBloc: changePassBloc,),
                //_pincode_form(changePassBloc),
                SizedBox(height: 20.0,),
                _pass_form(changePassBloc),
                SizedBox(height: 20.0,),
                _confirm_pass_form(changePassBloc),
                SizedBox(height: 20.0,),
                _create_enter_button(changePassBloc),
                SizedBox(height: 20.0,),
              ],
            ) ,
          ),
        ],
      ),
    ),
  );
}

  // Widget _pincode_form( ChangePassBloc changePassBloc){
  //  return StreamBuilder(
  //     stream: changePassBloc.pincodeStream ,
  //     builder: (BuildContext context, AsyncSnapshot snapshot){
  //       return Container(
  //         padding: EdgeInsets.symmetric(horizontal: 20.0),
  //         child: TextField(
  //           keyboardType: TextInputType.number,
  //           obscureText: true,
  //           maxLength: 5,
  //           decoration: InputDecoration(
  //             icon: Icon(Icons.pin , color: Colors.deepPurple,),
  //             labelText: I18n.of(context).changePasswordConfirCode,
  //             counterText: snapshot.data,
  //             errorText: snapshot.error,
  //           ),
  //           onChanged: (value) => changePassBloc.changePincode(value),
  //         ),
  //       );
  //     },
  //   );  
  // }

  Widget _pass_form( ChangePassBloc changePassBloc){

   return StreamBuilder(
      stream: changePassBloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outlined , color: Colors.blue,),
              labelText: I18n.of(context).changePasswordNewPassword,
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: (value) => changePassBloc.changePassword(value),
          ),
        );
      },
    );  
  }

  Widget _confirm_pass_form( ChangePassBloc changePassBloc ){

    return StreamBuilder(
      stream: changePassBloc.confirmPasswordStream,
      builder:(BuildContext context, AsyncSnapshot confirmPasswordsnapshot){
        return StreamBuilder(
          stream: changePassBloc.formValidStream ,
          builder: (BuildContext context, AsyncSnapshot formValidsnapshot){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outlined , color: Colors.blue,),
                  labelText: I18n.of(context).changePasswordConfirmNewPassword,
                  counterText: confirmPasswordsnapshot.data,
                  errorText: confirmPasswordsnapshot.error ,
                ),
                onChanged: (value) => changeConfirmPass(value , changePassBloc),
                onEditingComplete: 
                  () => formValidsnapshot.hasData ? summit(changePassBloc,context ) : null,
              ),
            );
          },
        );
      } ,      
    ); 
  }

  void changeConfirmPass(String value , ChangePassBloc changePassBloc){

    changePassBloc.changeConfirmPassword(value);
    if(value != changePassBloc.password){
      changePassBloc.passConfirmationError();
    }
  }

  Widget _create_enter_button( ChangePassBloc changePassBloc ){

    return StreamBuilder(
      stream: changePassBloc.formValidStream ,
        builder: (BuildContext context, AsyncSnapshot formValidSnapshot){
          return StreamBuilder(
            stream: changePassBloc.loadingStream ,
            builder: (BuildContext context, AsyncSnapshot loadingSnapshot){
            return ElevatedButton(
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                child: loadingSnapshot.data != null && loadingSnapshot.data ? 
                  CircularProgressIndicator(
                    color: Colors.white,
                  ) 
                  :
                  Text(I18n.of(context).changePasswordChangePassSend) 
              ),
              style: ButtonStyle(
                // foregroundColor:
                //     MaterialStateProperty.all<Color>(Colors.white),
                // backgroundColor:
                //     MaterialStateProperty.all<Color>(Colors.deepPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )  
              )
            ),
            onPressed: formValidSnapshot.hasData ? () => summit(changePassBloc,context) : null);
          },
        );
      }
    );
  }

    summit(ChangePassBloc changePassBloc ,BuildContext context ){
      final res = changePassBloc.sumitChangePass(context , email , phone);

      res.then((value) => value ? _showConfirmDialog(context , changePassBloc)  : null);
    }


  void _showConfirmDialog(BuildContext context , ChangePassBloc changePassBloc) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (_) {
        return ImageBottomModal(
          modalHeight: 47.0,
          image: 'assets/images/salo_pre_approved_modal.svg',
          isImageBg: true,
          title: I18n.of(context).changePasswordSuccess,
          isBold: true,
          isBtnAccept: false,
          titleCloseButton: I18n.of(context).administratorAssignmentClose,
          onPressCancel: () {
            //changePassBloc.dispose();
            Navigator.pushReplacementNamed(context, loginRoute);            
          }
        );
      }
    );
  }  
}
