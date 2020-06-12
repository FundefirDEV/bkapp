import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "No route defined for ${route}"
  String pageNotFound(String route) => "No route defined for ${route}";
  /// "Test text"
  String get testText => "Test text";
  /// "You have pushed the button this many times:"
  String get firstText => "You have pushed the button this many times:";
  /// "Go to login"
  String get goToLogin => "Go to login";
  /// "Splash Screen"
  String get splashScreen => "Splash Screen";
  /// "ENTER"
  String get actionTextEnter => "ENTER";
  /// "I'M NEW"
  String get actionTextImNew => "I'M NEW";
  /// "CLOSE"
  String get actionTextClose => "CLOSE";
  /// "User"
  String get formUser => "User";
  /// "Password"
  String get formPassword => "Password";
  /// "Confirm password"
  String get formConfirmPassword => "Confirm password";
  /// "First name"
  String get formFirstName => "First name";
  /// "Second name"
  String get formSecondName => "Second name";
  /// "Email"
  String get formEmail => "Email";
  /// "Phone"
  String get formPhone => "Phone";
  /// "This field is required"
  String get errorRequired => "This field is required";
  /// "there is nothing here!"
  String get errorIsEmpty => "there is nothing here!";
  /// "Go to "
  String get loginScreenTextOne => "Go to ";
  /// "your bank"
  String get loginScreenTextTwo => "your bank";
  /// "Start being in control of your financial life"
  String get introScreenFinancialLife => "Start being in control of your financial life";
  /// "You know what a "
  String get introScreenYouKnow => "You know what a ";
  /// "group Bk"
  String get introScreenGrupoBk => "group Bk";
  /// "Select an option to continue"
  String get introScreenSelectOption => "Select an option to continue";
  /// "¿HOWS DOES A "
  String get introScreenHowDoesA => "¿HOWS DOES A ";
  /// "GROUP BK?"
  String get introScreenQuestionGroupBk => "GROUP BK?";
  /// "Educative media"
  String get introScreenEducativeMedia => "Educative media";
  /// "Register my "
  String get introScreenRegister => "Register my ";
  /// "BK account"
  String get introScreenAccountBk => "BK account";
  /// "Guided form"
  String get introScreenGuidedForm => "Guided form";
  /// "male"
  String get genderScreenMan => "male";
  /// "female"
  String get genderScreenWoman => "female";
  /// "other"
  String get genderScreenOther => "other";
  /// "Hey, "
  String get genderScreenTextFirst => "Hey, ";
  /// "let's create your profile"
  String get genderScreenTextSecond => "let's create your profile";
  /// "Select your gender"
  String get genderScreenTextSubtitle => "Select your gender";
  /// "How would you like to"
  String get introRegisterModalTitle => "How would you like to";
  /// "create your account"
  String get introRegisterModalCreateAccount => "create your account";
  /// "?"
  String get introRegisterModalInterrogation => "?";
  /// "Gmail"
  String get introRegisterModalGmail => "Gmail";
  /// "Customised"
  String get introRegisterModalCustom => "Customised";
  /// "How Would it be?"
  String get bankScreenTitle => "How Would it be?";
  /// "Now we need some data"
  String get registerNameTitle => "Now we need some data";
  /// "Very good"
  String get registerEmailTitle => "Very good";
  /// "Only a few personal details are missing"
  String get registerEmailSubtitle => "Only a few personal details are missing";
  /// "To finish create your password"
  String get registerPhoneTitle => "To finish create your password";
  /// "To create "
  String get registerPhoneTextOne => "To create ";
  /// "your password "
  String get registerPhoneTextTwo => "your password ";
  /// "we "
  String get registerPhoneTextThree => "we ";
  /// "need your "
  String get registerPhoneTextFour => "need your ";
  /// "cell number"
  String get registerPhoneTextFive => "cell number";
  /// "VERY "
  String get confimInvitationBankTitleOne => "VERY ";
  /// "GOOD!"
  String get confimInvitationBankTitleTwo => "GOOD!";
  /// "Your profile has been created"
  String get confimInvitationBankSubtitle => "Your profile has been created";
  /// "You don't have any pending invitation yet, now let's create your first "
  String get confimInvitationBankDescription => "You don't have any pending invitation yet, now let's create your first ";
  /// "¡VERY "
  String get bankCreatedScreenVery => "¡VERY ";
  /// "GOOD!"
  String get bankCreatedScreenGood => "GOOD!";
  /// " has been created"
  String get bankCreatedScreenHasBeenCreaed => " has been created";
  /// "Where are you from?"
  String get selectCountryWhereAreYouFrom => "Where are you from?";
  /// "PARTNER"
  String get inviteModalPartner => "PARTNER";
  /// "Name"
  String get inviteModalName => "Name";
  /// "Cell phone"
  String get inviteModalCellPhone => "Cell phone";
  /// "ADD"
  String get inviteModalAdd => "ADD";
  /// "from my contacts"
  String get inviteModalFromMyContacts => "from my contacts";
  /// "You have "
  String get inviteModalYouHave => "You have ";
  /// " partners"
  String get inviteModalPartners => " partners";
  /// "Enter your state and city"
  String get selectCityEnterSateCity => "Enter your state and city";
  /// "CITY"
  String get selectCityCity => "CITY";
  /// "STATE"
  String get selectCityState => "STATE";
  /// "By last!"
  String get bankNameByLast => "By last!";
  /// "Put the name of your BKgroup"
  String get bankNamePutName => "Put the name of your BKgroup";
  /// "Write here"
  String get bankNameWriteHere => "Write here";
  /// "Name"
  String get bankNameNameBk => "Name";
  /// "CREATE"
  String get bankNameCreate => "CREATE";
  /// "Now add the partners"
  String get bankRegisterAddPartnersFirstTitle => "Now add the partners";
  /// "from your BKapp"
  String get bankRegisterAddPartnersSecondText => "from your BKapp";
  /// "partners"
  String get bankRegisterAddPartnersTitle => "partners";
  /// "Minimum "
  String get bankRegisterAddPartnersMinimum => "Minimum ";
  /// "8 "
  String get bankRegisterAddPartnersEight => "8 ";
  /// "ADD "
  String get bankRegisterAddPartnersButtonAdd => "ADD ";
  /// "PARTNER"
  String get bankRegisterAddPartnersButtonPartner => "PARTNER";
  /// "Útiles"
  String get utilsUtils => "Útiles";
  /// "Approvals"
  String get utilsApprovals => "Approvals";
  /// "requests"
  String get utilsRequests => "requests";
  /// "Rules of"
  String get utilsRulesOf => "Rules of";
  /// "bk group"
  String get utilsGroupBk => "bk group";
  /// "Withdrawal of"
  String get utilsWithdrawalOf => "Withdrawal of";
  /// "Partners"
  String get utilsPartners => "Partners";
  /// "Payment of"
  String get utilsPaymentOf => "Payment of";
  /// "Profits"
  String get utilsProfits => "Profits";
  /// "Approve credits\nand actions"
  String get utilsApproveCreditActions => "Approve credits\nand actions";
  /// "Know how to\nmanage your banko"
  String get utilsKnowManageBk => "Know how to\nmanage your banko";
  /// "Delete and\ndeliver actions"
  String get utilsDeleteDeliverActions => "Delete and\ndeliver actions";
  /// "Know your\nearnings for the year"
  String get utilsKnowEarningsYear => "Know your\nearnings for the year";
  /// "Exemptions"
  String get utilsExemptions => "Exemptions";
  /// "Assignment"
  String get utilsAssignment => "Assignment";
  /// "administrator"
  String get utilsAdministrator => "administrator";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_es_ES extends I18n {
  const _I18n_es_ES();

  /// "No existe una ruta definida para ${route}"
  @override
  String pageNotFound(String route) => "No existe una ruta definida para ${route}";
  /// "Texto de prueba"
  @override
  String get testText => "Texto de prueba";
  /// "Has presionado el boton varias veces"
  @override
  String get firstText => "Has presionado el boton varias veces";
  /// "Ir a login"
  @override
  String get goToLogin => "Ir a login";
  /// "Splash Screen"
  @override
  String get splashScreen => "Splash Screen";
  /// "INGRESAR"
  @override
  String get actionTextEnter => "INGRESAR";
  /// "SOY NUEVO"
  @override
  String get actionTextImNew => "SOY NUEVO";
  /// "CERRAR"
  @override
  String get actionTextClose => "CERRAR";
  /// "Usuario"
  @override
  String get formUser => "Usuario";
  /// "Clave"
  @override
  String get formPassword => "Clave";
  /// "Confirmar clave"
  @override
  String get formConfirmPassword => "Confirmar clave";
  /// "Primer nombre"
  @override
  String get formFirstName => "Primer nombre";
  /// "Segundo nombre"
  @override
  String get formSecondName => "Segundo nombre";
  /// "Correo electrónico"
  @override
  String get formEmail => "Correo electrónico";
  /// "Celular"
  @override
  String get formPhone => "Celular";
  /// "Este campo es obligatorio"
  @override
  String get errorRequired => "Este campo es obligatorio";
  /// "¡No hay nada aquí!"
  @override
  String get errorIsEmpty => "¡No hay nada aquí!";
  /// "Entra a "
  @override
  String get loginScreenTextOne => "Entra a ";
  /// "tu banko"
  @override
  String get loginScreenTextTwo => "tu banko";
  /// "Empieza a tener el control de tu vida financiera"
  @override
  String get introScreenFinancialLife => "Empieza a tener el control de tu vida financiera";
  /// "¿Sabes qué es un "
  @override
  String get introScreenYouKnow => "¿Sabes qué es un ";
  /// "grupo Bk?"
  @override
  String get introScreenGrupoBk => "grupo Bk?";
  /// "Selecciona una opción para seguir"
  @override
  String get introScreenSelectOption => "Selecciona una opción para seguir";
  /// "¿CÓMO FUNCIONA UN "
  @override
  String get introScreenHowDoesA => "¿CÓMO FUNCIONA UN ";
  /// "GRUPO BK?"
  @override
  String get introScreenQuestionGroupBk => "GRUPO BK?";
  /// "Video educativo"
  @override
  String get introScreenEducativeMedia => "Video educativo";
  /// "REGISTRAR MI "
  @override
  String get introScreenRegister => "REGISTRAR MI ";
  /// "CUENTA BK"
  @override
  String get introScreenAccountBk => "CUENTA BK";
  /// "Formulario guiado"
  @override
  String get introScreenGuidedForm => "Formulario guiado";
  /// "hombre"
  @override
  String get genderScreenMan => "hombre";
  /// "mujer"
  @override
  String get genderScreenWoman => "mujer";
  /// "otro"
  @override
  String get genderScreenOther => "otro";
  /// "Hola, "
  @override
  String get genderScreenTextFirst => "Hola, ";
  /// "vamos a crear tu perfil"
  @override
  String get genderScreenTextSecond => "vamos a crear tu perfil";
  /// "Selecciona tu género"
  @override
  String get genderScreenTextSubtitle => "Selecciona tu género";
  /// "¿Cómo te gustaría"
  @override
  String get introRegisterModalTitle => "¿Cómo te gustaría";
  /// "crear tu cuenta"
  @override
  String get introRegisterModalCreateAccount => "crear tu cuenta";
  /// "?"
  @override
  String get introRegisterModalInterrogation => "?";
  /// "Gmail"
  @override
  String get introRegisterModalGmail => "Gmail";
  /// "Personalizado"
  @override
  String get introRegisterModalCustom => "Personalizado";
  /// "Como sería?"
  @override
  String get bankScreenTitle => "Como sería?";
  /// "Ahora necesitamos algunos datos"
  @override
  String get registerNameTitle => "Ahora necesitamos algunos datos";
  /// "Muy bien"
  @override
  String get registerEmailTitle => "Muy bien";
  /// "Solo falta unos pocos datos personales"
  @override
  String get registerEmailSubtitle => "Solo falta unos pocos datos personales";
  /// "Para finalizar crea tu clave"
  @override
  String get registerPhoneTitle => "Para finalizar crea tu clave";
  /// "Para crear "
  @override
  String get registerPhoneTextOne => "Para crear ";
  /// "tu clave "
  @override
  String get registerPhoneTextTwo => "tu clave ";
  /// "necesitamos"
  @override
  String get registerPhoneTextThree => "necesitamos";
  /// "tu "
  @override
  String get registerPhoneTextFour => "tu ";
  /// "número celular"
  @override
  String get registerPhoneTextFive => "número celular";
  /// "¡MUY "
  @override
  String get confimInvitationBankTitleOne => "¡MUY ";
  /// "BIEN!"
  @override
  String get confimInvitationBankTitleTwo => "BIEN!";
  /// "Tu perfil ha sido creado"
  @override
  String get confimInvitationBankSubtitle => "Tu perfil ha sido creado";
  /// "Aún no tienes alguna invitación pendiente, ahora creemos tu primer "
  @override
  String get confimInvitationBankDescription => "Aún no tienes alguna invitación pendiente, ahora creemos tu primer ";
  /// "¡MUY "
  @override
  String get bankCreatedScreenVery => "¡MUY ";
  /// "BIEN!"
  @override
  String get bankCreatedScreenGood => "BIEN!";
  /// " ha sido creado"
  @override
  String get bankCreatedScreenHasBeenCreaed => " ha sido creado";
  /// "¿De qué país eres?"
  @override
  String get selectCountryWhereAreYouFrom => "¿De qué país eres?";
  /// "SOCIO"
  @override
  String get inviteModalPartner => "SOCIO";
  /// "Nombre"
  @override
  String get inviteModalName => "Nombre";
  /// "Número celular"
  @override
  String get inviteModalCellPhone => "Número celular";
  /// "AGREGAR"
  @override
  String get inviteModalAdd => "AGREGAR";
  /// "desde mís contactos"
  @override
  String get inviteModalFromMyContacts => "desde mís contactos";
  /// "Tienes "
  @override
  String get inviteModalYouHave => "Tienes ";
  /// " socios"
  @override
  String get inviteModalPartners => " socios";
  /// "Coloca tu estado y ciudad"
  @override
  String get selectCityEnterSateCity => "Coloca tu estado y ciudad";
  /// "CIUDAD"
  @override
  String get selectCityCity => "CIUDAD";
  /// "ESTADO"
  @override
  String get selectCityState => "ESTADO";
  /// "¡Por último!"
  @override
  String get bankNameByLast => "¡Por último!";
  /// "Coloca el nombre de tu BKgrupo"
  @override
  String get bankNamePutName => "Coloca el nombre de tu BKgrupo";
  /// "Esbriba aquí"
  @override
  String get bankNameWriteHere => "Esbriba aquí";
  /// "Nombre"
  @override
  String get bankNameNameBk => "Nombre";
  /// "CREAR"
  @override
  String get bankNameCreate => "CREAR";
  /// "Ahora agrega los socios"
  @override
  String get bankRegisterAddPartnersFirstTitle => "Ahora agrega los socios";
  /// "de tu BKapp"
  @override
  String get bankRegisterAddPartnersSecondText => "de tu BKapp";
  /// "socios"
  @override
  String get bankRegisterAddPartnersTitle => "socios";
  /// "Mínimo "
  @override
  String get bankRegisterAddPartnersMinimum => "Mínimo ";
  /// "8 "
  @override
  String get bankRegisterAddPartnersEight => "8 ";
  /// "AGREGAR "
  @override
  String get bankRegisterAddPartnersButtonAdd => "AGREGAR ";
  /// "SOCIO"
  @override
  String get bankRegisterAddPartnersButtonPartner => "SOCIO";
  /// "Útiles"
  @override
  String get utilsUtils => "Útiles";
  /// "Approvals"
  @override
  String get utilsApprovals => "Approvals";
  /// "peticiones"
  @override
  String get utilsRequests => "peticiones";
  /// "Reglas del"
  @override
  String get utilsRulesOf => "Reglas del";
  /// "grupo bk"
  @override
  String get utilsGroupBk => "grupo bk";
  /// "Retiro de"
  @override
  String get utilsWithdrawalOf => "Retiro de";
  /// "socios"
  @override
  String get utilsPartners => "socios";
  /// "Pago de"
  @override
  String get utilsPaymentOf => "Pago de";
  /// "ganancias"
  @override
  String get utilsProfits => "ganancias";
  /// "Aprobar créditos\ny acciones"
  @override
  String get utilsApproveCreditActions => "Aprobar créditos\ny acciones";
  /// "Conoce cómo\nmanejar tu banko"
  @override
  String get utilsKnowManageBk => "Conoce cómo\nmanejar tu banko";
  /// "Elimina y entrega\nlas acciones"
  @override
  String get utilsDeleteDeliverActions => "Elimina y entrega\nlas acciones";
  /// "Conoce tus\nganancias del año"
  @override
  String get utilsKnowEarningsYear => "Conoce tus\nganancias del año";
  /// "Exoneraciones"
  @override
  String get utilsExemptions => "Exoneraciones";
  /// "Asignar"
  @override
  String get utilsAssignment => "Asignar";
  /// "administradores"
  @override
  String get utilsAdministrator => "administradores";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"),
      Locale("es", "ES")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("es_ES" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_es_ES());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("es" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_es_ES());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}