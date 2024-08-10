import 'package:core/core.dart';

class PlaceAutocompleteBody extends Equatable {
  const PlaceAutocompleteBody({
    this.input,
    this.types,
    this.sessiontoken,
    this.language,
    this.key,
  });

  final String? input;
  final String? types;
  final String? sessiontoken;
  final String? language;
  final String? key;

  Map<String, dynamic> toMap() {
    return {
      if (input != null) 'input': input,
      if (types != null) 'types': types,
      if (sessiontoken != null) 'sessiontoken': sessiontoken,
      if (language != null) 'language': language,
      if (key != null) 'key': key,
    };
  }

  @override
  List<Object?> get props => [
        input,
        types,
        sessiontoken,
        language,
        key,
      ];
}
