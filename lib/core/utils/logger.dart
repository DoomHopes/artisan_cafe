import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init(
  settings: TalkerSettings(
    useConsoleLogs: true,
    useHistory: true,
    maxHistoryItems: 1000,
  ),
);
