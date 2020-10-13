import 'package:bkapp_flutter/src/screens/profile/widgets/cards_information_profile.dart';
import 'package:bkapp_flutter/src/screens/profile/widgets/detail_bk_profile_widget.dart';
import 'package:bkapp_flutter/src/screens/profile/widgets/app_bar_profile_widget.dart';
import 'package:bkapp_flutter/src/screens/profile/widgets/box_my_earnings_widget.dart';
import 'package:bkapp_flutter/core/bloc/profileBloc/profile_bloc.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoaded) {
        return AppBarProfileWidget(
            profile: state.profileModel,
            container: Column(children: [
              CardsInformationProfile(profile: state.profileModel),
              BoxMyEarningsWidget(profile: state.profileModel),
              DetailBkProfileWidget(profile: state.profileModel)
            ]));
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
