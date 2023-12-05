import 'package:flutter/material.dart';

class PromoCodesCompanyFiltersModel {
  final List<PromoCodesAllCompaniesFilters> promoCodesAllCompaniesFilters;

  PromoCodesCompanyFiltersModel({required this.promoCodesAllCompaniesFilters});
}

class PromoCodesAllCompaniesFilters {
  final String companyName;
  final String category;
  final String imagePath;
  final Color color;

  PromoCodesAllCompaniesFilters({
    required this.category,
    required this.color,
    required this.companyName,
    required this.imagePath,
  });
}