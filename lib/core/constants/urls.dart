class Urls {
  static Urls get _singletonDebug => Urls._debug();
  static Urls _instance = _singletonDebug;

  factory Urls.init(String prefix) {
    if (prefix == '') {
      _instance = _singletonDebug;
    }
    return _instance;
  }

  static String srv = 'http://62.109.21.134:8080';
  late ModelApi _api;

  static ModelApi get api => Urls._instance._api;

  Urls._debug() {
    _api = listApi();
  }

  ModelApi listApi() {
    return ModelApi(
      /// files
      files: Uri.parse('$srv/files'),

      /// bank
      bank: Uri.parse('$srv/bank'),
    );
  }
}

class ModelApi {
  Uri files;
  Uri bank;

  ModelApi({
    required this.files,
    required this.bank,
  });
}
