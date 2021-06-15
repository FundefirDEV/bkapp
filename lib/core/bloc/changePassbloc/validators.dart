
import 'dart:async';

class Validators {

  final passwordValidator = StreamTransformer<String , String>.fromHandlers(

    handleData: (password , sink){

      if(password.length >= 6){

        sink.add(password);

      } else {

        sink.addError('Must be longer than 6 characters');
      }
    }
  );

  final confirmPasswordValidator = StreamTransformer<String , String>.fromHandlers(

    handleData: (confirmPassword , sink){

      if(confirmPassword.length >= 6){

        sink.add(confirmPassword);

      } else {

        sink.addError('Must be longer than 6 characters');
      }
    }
  );

  final pincodeValidator = StreamTransformer<String , String>.fromHandlers(

    handleData: (confirmPassword , sink){

      if(confirmPassword.length >= 5){

        sink.add(confirmPassword);

      } else {

        sink.addError('Must be longer than 6 characters');
      }
    }
  );

   final emailValidator = StreamTransformer<String , String>.fromHandlers(
    
    handleData: (email , sink){

      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp emailRegExp = new RegExp(pattern);


      if(emailRegExp.hasMatch(email)){

        sink.add(email);

      } else {
        
        sink.addError('Please enter a valid email');
      }
    }
  );

    final phoneValidator = StreamTransformer<String , String>.fromHandlers(

    handleData: (phone , sink){

      if(phone.length >= 6){

        sink.add(phone);

      } else {

        sink.addError('Must be longer than 6 characters');
      }
    }
  );
}