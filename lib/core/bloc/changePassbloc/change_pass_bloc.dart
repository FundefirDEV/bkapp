import 'dart:async';
import 'package:bkapp_flutter/core/bloc/changePassbloc/validators.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class ChangePassBloc extends ChangeNotifier with Validators {

  final _pincodeController = BehaviorSubject<String>();
  final _passwordController   = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _loadingController = BehaviorSubject<bool>();

  // Obtenet el ultimo valor ingresado en los stream
  String get pincode => _pincodeController.value;
  String get password => _passwordController.value;
  String get confirmPassword => _confirmPasswordController.value;
  bool get loading => _loadingController.value;

  // recuperar los datos del Stream
  Stream<String> get pincodeStream => 
  _pincodeController.stream.transform(pincodeValidator).asBroadcastStream();
  Stream<String> get passwordStream => 
  _passwordController.stream.transform(passwordValidator).asBroadcastStream();
  Stream<String> get confirmPasswordStream => 
  _confirmPasswordController.stream.transform(confirmPasswordValidator).asBroadcastStream();
  Stream<bool> get loadingStream => _loadingController.stream.asBroadcastStream();

  Stream<bool> get formValidStream => 

     Rx.combineLatest3(pincodeStream ,passwordStream, confirmPasswordStream , (a, b ,c) => true).asBroadcastStream();

  bool mathPassAndPassConfirmation (){

    if(password == confirmPassword){
      return true;
    } else {
      _confirmPasswordController.sink.addError('passwords do not match');
      return false;
    }
  } 

  // insertar los datas del Stream
  Function(String) get changePincode => _pincodeController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeConfirmPassword => _confirmPasswordController.sink.add;
  Function(bool) get changeLoading => _loadingController.sink.add;


  void badRequestErrorPassword(){
    _pincodeController.sink.addError('Invalid code');
  } 

  dispose(){

    _confirmPasswordController.close();
    _passwordController.close();
    _loadingController.close();
    _pincodeController.close();

  }

  Future<bool> sumitChangePass(BuildContext context , String email , String phone) async {
    
  final apiProvider = ApiProvider(httpClient: http.Client());

  changeLoading(true);

    try {
      print('pincode: $pincode');
      print('pass: $password');
      print('confirmPass: $confirmPassword');
      print('email: $email');
      print('phone: $phone');

    await apiProvider.changePasswordWithCodeConfirm(
      code: pincode ,
      email: email, 
      phone: phone,  
      password: password , 
      passwordConfirmation: confirmPassword
    ); 

      changeLoading(false);
      return true;


    } catch (e) {
      badRequestErrorPassword();
      print(e);
      changeLoading(false);
      return false;
    }
  }
}


class DialogChangePassBloc extends ChangeNotifier with Validators {

  final _emailController = BehaviorSubject<String>();
  final _phoneController   = BehaviorSubject<String>();
  final _loadingController = BehaviorSubject<bool>();

  // Obtenet el ultimo valor ingresado en los stream
  String get email => _emailController.value;
  String get phone => _phoneController.value;
  bool get loading => _loadingController.value;

  // recuperar los datos del Stream
  Stream<String> get emailStream => 
  _emailController.stream.transform(emailValidator).asBroadcastStream();
  Stream<String> get phoneStream => 
  _phoneController.stream.transform(phoneValidator).asBroadcastStream();
  Stream<bool> get loadingStream => _loadingController.stream.asBroadcastStream();

  Stream<bool> get formValidStream => 

     Rx.combineLatest2(emailStream ,phoneStream,  (a, b) => true).asBroadcastStream();


  // insertar los datas del Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePhone => _phoneController.sink.add;
  Function(bool) get changeLoading => _loadingController.sink.add;


  void badRequestErrorPassword(){
    _phoneController.sink.addError('Invalid credencial');
    _emailController.sink.addError('Invalid credencial');
  } 

  dispose(){

    _phoneController.close();
    _loadingController.close();
    _emailController.close();

  }

  Future<bool> changePassSendMail() async {
    
  final apiProvider = ApiProvider(httpClient: http.Client());

  changeLoading(true);

    try {

      print('password: $email');
      print('username: $phone');

      final res = await apiProvider.changePassSendMail( email: email , phone: phone ); 

      print('res: $res');
      changeLoading(false);
      
      return true;


    } catch (e) {
      badRequestErrorPassword();
      print(e);
      changeLoading(false);
      return false;
    }
  }
}