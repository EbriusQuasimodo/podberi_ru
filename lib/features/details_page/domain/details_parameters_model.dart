class DetailsParameters  {
  final String id;
  final String productType;
  final String? bankName;
  final String? bankLogoPath;
   DetailsParameters({
     this.bankLogoPath,
     this.bankName,
    required this.id,
    required this.productType,
  });
}