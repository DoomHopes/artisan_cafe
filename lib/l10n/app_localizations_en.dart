// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Artisan Cafe';

  @override
  String get editName => 'Edit Name';

  @override
  String get enterNewName => 'Enter new name';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String homeBrewerSince(String year) {
    return 'Home Brewer since $year';
  }

  @override
  String get dailyGoal => 'Daily Goal';

  @override
  String get cupsPerDay => 'cups/day';

  @override
  String get reminders => 'Reminders';

  @override
  String get remindersDescription =>
      'Receive smart prompts to log your brews and track caffeine metabolism.';

  @override
  String get language => 'Language';

  @override
  String get exportData => 'Export Data';

  @override
  String get exportDataDescription => 'Download your brew history as CSV';

  @override
  String get signOut => 'Sign Out';

  @override
  String get signOutDescription =>
      'Disconnect your account and remove local data.';

  @override
  String get enterCredentials => 'Please enter username and password';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get readyForBrewing => 'Ready for your next brewing ritual?';

  @override
  String get loginLabel => 'LOGIN';

  @override
  String get usernameHint => 'Username or Email';

  @override
  String get passwordLabel => 'PASSWORD';

  @override
  String get restoreBackup => 'RESTORE FROM BACKUP';

  @override
  String get orText => 'OR';

  @override
  String get createProfile => 'Create a new profile';

  @override
  String get copyrightText => '© 2024 Ethos Brewing Rituals';

  @override
  String get privacyLink => 'Privacy';

  @override
  String get termsLink => 'Terms';

  @override
  String get supportLink => 'Support';

  @override
  String goodMorning(String name) {
    return 'Good Morning, $name';
  }

  @override
  String get readyForFirstBrew => 'Ready for your first brew?';

  @override
  String get customDrink => 'Custom Drink';

  @override
  String get noDrinksLogged => 'No drinks logged yet. Add one!';

  @override
  String get dailyCaffeineTipTitle => 'Daily Caffeine Tip';

  @override
  String get dailyCaffeineTipText =>
      '\"Wait 90 minutes after waking up before your first cup to let your adenosine levels reset naturally. This helps avoid the afternoon crash.\"';

  @override
  String get hydrationLabel => 'HYDRATION';

  @override
  String get litersLabel => 'Liters';

  @override
  String get caffeineLabel => 'CAFFEINE';

  @override
  String get mgLabel => 'mg';

  @override
  String get fillAllFields => 'Please fill all fields';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get startRitual => 'Start Your Ritual';

  @override
  String get setFoundation =>
      'Set the foundation for your brewing journey. Your data is your own.';

  @override
  String get confirmPasswordLabel => 'CONFIRM PASSWORD';

  @override
  String get enterUsernameHint => 'Enter your username';

  @override
  String get privacyNote =>
      'Everything stays on your device. We value your focus and privacy; no accounts or cloud sync required.';

  @override
  String get settingUp => 'Setting up...';

  @override
  String get createAccount => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get loginLink => 'Login';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get brewHistory => 'Brew History';

  @override
  String get brewHistorySubtitle => 'Your coffee journey, curated cup by cup.';

  @override
  String get todaysIntake => 'TODAY\'S INTAKE';

  @override
  String get avgRoast => 'AVG ROAST';

  @override
  String get totalCups => 'TOTAL CUPS';

  @override
  String get noHistoryYet => 'No history yet.';

  @override
  String get weeklyRitual => 'Weekly Ritual';

  @override
  String get mostDrunkTitle => 'Most Drunk';

  @override
  String get peakTimeTitle => 'Peak Time';

  @override
  String roastSubtitle(String origin, String roast) {
    return '$origin • $roast Roast';
  }

  @override
  String get weeklyInsights => 'Weekly Insights';

  @override
  String get weeklyInsightsSubtitle => 'Your caffeine ritual, quantified.';

  @override
  String get weeklyAverage => 'Weekly Average';

  @override
  String get totalCaffeineLabel => 'Total Caffeine';

  @override
  String get consumptionTrends => 'Consumption Trends';

  @override
  String get week => 'Week';

  @override
  String get month => 'Month';

  @override
  String get shortMon => 'M';

  @override
  String get shortTue => 'T';

  @override
  String get shortWed => 'W';

  @override
  String get shortThu => 'T';

  @override
  String get shortFri => 'F';

  @override
  String get shortSat => 'S';

  @override
  String get shortSun => 'S';

  @override
  String get beanPreferences => 'Bean Preferences';

  @override
  String get brewingTip => 'Brewing Tip';

  @override
  String get optimizeExtraction => 'Optimize your extraction';

  @override
  String get optimizeExtractionText =>
      'Based on your frequency, you might enjoy a coarser grind for your morning ritual to reduce acidity.';

  @override
  String get learnHow => 'Learn how';

  @override
  String get ethiopianYirgacheffe => 'Ethiopian Yirgacheffe';

  @override
  String get coldBrewHouse => 'Cold Brew (House)';

  @override
  String get oatMilkLatte => 'Oat Milk Latte';

  @override
  String get navHome => 'Home';

  @override
  String get navHistory => 'History';

  @override
  String get navStats => 'Stats';

  @override
  String get navProfile => 'Profile';

  @override
  String get brewDetails => 'Brew Details';

  @override
  String get step2Of3 => 'Step 2 of 3';

  @override
  String get configuration => 'Configuration';

  @override
  String get coffeeOrigin => 'Coffee Origin';

  @override
  String get roastLevel => 'Roast Level';

  @override
  String get roastLight => 'Light';

  @override
  String get roastMedium => 'Medium';

  @override
  String get roastDark => 'Dark';

  @override
  String get brewMethodTitle => 'Brew Method';

  @override
  String get methodV60 => 'V60';

  @override
  String get methodV60Desc => 'Clean and bright pour-over';

  @override
  String get methodFrenchPress => 'French Press';

  @override
  String get methodFrenchPressDesc => 'Full-bodied and immersive';

  @override
  String get methodAeroPress => 'AeroPress';

  @override
  String get methodAeroPressDesc => 'Versatile and travel-friendly';

  @override
  String get methodMokaPot => 'Moka Pot';

  @override
  String get methodMokaPotDesc => 'Rich and espresso-like';

  @override
  String get continueButton => 'Continue';

  @override
  String get customDrinkTitle => 'Custom Drink';

  @override
  String get craftRecipe => 'Craft your recipe';

  @override
  String get drinkName => 'Drink Name';

  @override
  String get drinkNameHint => 'e.g., Honey Lavender Latte';

  @override
  String get strength => 'Strength';

  @override
  String get strengthSubtle => 'Subtle';

  @override
  String get strengthLight => 'Light';

  @override
  String get strengthModerate => 'Moderate';

  @override
  String get strengthBold => 'Bold';

  @override
  String get strengthExtraStrong => 'Extra Strong';

  @override
  String get strengthMildLabel => 'Mild';

  @override
  String get strengthStrongLabel => 'Strong';

  @override
  String get volumeMl => 'Volume (ml)';

  @override
  String get volumeCustom => 'Custom';

  @override
  String get milkBased => 'Milk-based';

  @override
  String get milkBasedDesc => 'Include dairy or alternatives';

  @override
  String get reviewBrew => 'Review Brew';

  @override
  String get step3Of3 => 'Step 3 of 3';

  @override
  String get readyToLog => 'Ready to log';

  @override
  String get brewSummary => 'BREW SUMMARY';

  @override
  String get milkBasedLabel => 'Milk based';

  @override
  String get caffeineImpact => 'CAFFEINE IMPACT';

  @override
  String get dailyProgress => 'Daily Progress';

  @override
  String dailyProgressValue(String current, String target) {
    return '$current / $target mg';
  }

  @override
  String remainingLimitText(String remaining) {
    return 'Remaining: ${remaining}mg before your target daily limit.';
  }

  @override
  String get estimatedPeak => 'Estimated Peak';

  @override
  String get brewingYourDay => 'BREWING YOUR DAY...';
}
