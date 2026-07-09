import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Artisan Cafe'**
  String get appName;

  /// No description provided for @editName.
  ///
  /// In en, this message translates to:
  /// **'Edit Name'**
  String get editName;

  /// No description provided for @enterNewName.
  ///
  /// In en, this message translates to:
  /// **'Enter new name'**
  String get enterNewName;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @homeBrewerSince.
  ///
  /// In en, this message translates to:
  /// **'Home Brewer since {year}'**
  String homeBrewerSince(String year);

  /// No description provided for @dailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily Goal'**
  String get dailyGoal;

  /// No description provided for @cupsPerDay.
  ///
  /// In en, this message translates to:
  /// **'cups/day'**
  String get cupsPerDay;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @remindersDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive smart prompts to log your brews and track caffeine metabolism.'**
  String get remindersDescription;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// No description provided for @exportDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Download your brew history as CSV'**
  String get exportDataDescription;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @signOutDescription.
  ///
  /// In en, this message translates to:
  /// **'Disconnect your account and remove local data.'**
  String get signOutDescription;

  /// No description provided for @enterCredentials.
  ///
  /// In en, this message translates to:
  /// **'Please enter username and password'**
  String get enterCredentials;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @readyForBrewing.
  ///
  /// In en, this message translates to:
  /// **'Ready for your next brewing ritual?'**
  String get readyForBrewing;

  /// No description provided for @loginLabel.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get loginLabel;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username or Email'**
  String get usernameHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get passwordLabel;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'RESTORE FROM BACKUP'**
  String get restoreBackup;

  /// No description provided for @orText.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orText;

  /// No description provided for @createProfile.
  ///
  /// In en, this message translates to:
  /// **'Create a new profile'**
  String get createProfile;

  /// No description provided for @copyrightText.
  ///
  /// In en, this message translates to:
  /// **'© 2024 Ethos Brewing Rituals'**
  String get copyrightText;

  /// No description provided for @privacyLink.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyLink;

  /// No description provided for @termsLink.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get termsLink;

  /// No description provided for @supportLink.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get supportLink;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning, {name}'**
  String goodMorning(String name);

  /// No description provided for @readyForFirstBrew.
  ///
  /// In en, this message translates to:
  /// **'Ready for your first brew?'**
  String get readyForFirstBrew;

  /// No description provided for @customDrink.
  ///
  /// In en, this message translates to:
  /// **'Custom Drink'**
  String get customDrink;

  /// No description provided for @noDrinksLogged.
  ///
  /// In en, this message translates to:
  /// **'No drinks logged yet. Add one!'**
  String get noDrinksLogged;

  /// No description provided for @dailyCaffeineTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Caffeine Tip'**
  String get dailyCaffeineTipTitle;

  /// No description provided for @dailyCaffeineTipText.
  ///
  /// In en, this message translates to:
  /// **'\"Wait 90 minutes after waking up before your first cup to let your adenosine levels reset naturally. This helps avoid the afternoon crash.\"'**
  String get dailyCaffeineTipText;

  /// No description provided for @hydrationLabel.
  ///
  /// In en, this message translates to:
  /// **'HYDRATION'**
  String get hydrationLabel;

  /// No description provided for @litersLabel.
  ///
  /// In en, this message translates to:
  /// **'Liters'**
  String get litersLabel;

  /// No description provided for @caffeineLabel.
  ///
  /// In en, this message translates to:
  /// **'CAFFEINE'**
  String get caffeineLabel;

  /// No description provided for @mgLabel.
  ///
  /// In en, this message translates to:
  /// **'mg'**
  String get mgLabel;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all fields'**
  String get fillAllFields;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @startRitual.
  ///
  /// In en, this message translates to:
  /// **'Start Your Ritual'**
  String get startRitual;

  /// No description provided for @setFoundation.
  ///
  /// In en, this message translates to:
  /// **'Set the foundation for your brewing journey. Your data is your own.'**
  String get setFoundation;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM PASSWORD'**
  String get confirmPasswordLabel;

  /// No description provided for @enterUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get enterUsernameHint;

  /// No description provided for @privacyNote.
  ///
  /// In en, this message translates to:
  /// **'Everything stays on your device. We value your focus and privacy; no accounts or cloud sync required.'**
  String get privacyNote;

  /// No description provided for @settingUp.
  ///
  /// In en, this message translates to:
  /// **'Setting up...'**
  String get settingUp;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @loginLink.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginLink;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @brewHistory.
  ///
  /// In en, this message translates to:
  /// **'Brew History'**
  String get brewHistory;

  /// No description provided for @brewHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your coffee journey, curated cup by cup.'**
  String get brewHistorySubtitle;

  /// No description provided for @todaysIntake.
  ///
  /// In en, this message translates to:
  /// **'TODAY\'S INTAKE'**
  String get todaysIntake;

  /// No description provided for @avgRoast.
  ///
  /// In en, this message translates to:
  /// **'AVG ROAST'**
  String get avgRoast;

  /// No description provided for @totalCups.
  ///
  /// In en, this message translates to:
  /// **'TOTAL CUPS'**
  String get totalCups;

  /// No description provided for @noHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No history yet.'**
  String get noHistoryYet;

  /// No description provided for @weeklyRitual.
  ///
  /// In en, this message translates to:
  /// **'Weekly Ritual'**
  String get weeklyRitual;

  /// No description provided for @mostDrunkTitle.
  ///
  /// In en, this message translates to:
  /// **'Most Drunk'**
  String get mostDrunkTitle;

  /// No description provided for @peakTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Peak Time'**
  String get peakTimeTitle;

  /// No description provided for @roastSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{origin} • {roast} Roast'**
  String roastSubtitle(String origin, String roast);

  /// No description provided for @weeklyInsights.
  ///
  /// In en, this message translates to:
  /// **'Weekly Insights'**
  String get weeklyInsights;

  /// No description provided for @weeklyInsightsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your caffeine ritual, quantified.'**
  String get weeklyInsightsSubtitle;

  /// No description provided for @weeklyAverage.
  ///
  /// In en, this message translates to:
  /// **'Weekly Average'**
  String get weeklyAverage;

  /// No description provided for @totalCaffeineLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Caffeine'**
  String get totalCaffeineLabel;

  /// No description provided for @consumptionTrends.
  ///
  /// In en, this message translates to:
  /// **'Consumption Trends'**
  String get consumptionTrends;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @shortMon.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get shortMon;

  /// No description provided for @shortTue.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get shortTue;

  /// No description provided for @shortWed.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get shortWed;

  /// No description provided for @shortThu.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get shortThu;

  /// No description provided for @shortFri.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get shortFri;

  /// No description provided for @shortSat.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get shortSat;

  /// No description provided for @shortSun.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get shortSun;

  /// No description provided for @beanPreferences.
  ///
  /// In en, this message translates to:
  /// **'Bean Preferences'**
  String get beanPreferences;

  /// No description provided for @brewingTip.
  ///
  /// In en, this message translates to:
  /// **'Brewing Tip'**
  String get brewingTip;

  /// No description provided for @optimizeExtraction.
  ///
  /// In en, this message translates to:
  /// **'Optimize your extraction'**
  String get optimizeExtraction;

  /// No description provided for @optimizeExtractionText.
  ///
  /// In en, this message translates to:
  /// **'Based on your frequency, you might enjoy a coarser grind for your morning ritual to reduce acidity.'**
  String get optimizeExtractionText;

  /// No description provided for @learnHow.
  ///
  /// In en, this message translates to:
  /// **'Learn how'**
  String get learnHow;

  /// No description provided for @ethiopianYirgacheffe.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian Yirgacheffe'**
  String get ethiopianYirgacheffe;

  /// No description provided for @coldBrewHouse.
  ///
  /// In en, this message translates to:
  /// **'Cold Brew (House)'**
  String get coldBrewHouse;

  /// No description provided for @oatMilkLatte.
  ///
  /// In en, this message translates to:
  /// **'Oat Milk Latte'**
  String get oatMilkLatte;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navStats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get navStats;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @brewDetails.
  ///
  /// In en, this message translates to:
  /// **'Brew Details'**
  String get brewDetails;

  /// No description provided for @step2Of3.
  ///
  /// In en, this message translates to:
  /// **'Step 2 of 3'**
  String get step2Of3;

  /// No description provided for @configuration.
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get configuration;

  /// No description provided for @coffeeOrigin.
  ///
  /// In en, this message translates to:
  /// **'Coffee Origin'**
  String get coffeeOrigin;

  /// No description provided for @roastLevel.
  ///
  /// In en, this message translates to:
  /// **'Roast Level'**
  String get roastLevel;

  /// No description provided for @roastLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get roastLight;

  /// No description provided for @roastMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get roastMedium;

  /// No description provided for @roastDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get roastDark;

  /// No description provided for @brewMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Brew Method'**
  String get brewMethodTitle;

  /// No description provided for @methodV60.
  ///
  /// In en, this message translates to:
  /// **'V60'**
  String get methodV60;

  /// No description provided for @methodV60Desc.
  ///
  /// In en, this message translates to:
  /// **'Clean and bright pour-over'**
  String get methodV60Desc;

  /// No description provided for @methodFrenchPress.
  ///
  /// In en, this message translates to:
  /// **'French Press'**
  String get methodFrenchPress;

  /// No description provided for @methodFrenchPressDesc.
  ///
  /// In en, this message translates to:
  /// **'Full-bodied and immersive'**
  String get methodFrenchPressDesc;

  /// No description provided for @methodAeroPress.
  ///
  /// In en, this message translates to:
  /// **'AeroPress'**
  String get methodAeroPress;

  /// No description provided for @methodAeroPressDesc.
  ///
  /// In en, this message translates to:
  /// **'Versatile and travel-friendly'**
  String get methodAeroPressDesc;

  /// No description provided for @methodMokaPot.
  ///
  /// In en, this message translates to:
  /// **'Moka Pot'**
  String get methodMokaPot;

  /// No description provided for @methodMokaPotDesc.
  ///
  /// In en, this message translates to:
  /// **'Rich and espresso-like'**
  String get methodMokaPotDesc;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @customDrinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Drink'**
  String get customDrinkTitle;

  /// No description provided for @craftRecipe.
  ///
  /// In en, this message translates to:
  /// **'Craft your recipe'**
  String get craftRecipe;

  /// No description provided for @drinkName.
  ///
  /// In en, this message translates to:
  /// **'Drink Name'**
  String get drinkName;

  /// No description provided for @drinkNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Honey Lavender Latte'**
  String get drinkNameHint;

  /// No description provided for @strength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strength;

  /// No description provided for @strengthSubtle.
  ///
  /// In en, this message translates to:
  /// **'Subtle'**
  String get strengthSubtle;

  /// No description provided for @strengthLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get strengthLight;

  /// No description provided for @strengthModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get strengthModerate;

  /// No description provided for @strengthBold.
  ///
  /// In en, this message translates to:
  /// **'Bold'**
  String get strengthBold;

  /// No description provided for @strengthExtraStrong.
  ///
  /// In en, this message translates to:
  /// **'Extra Strong'**
  String get strengthExtraStrong;

  /// No description provided for @strengthMildLabel.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get strengthMildLabel;

  /// No description provided for @strengthStrongLabel.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strengthStrongLabel;

  /// No description provided for @volumeMl.
  ///
  /// In en, this message translates to:
  /// **'Volume (ml)'**
  String get volumeMl;

  /// No description provided for @volumeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get volumeCustom;

  /// No description provided for @milkBased.
  ///
  /// In en, this message translates to:
  /// **'Milk-based'**
  String get milkBased;

  /// No description provided for @milkBasedDesc.
  ///
  /// In en, this message translates to:
  /// **'Include dairy or alternatives'**
  String get milkBasedDesc;

  /// No description provided for @reviewBrew.
  ///
  /// In en, this message translates to:
  /// **'Review Brew'**
  String get reviewBrew;

  /// No description provided for @step3Of3.
  ///
  /// In en, this message translates to:
  /// **'Step 3 of 3'**
  String get step3Of3;

  /// No description provided for @readyToLog.
  ///
  /// In en, this message translates to:
  /// **'Ready to log'**
  String get readyToLog;

  /// No description provided for @brewSummary.
  ///
  /// In en, this message translates to:
  /// **'BREW SUMMARY'**
  String get brewSummary;

  /// No description provided for @milkBasedLabel.
  ///
  /// In en, this message translates to:
  /// **'Milk based'**
  String get milkBasedLabel;

  /// No description provided for @caffeineImpact.
  ///
  /// In en, this message translates to:
  /// **'CAFFEINE IMPACT'**
  String get caffeineImpact;

  /// No description provided for @dailyProgress.
  ///
  /// In en, this message translates to:
  /// **'Daily Progress'**
  String get dailyProgress;

  /// No description provided for @dailyProgressValue.
  ///
  /// In en, this message translates to:
  /// **'{current} / {target} mg'**
  String dailyProgressValue(String current, String target);

  /// No description provided for @remainingLimitText.
  ///
  /// In en, this message translates to:
  /// **'Remaining: {remaining}mg before your target daily limit.'**
  String remainingLimitText(String remaining);

  /// No description provided for @estimatedPeak.
  ///
  /// In en, this message translates to:
  /// **'Estimated Peak'**
  String get estimatedPeak;

  /// No description provided for @brewingYourDay.
  ///
  /// In en, this message translates to:
  /// **'BREWING YOUR DAY...'**
  String get brewingYourDay;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
