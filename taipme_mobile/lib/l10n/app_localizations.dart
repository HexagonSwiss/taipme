import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it')
  ];

  /// No description provided for @language_code.
  ///
  /// In it, this message translates to:
  /// **'it'**
  String get language_code;

  /// No description provided for @language.
  ///
  /// In it, this message translates to:
  /// **'Italiano'**
  String get language;

  /// No description provided for @registration.
  ///
  /// In it, this message translates to:
  /// **'registrati'**
  String get registration;

  /// No description provided for @login.
  ///
  /// In it, this message translates to:
  /// **'accedi'**
  String get login;

  /// No description provided for @continueTo.
  ///
  /// In it, this message translates to:
  /// **'continua'**
  String get continueTo;

  /// No description provided for @save.
  ///
  /// In it, this message translates to:
  /// **'salva'**
  String get save;

  /// No description provided for @send.
  ///
  /// In it, this message translates to:
  /// **'Invia'**
  String get send;

  /// No description provided for @next.
  ///
  /// In it, this message translates to:
  /// **'Avanti'**
  String get next;

  /// No description provided for @goBack.
  ///
  /// In it, this message translates to:
  /// **'torna indietro'**
  String get goBack;

  /// No description provided for @update.
  ///
  /// In it, this message translates to:
  /// **'modifica'**
  String get update;

  /// No description provided for @home.
  ///
  /// In it, this message translates to:
  /// **'home'**
  String get home;

  /// No description provided for @or.
  ///
  /// In it, this message translates to:
  /// **'oppure'**
  String get or;

  /// No description provided for @publish.
  ///
  /// In it, this message translates to:
  /// **'pubblica'**
  String get publish;

  /// No description provided for @search.
  ///
  /// In it, this message translates to:
  /// **'cerca'**
  String get search;

  /// No description provided for @answer.
  ///
  /// In it, this message translates to:
  /// **'rispondi'**
  String get answer;

  /// No description provided for @torn.
  ///
  /// In it, this message translates to:
  /// **'strappa'**
  String get torn;

  /// No description provided for @forgotPassword.
  ///
  /// In it, this message translates to:
  /// **'Hai dimenticato la password?'**
  String get forgotPassword;

  /// No description provided for @resetPassword.
  ///
  /// In it, this message translates to:
  /// **'recupero password'**
  String get resetPassword;

  /// No description provided for @resetPasswordDescription.
  ///
  /// In it, this message translates to:
  /// **'Inserisci la tua email per poter recuperare la tua password'**
  String get resetPasswordDescription;

  /// No description provided for @name.
  ///
  /// In it, this message translates to:
  /// **'Nome'**
  String get name;

  /// No description provided for @loginTitle.
  ///
  /// In it, this message translates to:
  /// **'Accesso'**
  String get loginTitle;

  /// No description provided for @password.
  ///
  /// In it, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In it, this message translates to:
  /// **'conferma password'**
  String get confirmPassword;

  /// No description provided for @newPassword.
  ///
  /// In it, this message translates to:
  /// **'nuova password'**
  String get newPassword;

  /// No description provided for @logout.
  ///
  /// In it, this message translates to:
  /// **'Esci'**
  String get logout;

  /// No description provided for @email.
  ///
  /// In it, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @write.
  ///
  /// In it, this message translates to:
  /// **'scrivi'**
  String get write;

  /// No description provided for @appFailed.
  ///
  /// In it, this message translates to:
  /// **'Oops... Riavvia l\'app'**
  String get appFailed;

  /// No description provided for @passwordValidatorMandatory.
  ///
  /// In it, this message translates to:
  /// **'Inserisci una password valida (min. 6 caratteri)'**
  String get passwordValidatorMandatory;

  /// No description provided for @passwordValidatorMatch.
  ///
  /// In it, this message translates to:
  /// **'Le password non corrispondono'**
  String get passwordValidatorMatch;

  /// No description provided for @emailIsMandatory.
  ///
  /// In it, this message translates to:
  /// **'L\'email è obbligatoria'**
  String get emailIsMandatory;

  /// No description provided for @emailValidator.
  ///
  /// In it, this message translates to:
  /// **'Inserisci un\'email valida'**
  String get emailValidator;

  /// No description provided for @fieldIsMandatory.
  ///
  /// In it, this message translates to:
  /// **'Il campo è obbligatorio'**
  String get fieldIsMandatory;

  /// No description provided for @genderFieldIsMandatory.
  ///
  /// In it, this message translates to:
  /// **'Il genere è obbligatorio'**
  String get genderFieldIsMandatory;

  /// No description provided for @birthDateFieldIsMandatory.
  ///
  /// In it, this message translates to:
  /// **'La data di nascita è obbligatoria'**
  String get birthDateFieldIsMandatory;

  /// No description provided for @birthDayFormatIsDDMMYYYY.
  ///
  /// In it, this message translates to:
  /// **'Il formato della data di nascita deve essere gg/mm/aaaa'**
  String get birthDayFormatIsDDMMYYYY;

  /// No description provided for @formControllerFormValidator.
  ///
  /// In it, this message translates to:
  /// **'Il modulo è incompleto'**
  String get formControllerFormValidator;

  /// No description provided for @formError.
  ///
  /// In it, this message translates to:
  /// **'Qualcosa è andato storto, riprova più tardi'**
  String get formError;

  /// No description provided for @snackBarSuccess.
  ///
  /// In it, this message translates to:
  /// **'Successo'**
  String get snackBarSuccess;

  /// No description provided for @loginUserHasAnAccount.
  ///
  /// In it, this message translates to:
  /// **'Hai già un account?'**
  String get loginUserHasAnAccount;

  /// No description provided for @loginUserHasNoAccount.
  ///
  /// In it, this message translates to:
  /// **'Non hai ancora un account?'**
  String get loginUserHasNoAccount;

  /// No description provided for @registrationSuccessMessage.
  ///
  /// In it, this message translates to:
  /// **'Registrazione avvenuta! Controlla la tua casella postale per confermarla.'**
  String get registrationSuccessMessage;

  /// No description provided for @registrationConfirmedMessage.
  ///
  /// In it, this message translates to:
  /// **'Registrazione confermata!'**
  String get registrationConfirmedMessage;

  /// No description provided for @registrationConfirmedDescription.
  ///
  /// In it, this message translates to:
  /// **'Torna al login e accede con le tue credenziali.'**
  String get registrationConfirmedDescription;

  /// No description provided for @forgotPasswordEmailSent.
  ///
  /// In it, this message translates to:
  /// **'Email inviata con successo'**
  String get forgotPasswordEmailSent;

  /// No description provided for @forgotPasswordEmailSentDescription.
  ///
  /// In it, this message translates to:
  /// **'Controlla la tua casella postale e segui il link per reimpostare la tua password!'**
  String get forgotPasswordEmailSentDescription;

  /// No description provided for @forgotPasswordUpdate.
  ///
  /// In it, this message translates to:
  /// **'Aggiorna password'**
  String get forgotPasswordUpdate;

  /// No description provided for @returnToLastPage.
  ///
  /// In it, this message translates to:
  /// **'Clicca qui per tornare a'**
  String get returnToLastPage;

  /// No description provided for @registrationConfirmed.
  ///
  /// In it, this message translates to:
  /// **'Registrazione Confermata'**
  String get registrationConfirmed;

  /// No description provided for @returnToLogin.
  ///
  /// In it, this message translates to:
  /// **'Tornare alla pagina di login.'**
  String get returnToLogin;

  /// No description provided for @passwordUpdatedSuccessfully.
  ///
  /// In it, this message translates to:
  /// **'Password aggiornata con successo'**
  String get passwordUpdatedSuccessfully;

  /// No description provided for @passwordUpdatedSuccessfullyDescription.
  ///
  /// In it, this message translates to:
  /// **'Ora puoi accedere con la tua nuova password'**
  String get passwordUpdatedSuccessfullyDescription;

  /// No description provided for @faq.
  ///
  /// In it, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @contactUs.
  ///
  /// In it, this message translates to:
  /// **'Contattaci'**
  String get contactUs;

  /// No description provided for @whatIsTaipme.
  ///
  /// In it, this message translates to:
  /// **'Cos’è TaipMe?'**
  String get whatIsTaipme;

  /// No description provided for @settings.
  ///
  /// In it, this message translates to:
  /// **'Impostazioni'**
  String get settings;

  /// No description provided for @profile.
  ///
  /// In it, this message translates to:
  /// **'Profilo'**
  String get profile;

  /// No description provided for @shareYourThoughts.
  ///
  /// In it, this message translates to:
  /// **'Condividi i tuoi pensieri'**
  String get shareYourThoughts;

  /// No description provided for @messageToBeReported.
  ///
  /// In it, this message translates to:
  /// **'Messaggio da segnalare'**
  String get messageToBeReported;

  /// No description provided for @motivationOptional.
  ///
  /// In it, this message translates to:
  /// **'Motivazione (opzionale)'**
  String get motivationOptional;

  /// No description provided for @reportMessage.
  ///
  /// In it, this message translates to:
  /// **'segnala'**
  String get reportMessage;

  /// No description provided for @read.
  ///
  /// In it, this message translates to:
  /// **'leggi'**
  String get read;

  /// No description provided for @tear.
  ///
  /// In it, this message translates to:
  /// **'strappa'**
  String get tear;

  /// No description provided for @reply.
  ///
  /// In it, this message translates to:
  /// **'rispondi'**
  String get reply;

  /// No description provided for @writeNew.
  ///
  /// In it, this message translates to:
  /// **'scrivi'**
  String get writeNew;

  /// No description provided for @report.
  ///
  /// In it, this message translates to:
  /// **'segnala'**
  String get report;

  /// No description provided for @thereAreNoPapers.
  ///
  /// In it, this message translates to:
  /// **'Non ci sono fogli'**
  String get thereAreNoPapers;

  /// No description provided for @replyToMessage.
  ///
  /// In it, this message translates to:
  /// **'Rispondi al messaggio'**
  String get replyToMessage;

  /// No description provided for @reportReasonHint.
  ///
  /// In it, this message translates to:
  /// **'Spiega il motivo della segnalazione'**
  String get reportReasonHint;

  /// No description provided for @reportButton.
  ///
  /// In it, this message translates to:
  /// **'Segnala'**
  String get reportButton;

  /// No description provided for @snackbarFailedToCreateMessage.
  ///
  /// In it, this message translates to:
  /// **'Impossibile creare il messaggio.'**
  String get snackbarFailedToCreateMessage;

  /// No description provided for @snackbarFailedToSendReply.
  ///
  /// In it, this message translates to:
  /// **'Impossibile inviare la risposta.'**
  String get snackbarFailedToSendReply;

  /// No description provided for @snackbarFailedToTearMessage.
  ///
  /// In it, this message translates to:
  /// **'Impossibile strappare il messaggio.'**
  String get snackbarFailedToTearMessage;

  /// No description provided for @snackbarFailedToReportMessage.
  ///
  /// In it, this message translates to:
  /// **'Impossibile segnalare il messaggio.'**
  String get snackbarFailedToReportMessage;

  /// No description provided for @introText1.
  ///
  /// In it, this message translates to:
  /// **'TaipMe è un foglio anonimo dove puoi scrivere e leggere pensieri senza like o notifiche. Un ambiente anti-social basato sulla qualità, non sulla quantità.'**
  String get introText1;

  /// No description provided for @introText2.
  ///
  /// In it, this message translates to:
  /// **'Hai 5 fogli a disposizione: scrivi, leggi e, se vuoi, rispondi. Le risposte creano conversazioni private, un messaggio alla volta. Puoi interromperle quando vuoi.'**
  String get introText2;

  /// No description provided for @introText3.
  ///
  /// In it, this message translates to:
  /// **'I fogli ti permettono di esprimerti liberamente, con leggerezza o profondità. Vivi l’esperienza senza stress, dentro e fuori lo schermo.'**
  String get introText3;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'it': return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
