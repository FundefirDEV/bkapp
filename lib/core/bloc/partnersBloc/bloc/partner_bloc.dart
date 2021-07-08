import 'dart:async';

// import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/partner_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'partner_event.dart';
part 'partner_state.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  PartnerBloc({@required this.partnerRepository}) : super(PartnerInitial());
  final PartnerRepository partnerRepository;

  @override
  Stream<PartnerState> mapEventToState(PartnerEvent event) async* {
    if (event is PartnerInitialize) {
      yield PartnerLoading();
      try {

        final response = await partnerRepository.getPartners(event.token);
        List<PartnerModel> partnerList = [];
        response.forEach((partner) { 
          partnerList.add(
            PartnerModel(
              phone: partner['phone'],
              firstname: partner['name'],
              isActive: partner['isActive'],
              role: partner['role']
            )
          );
        });

        yield PartnerLoaded(partnerList: partnerList);
      } catch (e) {
        yield PartnerFailure(error: e.toString());
      }
    }
  }
}
