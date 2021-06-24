import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileEdition/bloc/profile_edit_Bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileEdition/profile_edit_form_Bloc.dart';
import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/editProfile/widgets/textFields/email_fields.dart';
import 'package:bkapp_flutter/src/screens/editProfile/widgets/textFields/name_fields.dart';
import 'package:bkapp_flutter/src/screens/editProfile/widgets/top_container_edit_profile_screen.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileEditScreen extends StatefulWidget {

  //final ProfileModel profile;
  ProfileEditScreen({ Key key, @required this.token }) : super(key: key);
  final String token;

  @override
  _ProfileEditScreen createState() => 
  _ProfileEditScreen();
}

class _ProfileEditScreen extends State<ProfileEditScreen> {

  @override
  void initState() {
    context.read<ProfileEditBloc>().add(ProfileEditInitialize(token: widget.token));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

   SizeConfig().init(context);

   final profileEditFormBloc = context.read<AppBloc>().profileEditFormBloc;
    
    return BlocBuilder<ProfileEditBloc, ProfileEditState>(builder: (context, state) {
      if (state is ProfileEditLoaded) {

        return ProfileEditFormWidget(
          profile: state.profileModel , 
          token: widget.token,
          profileEditFormBloc : profileEditFormBloc,
        );
      }
      if (state is ProfileEditFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class ProfileEditFormWidget extends StatefulWidget {
    final String token;
    final ProfileModel profile;
    final ProfileEditFormBloc profileEditFormBloc;
    ProfileEditFormWidget({@required this.profile , @required this.token , this.profileEditFormBloc});

  @override
  _ProfileEditFormWidgetState createState() => _ProfileEditFormWidgetState(
    token: token , 
    profile: profile , 
    profileEditFormBloc: profileEditFormBloc
  );
}

class _ProfileEditFormWidgetState extends State<ProfileEditFormWidget> {

  final String token;
  final ProfileModel profile;
  final ProfileEditFormBloc profileEditFormBloc;

  _ProfileEditFormWidgetState({
    @required this.profile , 
    @required this.token , 
    @required this.profileEditFormBloc
  });

  @override
  void initState() {

    profileEditFormBloc.getProfileData(profile);

    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      
      return Scaffold(
      body: SafeArea(
        child: Column(
        key: Key('main_column_rules_edit_screen'),
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight * .30,
            //color: Colors.grey[100],
            child: TopContainerEditProfileScreen(
              profile: widget.profile
            ),
          ),
          textError(),
          Flexible(
            child: Container(
              key: Key('container_textFields_rules_edit_screen'),
              height: SizeConfig.screenHeight * .70,
              //color: Colors.grey[100],
              child: Container(
                child: SingleChildScrollView(
                  key: Key('scrollView_rules_edit_screen'),
                  child: Column(
                    key: Key('column_textFields_rules_edit_screen'),
                    children: <Widget>[
                      Column(
                        key: Key('row_textFields_rules_edit_screen'),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          EmailAndPhoneFields(), 
                          NamesFields(),
                        ],
                      ),
                      //SizedBox(height: SizeConfig.blockSizeVertical * 6),
                      updatedButton(context , widget.token),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }


  Widget textError(){

    return StreamBuilder(
      stream: profileEditFormBloc.errorMessageStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          color: Colors.grey[50],
          height: 40,
          child: Center(
            child: Text( snapshot.data != null ? snapshot.data: '' ,
              style: TextStyle(
                color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        );
      }
    );
  }

  Widget updatedButton(
    BuildContext context,
    String token,){

    profileEditFormBloc.token.updateValue(token);
      return StreamBuilder(
      stream: profileEditFormBloc.loadingStream,
      builder: (BuildContext context , AsyncSnapshot loadingsnapshot) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          key: Key('container_update_button_rules_edit_screen'),
          height: SizeConfig.blockSizeVertical * 5,
          width: SizeConfig.blockSizeHorizontal * 45,
          child: ElevatedButton(
            key: Key('flatButton_rules_edit_screen'),
            onPressed: () => sumit(context),
            child: loadingsnapshot.data != null && loadingsnapshot.data ?
              Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ):
              Text(
              I18n.of(context).profileEditScreenUpdate,
              style: TextStyle(color: Colors.white, letterSpacing: 4),
            ),
          ),
        );
      },
    );
  }

  void sumit(BuildContext context) async{

    final res = await profileEditFormBloc.submit();

    print(res);

    if(res){
      context.read<MenuNavigatorBloc>().add(ButtonPressed(
        goTo: HomeRoutesConstant.profileScreen));
    }
  }
}
