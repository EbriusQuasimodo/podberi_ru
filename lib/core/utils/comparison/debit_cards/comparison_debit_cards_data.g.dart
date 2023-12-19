// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison_debit_cards_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetComparisonDebitCardsDataCollection on Isar {
  IsarCollection<ComparisonDebitCardsData> get comparisonDebitCardsDatas =>
      this.collection();
}

const ComparisonDebitCardsDataSchema = CollectionSchema(
  name: r'ComparisonDebitCardsData',
  id: -8458651952731364487,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    )
  },
  estimateSize: _comparisonDebitCardsDataEstimateSize,
  serialize: _comparisonDebitCardsDataSerialize,
  deserialize: _comparisonDebitCardsDataDeserialize,
  deserializeProp: _comparisonDebitCardsDataDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _comparisonDebitCardsDataGetId,
  getLinks: _comparisonDebitCardsDataGetLinks,
  attach: _comparisonDebitCardsDataAttach,
  version: '3.1.0+1',
);

int _comparisonDebitCardsDataEstimateSize(
  ComparisonDebitCardsData object,
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

void _comparisonDebitCardsDataSerialize(
  ComparisonDebitCardsData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
}

ComparisonDebitCardsData _comparisonDebitCardsDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ComparisonDebitCardsData();
  object.id = reader.readStringOrNull(offsets[0]);
  return object;
}

P _comparisonDebitCardsDataDeserializeProp<P>(
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

Id _comparisonDebitCardsDataGetId(ComparisonDebitCardsData object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _comparisonDebitCardsDataGetLinks(
    ComparisonDebitCardsData object) {
  return [];
}

void _comparisonDebitCardsDataAttach(
    IsarCollection<dynamic> col, Id id, ComparisonDebitCardsData object) {}

extension ComparisonDebitCardsDataQueryWhereSort on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QWhere> {
  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ComparisonDebitCardsDataQueryWhere on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QWhereClause> {
  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

extension ComparisonDebitCardsDataQueryFilter on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QFilterCondition> {
  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData,
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

extension ComparisonDebitCardsDataQueryObject on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QFilterCondition> {}

extension ComparisonDebitCardsDataQueryLinks on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QFilterCondition> {}

extension ComparisonDebitCardsDataQuerySortBy on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QSortBy> {
  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ComparisonDebitCardsDataQuerySortThenBy on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QSortThenBy> {
  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension ComparisonDebitCardsDataQueryWhereDistinct on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QDistinct> {
  QueryBuilder<ComparisonDebitCardsData, ComparisonDebitCardsData, QDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }
}

extension ComparisonDebitCardsDataQueryProperty on QueryBuilder<
    ComparisonDebitCardsData, ComparisonDebitCardsData, QQueryProperty> {
  QueryBuilder<ComparisonDebitCardsData, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ComparisonDebitCardsData, String?, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
