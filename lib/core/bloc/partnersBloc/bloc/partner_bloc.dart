import 'dart:async';

// import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/partner_repository.dart';
import 'package:bkapp_flutter/core/services/sql/partner_sql.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'partner_event.dart';
part 'partner_state.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  PartnerBloc({@required this.partnerRepository}) : super(PartnerInitial());
  final PartnerRepository partnerRepository;

  PartnerDatabaseProvider pendingPartnerDb = PartnerDatabaseProvider.db;

  @override
  Stream<PartnerState> mapEventToState(
    PartnerEvent event,
  ) async* {
    if (event is AddAndVerifyPartner) {
      yield* _validatePartner(event);
    }
    if (event is JustValidatePartner) {
      yield* _justValidatePartner(event);
    }
    if (event is AddPartnerToDb) {
      yield* _addToDb(event);
    }
  }

  Stream<PartnerState> _validatePartner(AddAndVerifyPartner event) async* {
    yield PartnerLoading();
    try {
      await partnerRepository.getPartnerValidation(
          event.token, UtilsTools.removePhoneFormatter(event.phoneNumber));
      yield PartnerVerified(phoneNumber: event.phoneNumber);
      await pendingPartnerDb.addPartnerToDatabase(
          PartnerModel(firstname: event.name, phone: event.phoneNumber));
      yield PartnerAddedToDb();

      if (!event.isRegister) {
        yield* _addToBack(event);
      }
    } catch (e) {
      yield PartnerUnauthorized(
          phoneNumber: event.phoneNumber, error: e.message);
    }
  }

  Stream<PartnerState> _justValidatePartner(JustValidatePartner event) async* {
    yield PartnerLoading();
    try {
      await partnerRepository.getPartnerValidation(
          event.token, UtilsTools.removePhoneFormatter(event.phoneNumber));
      yield PartnerVerified(phoneNumber: event.phoneNumber);
    } catch (e) {
      yield PartnerUnauthorized(
          phoneNumber: event.phoneNumber, error: e.message);
    }
  }

  Stream<PartnerState> _addToDb(AddPartnerToDb event) async* {
    await pendingPartnerDb.addPartnerToDatabase(
        PartnerModel(firstname: event.name, phone: event.phoneNumber));
    yield PartnerAddedToDb();
    if (!event.isRegister) {
        yield* _addToBack(event);
      }
  }

  Stream<PartnerState> _addToBack(dynamic event) async* {
    try {
      await partnerRepository.postInvitePartner(
        event.token,
        [
          {
            "name": event.name,
            "phone": UtilsTools.removePhoneFormatter(event.phoneNumber)
          }
        ]
      );
      yield PartnerAddedToBack();
    } catch(e) {
      PartnerFailureToBack(
        phoneNumber: event.phoneNumber, error: e.message
      );
    }
  }
}
