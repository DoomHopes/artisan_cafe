// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Artisan Cafe';

  @override
  String get editName => 'Редактировать имя';

  @override
  String get enterNewName => 'Введите новое имя';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String homeBrewerSince(String year) {
    return 'Домашний бариста с $year';
  }

  @override
  String get dailyGoal => 'Дневная цель';

  @override
  String get cupsPerDay => 'чашек/день';

  @override
  String get reminders => 'Напоминания';

  @override
  String get remindersDescription =>
      'Получайте умные подсказки для записи напитков и отслеживания метаболизма кофеина.';

  @override
  String get language => 'Язык';

  @override
  String get exportData => 'Экспорт данных';

  @override
  String get exportDataDescription => 'Скачать историю напитков в формате CSV';

  @override
  String get signOut => 'Выйти';

  @override
  String get signOutDescription =>
      'Отключить аккаунт и удалить локальные данные.';

  @override
  String get enterCredentials =>
      'Пожалуйста, введите имя пользователя и пароль';

  @override
  String get welcomeBack => 'С возвращением';

  @override
  String get readyForBrewing => 'Готовы к следующему ритуалу заваривания?';

  @override
  String get loginLabel => 'ВОЙТИ';

  @override
  String get usernameHint => 'Имя пользователя или Email';

  @override
  String get passwordLabel => 'ПАРОЛЬ';

  @override
  String get restoreBackup => 'ВОССТАНОВИТЬ ИЗ РЕЗЕРВНОЙ КОПИИ';

  @override
  String get orText => 'ИЛИ';

  @override
  String get createProfile => 'Создать новый профиль';

  @override
  String get copyrightText => '© 2024 Ethos Brewing Rituals';

  @override
  String get privacyLink => 'Конфиденциальность';

  @override
  String get termsLink => 'Условия';

  @override
  String get supportLink => 'Поддержка';

  @override
  String goodMorning(String name) {
    return 'Доброе утро, $name';
  }

  @override
  String get readyForFirstBrew => 'Готовы к первой чашке?';

  @override
  String get customDrink => 'Свой напиток';

  @override
  String get noDrinksLogged => 'Пока нет записей. Добавьте первую!';

  @override
  String get dailyCaffeineTipTitle => 'Совет дня по кофеину';

  @override
  String get dailyCaffeineTipText =>
      '\"Подождите 90 минут после пробуждения перед первой чашкой, чтобы уровень аденозина сбросился естественно. Это поможет избежать спада энергии во второй половине дня.\"';

  @override
  String get hydrationLabel => 'ВОДА';

  @override
  String get litersLabel => 'Литров';

  @override
  String get caffeineLabel => 'КОФЕИН';

  @override
  String get mgLabel => 'мг';

  @override
  String get fillAllFields => 'Пожалуйста, заполните все поля';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get startRitual => 'Начать ритуал';

  @override
  String get setFoundation =>
      'Заложите основу для вашего кофейного пути. Ваши данные принадлежат только вам.';

  @override
  String get confirmPasswordLabel => 'ПОДТВЕРДИТЕ ПАРОЛЬ';

  @override
  String get enterUsernameHint => 'Введите ваше имя пользователя';

  @override
  String get privacyNote =>
      'Всё остается на вашем устройстве. Мы ценим вашу концентрацию и конфиденциальность; аккаунты или облачная синхронизация не требуются.';

  @override
  String get settingUp => 'Настройка...';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт?';

  @override
  String get loginLink => 'Войти';

  @override
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

  @override
  String get brewHistory => 'История напитков';

  @override
  String get brewHistorySubtitle =>
      'Ваше кофейное путешествие, чашка за чашкой.';

  @override
  String get todaysIntake => 'СЕГОДНЯ';

  @override
  String get avgRoast => 'СРЕДНЯЯ ОБЖАРКА';

  @override
  String get totalCups => 'ВЫПИТО ЧАШЕК';

  @override
  String get noHistoryYet => 'Пока нет истории.';

  @override
  String get weeklyRitual => 'Еженедельный ритуал';

  @override
  String get mostDrunkTitle => 'Самый популярный';

  @override
  String get peakTimeTitle => 'Пиковое время';

  @override
  String roastSubtitle(String origin, String roast) {
    return '$origin • Обжарка: $roast';
  }

  @override
  String get weeklyInsights => 'Итоги недели';

  @override
  String get weeklyInsightsSubtitle => 'Ваши кофейные ритуалы в цифрах.';

  @override
  String get weeklyAverage => 'Среднее за неделю';

  @override
  String get totalCaffeineLabel => 'Всего кофеина';

  @override
  String get consumptionTrends => 'Тренды потребления';

  @override
  String get week => 'Неделя';

  @override
  String get month => 'Месяц';

  @override
  String get shortMon => 'П';

  @override
  String get shortTue => 'В';

  @override
  String get shortWed => 'С';

  @override
  String get shortThu => 'Ч';

  @override
  String get shortFri => 'П';

  @override
  String get shortSat => 'С';

  @override
  String get shortSun => 'В';

  @override
  String get beanPreferences => 'Предпочтения зерен';

  @override
  String get brewingTip => 'Совет по завариванию';

  @override
  String get optimizeExtraction => 'Оптимизируйте экстракцию';

  @override
  String get optimizeExtractionText =>
      'Учитывая вашу частоту, вам может понравиться более крупный помол для утреннего ритуала, чтобы снизить кислотность.';

  @override
  String get learnHow => 'Узнать как';

  @override
  String get ethiopianYirgacheffe => 'Эфиопия Иргачеффе';

  @override
  String get coldBrewHouse => 'Колд Брю (Домашний)';

  @override
  String get oatMilkLatte => 'Латте на овсяном молоке';

  @override
  String get navHome => 'Главная';

  @override
  String get navHistory => 'История';

  @override
  String get navStats => 'Статистика';

  @override
  String get navProfile => 'Профиль';

  @override
  String get brewDetails => 'Детали напитка';

  @override
  String get step2Of3 => 'Шаг 2 из 3';

  @override
  String get configuration => 'Настройка';

  @override
  String get coffeeOrigin => 'Происхождение кофе';

  @override
  String get roastLevel => 'Степень обжарки';

  @override
  String get roastLight => 'Светлая';

  @override
  String get roastMedium => 'Средняя';

  @override
  String get roastDark => 'Темная';

  @override
  String get brewMethodTitle => 'Способ заваривания';

  @override
  String get methodV60 => 'V60';

  @override
  String get methodV60Desc => 'Чистый и яркий вкус (пуровер)';

  @override
  String get methodFrenchPress => 'Френч-пресс';

  @override
  String get methodFrenchPressDesc => 'Плотный и насыщенный';

  @override
  String get methodAeroPress => 'Аэропресс';

  @override
  String get methodAeroPressDesc => 'Универсальный, удобен в поездках';

  @override
  String get methodMokaPot => 'Гейзерная';

  @override
  String get methodMokaPotDesc => 'Насыщенный, как эспрессо';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get customDrinkTitle => 'Свой напиток';

  @override
  String get craftRecipe => 'Создайте свой рецепт';

  @override
  String get drinkName => 'Название';

  @override
  String get drinkNameHint => 'напр., Лавандовый латте';

  @override
  String get strength => 'Крепость';

  @override
  String get strengthSubtle => 'Слабая';

  @override
  String get strengthLight => 'Легкая';

  @override
  String get strengthModerate => 'Средняя';

  @override
  String get strengthBold => 'Крепкая';

  @override
  String get strengthExtraStrong => 'Очень крепкая';

  @override
  String get strengthMildLabel => 'Мягкий';

  @override
  String get strengthStrongLabel => 'Крепкий';

  @override
  String get volumeMl => 'Объем (мл)';

  @override
  String get volumeCustom => 'Свой';

  @override
  String get milkBased => 'С молоком';

  @override
  String get milkBasedDesc => 'Включает молоко или альтернативы';

  @override
  String get reviewBrew => 'Подтверждение';

  @override
  String get step3Of3 => 'Шаг 3 из 3';

  @override
  String get readyToLog => 'Готово к записи';

  @override
  String get brewSummary => 'ИТОГИ НАПИТКА';

  @override
  String get milkBasedLabel => 'С молоком';

  @override
  String get caffeineImpact => 'ВЛИЯНИЕ КОФЕИНА';

  @override
  String get dailyProgress => 'Дневной прогресс';

  @override
  String dailyProgressValue(String current, String target) {
    return '$current / $target мг';
  }

  @override
  String remainingLimitText(String remaining) {
    return 'Осталось: $remainingмг до дневного лимита.';
  }

  @override
  String get estimatedPeak => 'Ожидаемый пик';

  @override
  String get brewingYourDay => 'ЗАВАРИВАЕМ ВАШ ДЕНЬ...';
}
