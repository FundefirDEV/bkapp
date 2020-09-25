import 'package:bkapp_flutter/core/bloc/profileBloc/profile_bloc.dart';
import 'package:bkapp_flutter/src/screens/profile/content/bottom_containers_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profile/content/gain_button_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profile/content/middle_container_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profile/content/top_container_profile_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.tokenUser}) : super(key: key);
  final String tokenUser;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.bloc<ProfileBloc>().add(ProfileInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TopContainerProfileScreen topContainer = new TopContainerProfileScreen();
    MiddleContainerProfileScreen middleContainers =
        new MiddleContainerProfileScreen();
    GainButtonProfileScreen gainButton = new GainButtonProfileScreen();
    BottomContainersProfileScreen bottomContainers =
        new BottomContainersProfileScreen();

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoaded) {
        return Material(
          color: Theme.of(context).colorScheme.grayColor[100],
          child: SafeArea(
            child: Column(children: <Widget>[
              Container(
                  child:
                      topContainer.topContainer(context, state.profileModel)),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: <Widget>[
                        middleContainers.middleContainers(
                            context, state.profileModel),
                        gainButton.gainContainerButton(
                            context, state.profileModel),
                        bottomContainers.bottomContainers(
                            context, state.profileModel),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        );
      }
      if (state is ProfileFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
