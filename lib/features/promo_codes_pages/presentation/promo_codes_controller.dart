import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/promo_codes_pages/domain/promocodes_category_filters_model.dart';
import 'package:podberi_ru/features/promo_codes_pages/domain/promocodes_company_filters_model.dart';
///промокодов временно не будет ( планируется добавить после релиза мвп)
final promoCodesCategoryStateProvider =
    StateProvider.autoDispose<String>((ref) {
  return '';
});

final selectedCompanyFilterStateProvider =
    StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
final categoryPromoCodesFiltersProvider =
    Provider.autoDispose<PromoCodesCategoryFiltersModel>((ref) {
  return PromoCodesCategoryFiltersModel(promoCodesAllCategories: [
    PromoCodesAllCategoriesFilters(
      category: 'Онлайн-сервисы',
      imagePath: 'assets/images/promo_codes_images/online_services_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Еда и напитки',
      imagePath: 'assets/images/promo_codes_images/food_drinks_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Маркетплейсы',
      imagePath: 'assets/images/promo_codes_images/marketplaces_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Красота и здоровье',
      imagePath: 'assets/images/promo_codes_images/beauty_health_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Путешествия',
      imagePath: 'assets/images/promo_codes_images/travel_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Дом и ремонт',
      imagePath: 'assets/images/promo_codes_images/house_repair_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Спорт',
      imagePath: 'assets/images/promo_codes_images/sport_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Мода',
      imagePath: 'assets/images/promo_codes_images/fashion_image.png',
    ),
    PromoCodesAllCategoriesFilters(
      category: 'Для питомцев',
      imagePath: 'assets/images/promo_codes_images/pets_image.png',
    ),
  ]);
});

final companyFiltersProvider =
    Provider.autoDispose<PromoCodesCompanyFiltersModel>((ref) {
  return PromoCodesCompanyFiltersModel(promoCodesAllCompaniesFilters: [
    PromoCodesAllCompaniesFilters(
        category: 'Онлайн-сервисы',
        color: const Color(0xff222222),
        companyName: 'Кинопоиск',
        imagePath: 'assets/icons/promo_codes_icons/kinopoisk_logo.svg'),
    PromoCodesAllCompaniesFilters(
        category: 'Маркетплейсы',
        color: const Color(0xffFFBE0B),
        companyName: 'Яндекс Маркет',
        imagePath: 'assets/icons/promo_codes_icons/yandex_market_logo.svg'),
    PromoCodesAllCompaniesFilters(
      category: 'Красота и здоровье',
      color: const Color(0xff0A21FF),
      companyName: 'Летуаль',
      imagePath: 'assets/icons/promo_codes_icons/letual_logo.svg',
    ),
    PromoCodesAllCompaniesFilters(
      category: 'Еда и напитки',
      color: const Color(0xffFE3260),
      companyName: 'Самокат',
      imagePath: 'assets/icons/promo_codes_icons/samokat_logo.svg',
    ),
    PromoCodesAllCompaniesFilters(
      category: 'Еда и напитки',
      color: const Color(0xff2DBE64),
      companyName: 'ВкуссВилл',
      imagePath: 'assets/icons/promo_codes_icons/vkusvill_logo.svg',
    ),
    PromoCodesAllCompaniesFilters(
      category: 'Еда и напитки',
      color: const Color(0xffE10815),
      companyName: 'Магнит',
      imagePath: 'assets/icons/promo_codes_icons/magnit_logo.svg',
    ),
    PromoCodesAllCompaniesFilters(
      category: 'Еда и напитки',
      color: const Color(0xffFF5700),
      companyName: 'Много Лосося',
      imagePath: 'assets/icons/promo_codes_icons/mnogo_lososya_logo.svg',
    ),
    PromoCodesAllCompaniesFilters(
        category: 'Еда и напитки',
        color: const Color(0xffF4F3F5),
        companyName: 'Глобус',
        imagePath: 'assets/icons/promo_codes_icons/globus_logo.svg'),
    PromoCodesAllCompaniesFilters(
        category: 'Еда и напитки',
        color: const Color(0xff054146),
        companyName: 'Впрок',
        imagePath: 'assets/icons/promo_codes_icons/vprok_logo.svg'),
  ]);
});
