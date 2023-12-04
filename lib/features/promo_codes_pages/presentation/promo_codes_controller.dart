import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/select_category_promo_codes_page.dart';

final promoCodesCategoryStateProvider =
    StateProvider.autoDispose<String>((ref) {
  return '';
});

final selectedCompanyFilterStateProvider =
StateProvider.autoDispose<List<String>>((ref) {
  return [];
});


final filtersStateProvider =
Provider.autoDispose<PromoCodesFiltersModel>((ref) {
  return PromoCodesFiltersModel(promoCodesAllFilters: [
    PromoCodesAllFilters(
        category: 'Онлайн-сервисы',
        color: Color(0xff222222),
        companyName: 'Кинопоиск',
        imagePath: 'assets/icons/promo_codes_icons/kinopoisk_logo.svg'),
    PromoCodesAllFilters(
        category: 'Маркетплейсы',
        color: Color(0xffFFBE0B),
        companyName: 'Яндекс Маркет',
        imagePath: 'assets/icons/promo_codes_icons/yandex_market_logo.svg'),
    PromoCodesAllFilters(
      category: 'Красота и здоровье',
      color: Color(0xff0A21FF),
      companyName: 'Летуаль',
      imagePath: 'assets/icons/promo_codes_icons/letual_logo.svg',
    ),
    PromoCodesAllFilters(
      category: 'Еда и напитки',
      color: Color(0xffFE3260),
      companyName: 'Самокат',
      imagePath: 'assets/icons/promo_codes_icons/samokat_logo.svg',
    ),
    PromoCodesAllFilters(
      category: 'Еда и напитки',
      color: Color(0xff2DBE64),
      companyName: 'ВкуссВилл',
      imagePath: 'assets/icons/promo_codes_icons/vkusvill_logo.svg',
    ),
    PromoCodesAllFilters(
      category: 'Еда и напитки',
      color: Color(0xffE10815),
      companyName: 'Магнит',
      imagePath: 'assets/icons/promo_codes_icons/magnit_logo.svg',
    ),
    PromoCodesAllFilters(
      category: 'Еда и напитки',
      color: Color(0xffFF5700),
      companyName: 'Много Лосося',
      imagePath: 'assets/icons/promo_codes_icons/mnogo_lososya_logo.svg',
    ),
    PromoCodesAllFilters(
        category: 'Еда и напитки',
        color: Color(0xffF4F3F5),
        companyName: 'Глобус',
        imagePath: 'assets/icons/promo_codes_icons/globus_logo.svg'),
    PromoCodesAllFilters(
        category: 'Еда и напитки',
        color: Color(0xff054146),
        companyName: 'Впрок',
        imagePath: 'assets/icons/promo_codes_icons/vprok_logo.svg'),
  ]);
});
