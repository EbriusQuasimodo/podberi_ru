class RouteConstants {
  ///главная страница
  static const String home = '/home';

  ///страница со списокм всех банков
  static const String allBanks = '/allBanks';

  ///страница выбора типа продукта (дебетовка, кредитка и т.д)
  static const String selectProduct = '/selectProduct';

  ///страница каталога (в нижнем баре ее нет,
  ///но на нее можно попасть через главну, выбор продукта и банки
  static const String catalog = '/catalog';

  ///страница деталей (в нижнем баре ее нет,
  ///но на нее можно попасть через каталог избранное и сравнение
  static const String details = '/details';

  ///страница избранного
  static const String favorites = '/favorites';

  ///страница промокодов
  static const String selectCategoryPromocodes = '/selectCategoryPromocodes';

  ///страница сравнения
  static const String promocodes = '/promocodes';
  ///страница сравнения
  static const String promocodesDetails = '/promocodesDetails';

  ///страница сравнения
  static const String comparison = '/comparison';
}
