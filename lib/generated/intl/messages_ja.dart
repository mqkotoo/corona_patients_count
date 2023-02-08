// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("戻る"),
        "check": MessageLookupByLibrary.simpleMessage("チェック"),
        "description": MessageLookupByLibrary.simpleMessage(
            "*危険度は、この都道府県の最大感染者数に対して現在の感染者数がどれくらいかで割り出しています。 情報提供：NHK"),
        "errorMessage": MessageLookupByLibrary.simpleMessage("エラーが発生しました！"),
        "infectedPatients": MessageLookupByLibrary.simpleMessage("感染者数"),
        "riskLabel": MessageLookupByLibrary.simpleMessage("危険度（％）"),
        "title": MessageLookupByLibrary.simpleMessage("コロナ危険度チェック")
      };
}
