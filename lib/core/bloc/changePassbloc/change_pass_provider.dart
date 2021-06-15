import 'package:bkapp_flutter/core/bloc/changePassbloc/change_pass_bloc.dart';
import 'package:flutter/material.dart';

class ChangePassProvider extends InheritedWidget {
 static ChangePassProvider _intance;

  factory ChangePassProvider({Key key, Widget child , @required ChangePassBloc changePassBloc}) {
    
    if (_intance == null) {

      _intance = new ChangePassProvider._internal(key: key, child: child , changePassBloc: changePassBloc,);
    }
    return _intance;
  }

  ChangePassProvider._internal({Key key, Widget child , ChangePassBloc changePassBloc }) 
    : super(key: key, child: child );


  final changePassBloc = ChangePassBloc;
  final dialogChangePassBloc = DialogChangePassBloc;


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static ChangePassProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType());
  }
}

class DialogChangePassProvider extends InheritedWidget {
 static DialogChangePassProvider _intance;

  factory DialogChangePassProvider({Key key, Widget child , @required DialogChangePassBloc dialogChangePassBloc}) {
    
    if (_intance == null) {

      _intance = new DialogChangePassProvider.
        _internal(key: key, child: child , dialogChangePassBloc: dialogChangePassBloc,);
    }
    return _intance;
  }

  DialogChangePassProvider._internal({Key key, Widget child , DialogChangePassBloc dialogChangePassBloc }) 
    : super(key: key, child: child );


  final dialogChangePassBloc = DialogChangePassBloc;


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static ChangePassProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType());
  }
}