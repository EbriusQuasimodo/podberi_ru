sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('Похоже, у вас отсутствует подключение к сети. Давайте перезагрузим страницу?');
}

class PageNotFoundException extends APIException {
  PageNotFoundException() : super('Похоже, эта страница не найдена. Давайте вернемся назад?');
}
class UnknownException extends APIException {
  UnknownException() : super('Похоже, произошла ошибка сервера. Давайте вернемся назад?');
}
class TimeOutException extends APIException {
  TimeOutException() : super('Похоже, превышено время ожидания ответа от сервера. Давайте попробуем еще раз?');
}