// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_debit_cards_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavoritesDebitCardsDataCollection on Isar {
  IsarCollection<FavoritesDebitCardsData> get favoritesDebitCardsDatas =>
      this.collection();
}

const FavoritesDebitCardsDataSchema = CollectionSchema(
  name: r'FavoritesDebitCardsData',
  id: 7481101158980971534,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    )
  },
  estimateSize: _favoritesDebitCardsDataEstimateSize,
  serialize: _favoritesDebitCardsDataSerialize,
  deserialize: _favoritesDebitCardsDataDeserialize,
  deserializeProp: _favoritesDebitCardsDataDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _favoritesDebitCardsDataGetId,
  getLinks: _favoritesDebitCardsDataGetLinks,
  attach: _favoritesDebitCardsDataAttach,
  version: '3.1.0+1',
);

int _favoritesDebitCardsDataEstimateSize(
  FavoritesDebitCardsData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _favoritesDebitCardsDataSerialize(
  FavoritesDebitCardsData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
}

FavoritesDebitCardsData _favoritesDebitCardsDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoritesDebitCardsData();
  object.id = reader.readStringOrNull(offsets[0]);
  return object;
}

P _favoritesDebitCardsDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoritesDebitCardsDataGetId(FavoritesDebitCardsData object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _favoritesDebitCardsDataGetLinks(
    FavoritesDebitCardsData object) {
  return [];
}

void _favoritesDebitCardsDataAttach(
    IsarCollection<dynamic> col, Id id, FavoritesDebitCardsData object) {}

extension FavoritesDebitCardsDataQueryWhereSort
    on QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QWhere> {
  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavoritesDebitCardsDataQueryWhere on QueryBuilder<
    FavoritesDebitCardsData, FavoritesDebitCardsData, QWhereClause> {
  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavoritesDebitCardsDataQueryFilter on QueryBuilder<
    FavoritesDebitCardsData, FavoritesDebitCardsData, QFilterCondition> {
  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData,
      QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavoritesDebitCardsDataQueryObject on QueryBuilder<
    FavoritesDebitCardsData, FavoritesDebitCardsData, QFilterCondition> {}

extension FavoritesDebitCardsDataQueryLinks on QueryBuilder<
    FavoritesDebitCardsData, FavoritesDebitCardsData, QFilterCondition> {}

extension FavoritesDebitCardsDataQuerySortBy
    on QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QSortBy> {
  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FavoritesDebitCardsDataQuerySortThenBy on QueryBuilder<
    FavoritesDebitCardsData, FavoritesDebitCardsData, QSortThenBy> {
  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension FavoritesDebitCardsDataQueryWhereDistinct on QueryBuilder<
    FavoritesDebitCardsData, FavoritesDebitCardsData, QDistinct> {
  QueryBuilder<FavoritesDebitCardsData, FavoritesDebitCardsData, QDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }
}

extension FavoritesDebitCardsDataQueryProperty on QueryBuilder<
    FavoritesDebitCardsData, FavoritesDebitCardsData, QQueryProperty> {
  QueryBuilder<FavoritesDebitCardsData, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<FavoritesDebitCardsData, String?, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
