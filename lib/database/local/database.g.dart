// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BrandsTable extends Brands with TableInfo<$BrandsTable, Brand> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
    'logo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dnsMeta = const VerificationMeta('dns');
  @override
  late final GeneratedColumn<String> dns = GeneratedColumn<String>(
    'dns',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    website,
    logo,
    notes,
    dns,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'brands';
  @override
  VerificationContext validateIntegrity(
    Insertable<Brand> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    }
    if (data.containsKey('logo')) {
      context.handle(
        _logoMeta,
        logo.isAcceptableOrUnknown(data['logo']!, _logoMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('dns')) {
      context.handle(
        _dnsMeta,
        dns.isAcceptableOrUnknown(data['dns']!, _dnsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Brand map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Brand(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      ),
      logo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      dns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dns'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BrandsTable createAlias(String alias) {
    return $BrandsTable(attachedDatabase, alias);
  }
}

class Brand extends DataClass implements Insertable<Brand> {
  final int id;
  final String name;
  final String? website;
  final String? logo;
  final String? notes;
  final String? dns;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Brand({
    required this.id,
    required this.name,
    this.website,
    this.logo,
    this.notes,
    this.dns,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String>(logo);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || dns != null) {
      map['dns'] = Variable<String>(dns);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BrandsCompanion toCompanion(bool nullToAbsent) {
    return BrandsCompanion(
      id: Value(id),
      name: Value(name),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      dns: dns == null && nullToAbsent ? const Value.absent() : Value(dns),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Brand.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Brand(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      website: serializer.fromJson<String?>(json['website']),
      logo: serializer.fromJson<String?>(json['logo']),
      notes: serializer.fromJson<String?>(json['notes']),
      dns: serializer.fromJson<String?>(json['dns']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'website': serializer.toJson<String?>(website),
      'logo': serializer.toJson<String?>(logo),
      'notes': serializer.toJson<String?>(notes),
      'dns': serializer.toJson<String?>(dns),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Brand copyWith({
    int? id,
    String? name,
    Value<String?> website = const Value.absent(),
    Value<String?> logo = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> dns = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Brand(
    id: id ?? this.id,
    name: name ?? this.name,
    website: website.present ? website.value : this.website,
    logo: logo.present ? logo.value : this.logo,
    notes: notes.present ? notes.value : this.notes,
    dns: dns.present ? dns.value : this.dns,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Brand copyWithCompanion(BrandsCompanion data) {
    return Brand(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      website: data.website.present ? data.website.value : this.website,
      logo: data.logo.present ? data.logo.value : this.logo,
      notes: data.notes.present ? data.notes.value : this.notes,
      dns: data.dns.present ? data.dns.value : this.dns,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Brand(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('website: $website, ')
          ..write('logo: $logo, ')
          ..write('notes: $notes, ')
          ..write('dns: $dns, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, website, logo, notes, dns, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Brand &&
          other.id == this.id &&
          other.name == this.name &&
          other.website == this.website &&
          other.logo == this.logo &&
          other.notes == this.notes &&
          other.dns == this.dns &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BrandsCompanion extends UpdateCompanion<Brand> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> website;
  final Value<String?> logo;
  final Value<String?> notes;
  final Value<String?> dns;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BrandsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.website = const Value.absent(),
    this.logo = const Value.absent(),
    this.notes = const Value.absent(),
    this.dns = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BrandsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.website = const Value.absent(),
    this.logo = const Value.absent(),
    this.notes = const Value.absent(),
    this.dns = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Brand> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? website,
    Expression<String>? logo,
    Expression<String>? notes,
    Expression<String>? dns,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (website != null) 'website': website,
      if (logo != null) 'logo': logo,
      if (notes != null) 'notes': notes,
      if (dns != null) 'dns': dns,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BrandsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? website,
    Value<String?>? logo,
    Value<String?>? notes,
    Value<String?>? dns,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BrandsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      website: website ?? this.website,
      logo: logo ?? this.logo,
      notes: notes ?? this.notes,
      dns: dns ?? this.dns,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (dns.present) {
      map['dns'] = Variable<String>(dns.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrandsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('website: $website, ')
          ..write('logo: $logo, ')
          ..write('notes: $notes, ')
          ..write('dns: $dns, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FirmwareTypesTable extends FirmwareTypes
    with TableInfo<$FirmwareTypesTable, FirmwareType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FirmwareTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'firmware_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<FirmwareType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FirmwareType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FirmwareType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $FirmwareTypesTable createAlias(String alias) {
    return $FirmwareTypesTable(attachedDatabase, alias);
  }
}

class FirmwareType extends DataClass implements Insertable<FirmwareType> {
  final int id;
  final String name;
  const FirmwareType({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  FirmwareTypesCompanion toCompanion(bool nullToAbsent) {
    return FirmwareTypesCompanion(id: Value(id), name: Value(name));
  }

  factory FirmwareType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FirmwareType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  FirmwareType copyWith({int? id, String? name}) =>
      FirmwareType(id: id ?? this.id, name: name ?? this.name);
  FirmwareType copyWithCompanion(FirmwareTypesCompanion data) {
    return FirmwareType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FirmwareType(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FirmwareType && other.id == this.id && other.name == this.name);
}

class FirmwareTypesCompanion extends UpdateCompanion<FirmwareType> {
  final Value<int> id;
  final Value<String> name;
  const FirmwareTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FirmwareTypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<FirmwareType> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FirmwareTypesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return FirmwareTypesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FirmwareTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ProtocolsTable extends Protocols
    with TableInfo<$ProtocolsTable, Protocol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProtocolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'protocols';
  @override
  VerificationContext validateIntegrity(
    Insertable<Protocol> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Protocol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Protocol(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ProtocolsTable createAlias(String alias) {
    return $ProtocolsTable(attachedDatabase, alias);
  }
}

class Protocol extends DataClass implements Insertable<Protocol> {
  final int id;
  final String name;
  final String? description;
  const Protocol({required this.id, required this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ProtocolsCompanion toCompanion(bool nullToAbsent) {
    return ProtocolsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Protocol.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Protocol(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  Protocol copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => Protocol(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  Protocol copyWithCompanion(ProtocolsCompanion data) {
    return Protocol(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Protocol(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Protocol &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class ProtocolsCompanion extends UpdateCompanion<Protocol> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  const ProtocolsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  ProtocolsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Protocol> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  ProtocolsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
  }) {
    return ProtocolsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProtocolsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $AuthenticationMethodsTable extends AuthenticationMethods
    with TableInfo<$AuthenticationMethodsTable, AuthenticationMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthenticationMethodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordEncodingMeta = const VerificationMeta(
    'passwordEncoding',
  );
  @override
  late final GeneratedColumn<String> passwordEncoding = GeneratedColumn<String>(
    'password_encoding',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requiresNonceMeta = const VerificationMeta(
    'requiresNonce',
  );
  @override
  late final GeneratedColumn<bool> requiresNonce = GeneratedColumn<bool>(
    'requires_nonce',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("requires_nonce" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _requiresCsrfMeta = const VerificationMeta(
    'requiresCsrf',
  );
  @override
  late final GeneratedColumn<bool> requiresCsrf = GeneratedColumn<bool>(
    'requires_csrf',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("requires_csrf" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    passwordEncoding,
    requiresNonce,
    requiresCsrf,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authentication_methods';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthenticationMethod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('password_encoding')) {
      context.handle(
        _passwordEncodingMeta,
        passwordEncoding.isAcceptableOrUnknown(
          data['password_encoding']!,
          _passwordEncodingMeta,
        ),
      );
    }
    if (data.containsKey('requires_nonce')) {
      context.handle(
        _requiresNonceMeta,
        requiresNonce.isAcceptableOrUnknown(
          data['requires_nonce']!,
          _requiresNonceMeta,
        ),
      );
    }
    if (data.containsKey('requires_csrf')) {
      context.handle(
        _requiresCsrfMeta,
        requiresCsrf.isAcceptableOrUnknown(
          data['requires_csrf']!,
          _requiresCsrfMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthenticationMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthenticationMethod(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      passwordEncoding: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_encoding'],
      ),
      requiresNonce: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}requires_nonce'],
      )!,
      requiresCsrf: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}requires_csrf'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $AuthenticationMethodsTable createAlias(String alias) {
    return $AuthenticationMethodsTable(attachedDatabase, alias);
  }
}

class AuthenticationMethod extends DataClass
    implements Insertable<AuthenticationMethod> {
  final int id;
  final String name;
  final String? passwordEncoding;
  final bool requiresNonce;
  final bool requiresCsrf;
  final String? notes;
  const AuthenticationMethod({
    required this.id,
    required this.name,
    this.passwordEncoding,
    required this.requiresNonce,
    required this.requiresCsrf,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || passwordEncoding != null) {
      map['password_encoding'] = Variable<String>(passwordEncoding);
    }
    map['requires_nonce'] = Variable<bool>(requiresNonce);
    map['requires_csrf'] = Variable<bool>(requiresCsrf);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  AuthenticationMethodsCompanion toCompanion(bool nullToAbsent) {
    return AuthenticationMethodsCompanion(
      id: Value(id),
      name: Value(name),
      passwordEncoding: passwordEncoding == null && nullToAbsent
          ? const Value.absent()
          : Value(passwordEncoding),
      requiresNonce: Value(requiresNonce),
      requiresCsrf: Value(requiresCsrf),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory AuthenticationMethod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthenticationMethod(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      passwordEncoding: serializer.fromJson<String?>(json['passwordEncoding']),
      requiresNonce: serializer.fromJson<bool>(json['requiresNonce']),
      requiresCsrf: serializer.fromJson<bool>(json['requiresCsrf']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'passwordEncoding': serializer.toJson<String?>(passwordEncoding),
      'requiresNonce': serializer.toJson<bool>(requiresNonce),
      'requiresCsrf': serializer.toJson<bool>(requiresCsrf),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  AuthenticationMethod copyWith({
    int? id,
    String? name,
    Value<String?> passwordEncoding = const Value.absent(),
    bool? requiresNonce,
    bool? requiresCsrf,
    Value<String?> notes = const Value.absent(),
  }) => AuthenticationMethod(
    id: id ?? this.id,
    name: name ?? this.name,
    passwordEncoding: passwordEncoding.present
        ? passwordEncoding.value
        : this.passwordEncoding,
    requiresNonce: requiresNonce ?? this.requiresNonce,
    requiresCsrf: requiresCsrf ?? this.requiresCsrf,
    notes: notes.present ? notes.value : this.notes,
  );
  AuthenticationMethod copyWithCompanion(AuthenticationMethodsCompanion data) {
    return AuthenticationMethod(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      passwordEncoding: data.passwordEncoding.present
          ? data.passwordEncoding.value
          : this.passwordEncoding,
      requiresNonce: data.requiresNonce.present
          ? data.requiresNonce.value
          : this.requiresNonce,
      requiresCsrf: data.requiresCsrf.present
          ? data.requiresCsrf.value
          : this.requiresCsrf,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationMethod(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('passwordEncoding: $passwordEncoding, ')
          ..write('requiresNonce: $requiresNonce, ')
          ..write('requiresCsrf: $requiresCsrf, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    passwordEncoding,
    requiresNonce,
    requiresCsrf,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthenticationMethod &&
          other.id == this.id &&
          other.name == this.name &&
          other.passwordEncoding == this.passwordEncoding &&
          other.requiresNonce == this.requiresNonce &&
          other.requiresCsrf == this.requiresCsrf &&
          other.notes == this.notes);
}

class AuthenticationMethodsCompanion
    extends UpdateCompanion<AuthenticationMethod> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> passwordEncoding;
  final Value<bool> requiresNonce;
  final Value<bool> requiresCsrf;
  final Value<String?> notes;
  const AuthenticationMethodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.passwordEncoding = const Value.absent(),
    this.requiresNonce = const Value.absent(),
    this.requiresCsrf = const Value.absent(),
    this.notes = const Value.absent(),
  });
  AuthenticationMethodsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.passwordEncoding = const Value.absent(),
    this.requiresNonce = const Value.absent(),
    this.requiresCsrf = const Value.absent(),
    this.notes = const Value.absent(),
  }) : name = Value(name);
  static Insertable<AuthenticationMethod> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? passwordEncoding,
    Expression<bool>? requiresNonce,
    Expression<bool>? requiresCsrf,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (passwordEncoding != null) 'password_encoding': passwordEncoding,
      if (requiresNonce != null) 'requires_nonce': requiresNonce,
      if (requiresCsrf != null) 'requires_csrf': requiresCsrf,
      if (notes != null) 'notes': notes,
    });
  }

  AuthenticationMethodsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? passwordEncoding,
    Value<bool>? requiresNonce,
    Value<bool>? requiresCsrf,
    Value<String?>? notes,
  }) {
    return AuthenticationMethodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      passwordEncoding: passwordEncoding ?? this.passwordEncoding,
      requiresNonce: requiresNonce ?? this.requiresNonce,
      requiresCsrf: requiresCsrf ?? this.requiresCsrf,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (passwordEncoding.present) {
      map['password_encoding'] = Variable<String>(passwordEncoding.value);
    }
    if (requiresNonce.present) {
      map['requires_nonce'] = Variable<bool>(requiresNonce.value);
    }
    if (requiresCsrf.present) {
      map['requires_csrf'] = Variable<bool>(requiresCsrf.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationMethodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('passwordEncoding: $passwordEncoding, ')
          ..write('requiresNonce: $requiresNonce, ')
          ..write('requiresCsrf: $requiresCsrf, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $DriversTable extends Drivers with TableInfo<$DriversTable, Driver> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriversTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _driverClassMeta = const VerificationMeta(
    'driverClass',
  );
  @override
  late final GeneratedColumn<String> driverClass = GeneratedColumn<String>(
    'driver_class',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, driverClass, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drivers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Driver> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('driver_class')) {
      context.handle(
        _driverClassMeta,
        driverClass.isAcceptableOrUnknown(
          data['driver_class']!,
          _driverClassMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_driverClassMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Driver map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Driver(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      driverClass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}driver_class'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $DriversTable createAlias(String alias) {
    return $DriversTable(attachedDatabase, alias);
  }
}

class Driver extends DataClass implements Insertable<Driver> {
  final int id;
  final String name;
  final String driverClass;
  final String? notes;
  const Driver({
    required this.id,
    required this.name,
    required this.driverClass,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['driver_class'] = Variable<String>(driverClass);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  DriversCompanion toCompanion(bool nullToAbsent) {
    return DriversCompanion(
      id: Value(id),
      name: Value(name),
      driverClass: Value(driverClass),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Driver.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Driver(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      driverClass: serializer.fromJson<String>(json['driverClass']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'driverClass': serializer.toJson<String>(driverClass),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Driver copyWith({
    int? id,
    String? name,
    String? driverClass,
    Value<String?> notes = const Value.absent(),
  }) => Driver(
    id: id ?? this.id,
    name: name ?? this.name,
    driverClass: driverClass ?? this.driverClass,
    notes: notes.present ? notes.value : this.notes,
  );
  Driver copyWithCompanion(DriversCompanion data) {
    return Driver(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      driverClass: data.driverClass.present
          ? data.driverClass.value
          : this.driverClass,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Driver(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('driverClass: $driverClass, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, driverClass, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Driver &&
          other.id == this.id &&
          other.name == this.name &&
          other.driverClass == this.driverClass &&
          other.notes == this.notes);
}

class DriversCompanion extends UpdateCompanion<Driver> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> driverClass;
  final Value<String?> notes;
  const DriversCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.driverClass = const Value.absent(),
    this.notes = const Value.absent(),
  });
  DriversCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String driverClass,
    this.notes = const Value.absent(),
  }) : name = Value(name),
       driverClass = Value(driverClass);
  static Insertable<Driver> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? driverClass,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (driverClass != null) 'driver_class': driverClass,
      if (notes != null) 'notes': notes,
    });
  }

  DriversCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? driverClass,
    Value<String?>? notes,
  }) {
    return DriversCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      driverClass: driverClass ?? this.driverClass,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (driverClass.present) {
      map['driver_class'] = Variable<String>(driverClass.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriversCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('driverClass: $driverClass, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $ApiProfilesTable extends ApiProfiles
    with TableInfo<$ApiProfilesTable, ApiProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApiProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _authenticationIdMeta = const VerificationMeta(
    'authenticationId',
  );
  @override
  late final GeneratedColumn<int> authenticationId = GeneratedColumn<int>(
    'authentication_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES authentication_methods (id)',
    ),
  );
  static const VerificationMeta _transportMeta = const VerificationMeta(
    'transport',
  );
  @override
  late final GeneratedColumn<String> transport = GeneratedColumn<String>(
    'transport',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultPortMeta = const VerificationMeta(
    'defaultPort',
  );
  @override
  late final GeneratedColumn<int> defaultPort = GeneratedColumn<int>(
    'default_port',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _baseUrlMeta = const VerificationMeta(
    'baseUrl',
  );
  @override
  late final GeneratedColumn<String> baseUrl = GeneratedColumn<String>(
    'base_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _basePathMeta = const VerificationMeta(
    'basePath',
  );
  @override
  late final GeneratedColumn<String> basePath = GeneratedColumn<String>(
    'base_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loginEndpointMeta = const VerificationMeta(
    'loginEndpoint',
  );
  @override
  late final GeneratedColumn<String> loginEndpoint = GeneratedColumn<String>(
    'login_endpoint',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoutEndpointMeta = const VerificationMeta(
    'logoutEndpoint',
  );
  @override
  late final GeneratedColumn<String> logoutEndpoint = GeneratedColumn<String>(
    'logout_endpoint',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _csrfEnabledMeta = const VerificationMeta(
    'csrfEnabled',
  );
  @override
  late final GeneratedColumn<bool> csrfEnabled = GeneratedColumn<bool>(
    'csrf_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("csrf_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cookieNameMeta = const VerificationMeta(
    'cookieName',
  );
  @override
  late final GeneratedColumn<String> cookieName = GeneratedColumn<String>(
    'cookie_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionHeaderMeta = const VerificationMeta(
    'sessionHeader',
  );
  @override
  late final GeneratedColumn<String> sessionHeader = GeneratedColumn<String>(
    'session_header',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultDriverIdMeta = const VerificationMeta(
    'defaultDriverId',
  );
  @override
  late final GeneratedColumn<int> defaultDriverId = GeneratedColumn<int>(
    'default_driver_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES drivers (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    protocolId,
    authenticationId,
    transport,
    defaultPort,
    baseUrl,
    basePath,
    loginEndpoint,
    logoutEndpoint,
    csrfEnabled,
    cookieName,
    sessionHeader,
    defaultDriverId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'api_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<ApiProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('authentication_id')) {
      context.handle(
        _authenticationIdMeta,
        authenticationId.isAcceptableOrUnknown(
          data['authentication_id']!,
          _authenticationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_authenticationIdMeta);
    }
    if (data.containsKey('transport')) {
      context.handle(
        _transportMeta,
        transport.isAcceptableOrUnknown(data['transport']!, _transportMeta),
      );
    }
    if (data.containsKey('default_port')) {
      context.handle(
        _defaultPortMeta,
        defaultPort.isAcceptableOrUnknown(
          data['default_port']!,
          _defaultPortMeta,
        ),
      );
    }
    if (data.containsKey('base_url')) {
      context.handle(
        _baseUrlMeta,
        baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta),
      );
    }
    if (data.containsKey('base_path')) {
      context.handle(
        _basePathMeta,
        basePath.isAcceptableOrUnknown(data['base_path']!, _basePathMeta),
      );
    }
    if (data.containsKey('login_endpoint')) {
      context.handle(
        _loginEndpointMeta,
        loginEndpoint.isAcceptableOrUnknown(
          data['login_endpoint']!,
          _loginEndpointMeta,
        ),
      );
    }
    if (data.containsKey('logout_endpoint')) {
      context.handle(
        _logoutEndpointMeta,
        logoutEndpoint.isAcceptableOrUnknown(
          data['logout_endpoint']!,
          _logoutEndpointMeta,
        ),
      );
    }
    if (data.containsKey('csrf_enabled')) {
      context.handle(
        _csrfEnabledMeta,
        csrfEnabled.isAcceptableOrUnknown(
          data['csrf_enabled']!,
          _csrfEnabledMeta,
        ),
      );
    }
    if (data.containsKey('cookie_name')) {
      context.handle(
        _cookieNameMeta,
        cookieName.isAcceptableOrUnknown(data['cookie_name']!, _cookieNameMeta),
      );
    }
    if (data.containsKey('session_header')) {
      context.handle(
        _sessionHeaderMeta,
        sessionHeader.isAcceptableOrUnknown(
          data['session_header']!,
          _sessionHeaderMeta,
        ),
      );
    }
    if (data.containsKey('default_driver_id')) {
      context.handle(
        _defaultDriverIdMeta,
        defaultDriverId.isAcceptableOrUnknown(
          data['default_driver_id']!,
          _defaultDriverIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ApiProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ApiProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protocol_id'],
      )!,
      authenticationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}authentication_id'],
      )!,
      transport: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transport'],
      ),
      defaultPort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_port'],
      ),
      baseUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_url'],
      ),
      basePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_path'],
      ),
      loginEndpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login_endpoint'],
      ),
      logoutEndpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logout_endpoint'],
      ),
      csrfEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}csrf_enabled'],
      )!,
      cookieName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cookie_name'],
      ),
      sessionHeader: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_header'],
      ),
      defaultDriverId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_driver_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ApiProfilesTable createAlias(String alias) {
    return $ApiProfilesTable(attachedDatabase, alias);
  }
}

class ApiProfile extends DataClass implements Insertable<ApiProfile> {
  final int id;
  final String name;
  final int protocolId;
  final int authenticationId;
  final String? transport;
  final int? defaultPort;
  final String? baseUrl;
  final String? basePath;
  final String? loginEndpoint;
  final String? logoutEndpoint;
  final bool csrfEnabled;
  final String? cookieName;
  final String? sessionHeader;
  final int? defaultDriverId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ApiProfile({
    required this.id,
    required this.name,
    required this.protocolId,
    required this.authenticationId,
    this.transport,
    this.defaultPort,
    this.baseUrl,
    this.basePath,
    this.loginEndpoint,
    this.logoutEndpoint,
    required this.csrfEnabled,
    this.cookieName,
    this.sessionHeader,
    this.defaultDriverId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['protocol_id'] = Variable<int>(protocolId);
    map['authentication_id'] = Variable<int>(authenticationId);
    if (!nullToAbsent || transport != null) {
      map['transport'] = Variable<String>(transport);
    }
    if (!nullToAbsent || defaultPort != null) {
      map['default_port'] = Variable<int>(defaultPort);
    }
    if (!nullToAbsent || baseUrl != null) {
      map['base_url'] = Variable<String>(baseUrl);
    }
    if (!nullToAbsent || basePath != null) {
      map['base_path'] = Variable<String>(basePath);
    }
    if (!nullToAbsent || loginEndpoint != null) {
      map['login_endpoint'] = Variable<String>(loginEndpoint);
    }
    if (!nullToAbsent || logoutEndpoint != null) {
      map['logout_endpoint'] = Variable<String>(logoutEndpoint);
    }
    map['csrf_enabled'] = Variable<bool>(csrfEnabled);
    if (!nullToAbsent || cookieName != null) {
      map['cookie_name'] = Variable<String>(cookieName);
    }
    if (!nullToAbsent || sessionHeader != null) {
      map['session_header'] = Variable<String>(sessionHeader);
    }
    if (!nullToAbsent || defaultDriverId != null) {
      map['default_driver_id'] = Variable<int>(defaultDriverId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ApiProfilesCompanion toCompanion(bool nullToAbsent) {
    return ApiProfilesCompanion(
      id: Value(id),
      name: Value(name),
      protocolId: Value(protocolId),
      authenticationId: Value(authenticationId),
      transport: transport == null && nullToAbsent
          ? const Value.absent()
          : Value(transport),
      defaultPort: defaultPort == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultPort),
      baseUrl: baseUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(baseUrl),
      basePath: basePath == null && nullToAbsent
          ? const Value.absent()
          : Value(basePath),
      loginEndpoint: loginEndpoint == null && nullToAbsent
          ? const Value.absent()
          : Value(loginEndpoint),
      logoutEndpoint: logoutEndpoint == null && nullToAbsent
          ? const Value.absent()
          : Value(logoutEndpoint),
      csrfEnabled: Value(csrfEnabled),
      cookieName: cookieName == null && nullToAbsent
          ? const Value.absent()
          : Value(cookieName),
      sessionHeader: sessionHeader == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionHeader),
      defaultDriverId: defaultDriverId == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultDriverId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ApiProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ApiProfile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      protocolId: serializer.fromJson<int>(json['protocolId']),
      authenticationId: serializer.fromJson<int>(json['authenticationId']),
      transport: serializer.fromJson<String?>(json['transport']),
      defaultPort: serializer.fromJson<int?>(json['defaultPort']),
      baseUrl: serializer.fromJson<String?>(json['baseUrl']),
      basePath: serializer.fromJson<String?>(json['basePath']),
      loginEndpoint: serializer.fromJson<String?>(json['loginEndpoint']),
      logoutEndpoint: serializer.fromJson<String?>(json['logoutEndpoint']),
      csrfEnabled: serializer.fromJson<bool>(json['csrfEnabled']),
      cookieName: serializer.fromJson<String?>(json['cookieName']),
      sessionHeader: serializer.fromJson<String?>(json['sessionHeader']),
      defaultDriverId: serializer.fromJson<int?>(json['defaultDriverId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'protocolId': serializer.toJson<int>(protocolId),
      'authenticationId': serializer.toJson<int>(authenticationId),
      'transport': serializer.toJson<String?>(transport),
      'defaultPort': serializer.toJson<int?>(defaultPort),
      'baseUrl': serializer.toJson<String?>(baseUrl),
      'basePath': serializer.toJson<String?>(basePath),
      'loginEndpoint': serializer.toJson<String?>(loginEndpoint),
      'logoutEndpoint': serializer.toJson<String?>(logoutEndpoint),
      'csrfEnabled': serializer.toJson<bool>(csrfEnabled),
      'cookieName': serializer.toJson<String?>(cookieName),
      'sessionHeader': serializer.toJson<String?>(sessionHeader),
      'defaultDriverId': serializer.toJson<int?>(defaultDriverId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ApiProfile copyWith({
    int? id,
    String? name,
    int? protocolId,
    int? authenticationId,
    Value<String?> transport = const Value.absent(),
    Value<int?> defaultPort = const Value.absent(),
    Value<String?> baseUrl = const Value.absent(),
    Value<String?> basePath = const Value.absent(),
    Value<String?> loginEndpoint = const Value.absent(),
    Value<String?> logoutEndpoint = const Value.absent(),
    bool? csrfEnabled,
    Value<String?> cookieName = const Value.absent(),
    Value<String?> sessionHeader = const Value.absent(),
    Value<int?> defaultDriverId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ApiProfile(
    id: id ?? this.id,
    name: name ?? this.name,
    protocolId: protocolId ?? this.protocolId,
    authenticationId: authenticationId ?? this.authenticationId,
    transport: transport.present ? transport.value : this.transport,
    defaultPort: defaultPort.present ? defaultPort.value : this.defaultPort,
    baseUrl: baseUrl.present ? baseUrl.value : this.baseUrl,
    basePath: basePath.present ? basePath.value : this.basePath,
    loginEndpoint: loginEndpoint.present
        ? loginEndpoint.value
        : this.loginEndpoint,
    logoutEndpoint: logoutEndpoint.present
        ? logoutEndpoint.value
        : this.logoutEndpoint,
    csrfEnabled: csrfEnabled ?? this.csrfEnabled,
    cookieName: cookieName.present ? cookieName.value : this.cookieName,
    sessionHeader: sessionHeader.present
        ? sessionHeader.value
        : this.sessionHeader,
    defaultDriverId: defaultDriverId.present
        ? defaultDriverId.value
        : this.defaultDriverId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ApiProfile copyWithCompanion(ApiProfilesCompanion data) {
    return ApiProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      authenticationId: data.authenticationId.present
          ? data.authenticationId.value
          : this.authenticationId,
      transport: data.transport.present ? data.transport.value : this.transport,
      defaultPort: data.defaultPort.present
          ? data.defaultPort.value
          : this.defaultPort,
      baseUrl: data.baseUrl.present ? data.baseUrl.value : this.baseUrl,
      basePath: data.basePath.present ? data.basePath.value : this.basePath,
      loginEndpoint: data.loginEndpoint.present
          ? data.loginEndpoint.value
          : this.loginEndpoint,
      logoutEndpoint: data.logoutEndpoint.present
          ? data.logoutEndpoint.value
          : this.logoutEndpoint,
      csrfEnabled: data.csrfEnabled.present
          ? data.csrfEnabled.value
          : this.csrfEnabled,
      cookieName: data.cookieName.present
          ? data.cookieName.value
          : this.cookieName,
      sessionHeader: data.sessionHeader.present
          ? data.sessionHeader.value
          : this.sessionHeader,
      defaultDriverId: data.defaultDriverId.present
          ? data.defaultDriverId.value
          : this.defaultDriverId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ApiProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('protocolId: $protocolId, ')
          ..write('authenticationId: $authenticationId, ')
          ..write('transport: $transport, ')
          ..write('defaultPort: $defaultPort, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('basePath: $basePath, ')
          ..write('loginEndpoint: $loginEndpoint, ')
          ..write('logoutEndpoint: $logoutEndpoint, ')
          ..write('csrfEnabled: $csrfEnabled, ')
          ..write('cookieName: $cookieName, ')
          ..write('sessionHeader: $sessionHeader, ')
          ..write('defaultDriverId: $defaultDriverId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    protocolId,
    authenticationId,
    transport,
    defaultPort,
    baseUrl,
    basePath,
    loginEndpoint,
    logoutEndpoint,
    csrfEnabled,
    cookieName,
    sessionHeader,
    defaultDriverId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApiProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.protocolId == this.protocolId &&
          other.authenticationId == this.authenticationId &&
          other.transport == this.transport &&
          other.defaultPort == this.defaultPort &&
          other.baseUrl == this.baseUrl &&
          other.basePath == this.basePath &&
          other.loginEndpoint == this.loginEndpoint &&
          other.logoutEndpoint == this.logoutEndpoint &&
          other.csrfEnabled == this.csrfEnabled &&
          other.cookieName == this.cookieName &&
          other.sessionHeader == this.sessionHeader &&
          other.defaultDriverId == this.defaultDriverId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ApiProfilesCompanion extends UpdateCompanion<ApiProfile> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> protocolId;
  final Value<int> authenticationId;
  final Value<String?> transport;
  final Value<int?> defaultPort;
  final Value<String?> baseUrl;
  final Value<String?> basePath;
  final Value<String?> loginEndpoint;
  final Value<String?> logoutEndpoint;
  final Value<bool> csrfEnabled;
  final Value<String?> cookieName;
  final Value<String?> sessionHeader;
  final Value<int?> defaultDriverId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ApiProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.authenticationId = const Value.absent(),
    this.transport = const Value.absent(),
    this.defaultPort = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.basePath = const Value.absent(),
    this.loginEndpoint = const Value.absent(),
    this.logoutEndpoint = const Value.absent(),
    this.csrfEnabled = const Value.absent(),
    this.cookieName = const Value.absent(),
    this.sessionHeader = const Value.absent(),
    this.defaultDriverId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ApiProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int protocolId,
    required int authenticationId,
    this.transport = const Value.absent(),
    this.defaultPort = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.basePath = const Value.absent(),
    this.loginEndpoint = const Value.absent(),
    this.logoutEndpoint = const Value.absent(),
    this.csrfEnabled = const Value.absent(),
    this.cookieName = const Value.absent(),
    this.sessionHeader = const Value.absent(),
    this.defaultDriverId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       protocolId = Value(protocolId),
       authenticationId = Value(authenticationId);
  static Insertable<ApiProfile> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? protocolId,
    Expression<int>? authenticationId,
    Expression<String>? transport,
    Expression<int>? defaultPort,
    Expression<String>? baseUrl,
    Expression<String>? basePath,
    Expression<String>? loginEndpoint,
    Expression<String>? logoutEndpoint,
    Expression<bool>? csrfEnabled,
    Expression<String>? cookieName,
    Expression<String>? sessionHeader,
    Expression<int>? defaultDriverId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (protocolId != null) 'protocol_id': protocolId,
      if (authenticationId != null) 'authentication_id': authenticationId,
      if (transport != null) 'transport': transport,
      if (defaultPort != null) 'default_port': defaultPort,
      if (baseUrl != null) 'base_url': baseUrl,
      if (basePath != null) 'base_path': basePath,
      if (loginEndpoint != null) 'login_endpoint': loginEndpoint,
      if (logoutEndpoint != null) 'logout_endpoint': logoutEndpoint,
      if (csrfEnabled != null) 'csrf_enabled': csrfEnabled,
      if (cookieName != null) 'cookie_name': cookieName,
      if (sessionHeader != null) 'session_header': sessionHeader,
      if (defaultDriverId != null) 'default_driver_id': defaultDriverId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ApiProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? protocolId,
    Value<int>? authenticationId,
    Value<String?>? transport,
    Value<int?>? defaultPort,
    Value<String?>? baseUrl,
    Value<String?>? basePath,
    Value<String?>? loginEndpoint,
    Value<String?>? logoutEndpoint,
    Value<bool>? csrfEnabled,
    Value<String?>? cookieName,
    Value<String?>? sessionHeader,
    Value<int?>? defaultDriverId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ApiProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      protocolId: protocolId ?? this.protocolId,
      authenticationId: authenticationId ?? this.authenticationId,
      transport: transport ?? this.transport,
      defaultPort: defaultPort ?? this.defaultPort,
      baseUrl: baseUrl ?? this.baseUrl,
      basePath: basePath ?? this.basePath,
      loginEndpoint: loginEndpoint ?? this.loginEndpoint,
      logoutEndpoint: logoutEndpoint ?? this.logoutEndpoint,
      csrfEnabled: csrfEnabled ?? this.csrfEnabled,
      cookieName: cookieName ?? this.cookieName,
      sessionHeader: sessionHeader ?? this.sessionHeader,
      defaultDriverId: defaultDriverId ?? this.defaultDriverId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (authenticationId.present) {
      map['authentication_id'] = Variable<int>(authenticationId.value);
    }
    if (transport.present) {
      map['transport'] = Variable<String>(transport.value);
    }
    if (defaultPort.present) {
      map['default_port'] = Variable<int>(defaultPort.value);
    }
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
    }
    if (basePath.present) {
      map['base_path'] = Variable<String>(basePath.value);
    }
    if (loginEndpoint.present) {
      map['login_endpoint'] = Variable<String>(loginEndpoint.value);
    }
    if (logoutEndpoint.present) {
      map['logout_endpoint'] = Variable<String>(logoutEndpoint.value);
    }
    if (csrfEnabled.present) {
      map['csrf_enabled'] = Variable<bool>(csrfEnabled.value);
    }
    if (cookieName.present) {
      map['cookie_name'] = Variable<String>(cookieName.value);
    }
    if (sessionHeader.present) {
      map['session_header'] = Variable<String>(sessionHeader.value);
    }
    if (defaultDriverId.present) {
      map['default_driver_id'] = Variable<int>(defaultDriverId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApiProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('protocolId: $protocolId, ')
          ..write('authenticationId: $authenticationId, ')
          ..write('transport: $transport, ')
          ..write('defaultPort: $defaultPort, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('basePath: $basePath, ')
          ..write('loginEndpoint: $loginEndpoint, ')
          ..write('logoutEndpoint: $logoutEndpoint, ')
          ..write('csrfEnabled: $csrfEnabled, ')
          ..write('cookieName: $cookieName, ')
          ..write('sessionHeader: $sessionHeader, ')
          ..write('defaultDriverId: $defaultDriverId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FirmwaresTable extends Firmwares
    with TableInfo<$FirmwaresTable, Firmware> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FirmwaresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _brandIdMeta = const VerificationMeta(
    'brandId',
  );
  @override
  late final GeneratedColumn<int> brandId = GeneratedColumn<int>(
    'brand_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES brands (id)',
    ),
  );
  static const VerificationMeta _firmwareTypeIdMeta = const VerificationMeta(
    'firmwareTypeId',
  );
  @override
  late final GeneratedColumn<int> firmwareTypeId = GeneratedColumn<int>(
    'firmware_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES firmware_types (id)',
    ),
  );
  static const VerificationMeta _apiProfileIdMeta = const VerificationMeta(
    'apiProfileId',
  );
  @override
  late final GeneratedColumn<int> apiProfileId = GeneratedColumn<int>(
    'api_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES api_profiles (id)',
    ),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brandId,
    firmwareTypeId,
    apiProfileId,
    version,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'firmwares';
  @override
  VerificationContext validateIntegrity(
    Insertable<Firmware> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('brand_id')) {
      context.handle(
        _brandIdMeta,
        brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta),
      );
    } else if (isInserting) {
      context.missing(_brandIdMeta);
    }
    if (data.containsKey('firmware_type_id')) {
      context.handle(
        _firmwareTypeIdMeta,
        firmwareTypeId.isAcceptableOrUnknown(
          data['firmware_type_id']!,
          _firmwareTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firmwareTypeIdMeta);
    }
    if (data.containsKey('api_profile_id')) {
      context.handle(
        _apiProfileIdMeta,
        apiProfileId.isAcceptableOrUnknown(
          data['api_profile_id']!,
          _apiProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_apiProfileIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {brandId, firmwareTypeId, version},
  ];
  @override
  Firmware map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Firmware(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      brandId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}brand_id'],
      )!,
      firmwareTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}firmware_type_id'],
      )!,
      apiProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_profile_id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      )!,
    );
  }

  @override
  $FirmwaresTable createAlias(String alias) {
    return $FirmwaresTable(attachedDatabase, alias);
  }
}

class Firmware extends DataClass implements Insertable<Firmware> {
  final int id;
  final int brandId;
  final int firmwareTypeId;
  final int apiProfileId;
  final String version;
  const Firmware({
    required this.id,
    required this.brandId,
    required this.firmwareTypeId,
    required this.apiProfileId,
    required this.version,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['brand_id'] = Variable<int>(brandId);
    map['firmware_type_id'] = Variable<int>(firmwareTypeId);
    map['api_profile_id'] = Variable<int>(apiProfileId);
    map['version'] = Variable<String>(version);
    return map;
  }

  FirmwaresCompanion toCompanion(bool nullToAbsent) {
    return FirmwaresCompanion(
      id: Value(id),
      brandId: Value(brandId),
      firmwareTypeId: Value(firmwareTypeId),
      apiProfileId: Value(apiProfileId),
      version: Value(version),
    );
  }

  factory Firmware.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Firmware(
      id: serializer.fromJson<int>(json['id']),
      brandId: serializer.fromJson<int>(json['brandId']),
      firmwareTypeId: serializer.fromJson<int>(json['firmwareTypeId']),
      apiProfileId: serializer.fromJson<int>(json['apiProfileId']),
      version: serializer.fromJson<String>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'brandId': serializer.toJson<int>(brandId),
      'firmwareTypeId': serializer.toJson<int>(firmwareTypeId),
      'apiProfileId': serializer.toJson<int>(apiProfileId),
      'version': serializer.toJson<String>(version),
    };
  }

  Firmware copyWith({
    int? id,
    int? brandId,
    int? firmwareTypeId,
    int? apiProfileId,
    String? version,
  }) => Firmware(
    id: id ?? this.id,
    brandId: brandId ?? this.brandId,
    firmwareTypeId: firmwareTypeId ?? this.firmwareTypeId,
    apiProfileId: apiProfileId ?? this.apiProfileId,
    version: version ?? this.version,
  );
  Firmware copyWithCompanion(FirmwaresCompanion data) {
    return Firmware(
      id: data.id.present ? data.id.value : this.id,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      firmwareTypeId: data.firmwareTypeId.present
          ? data.firmwareTypeId.value
          : this.firmwareTypeId,
      apiProfileId: data.apiProfileId.present
          ? data.apiProfileId.value
          : this.apiProfileId,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Firmware(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('firmwareTypeId: $firmwareTypeId, ')
          ..write('apiProfileId: $apiProfileId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, brandId, firmwareTypeId, apiProfileId, version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Firmware &&
          other.id == this.id &&
          other.brandId == this.brandId &&
          other.firmwareTypeId == this.firmwareTypeId &&
          other.apiProfileId == this.apiProfileId &&
          other.version == this.version);
}

class FirmwaresCompanion extends UpdateCompanion<Firmware> {
  final Value<int> id;
  final Value<int> brandId;
  final Value<int> firmwareTypeId;
  final Value<int> apiProfileId;
  final Value<String> version;
  const FirmwaresCompanion({
    this.id = const Value.absent(),
    this.brandId = const Value.absent(),
    this.firmwareTypeId = const Value.absent(),
    this.apiProfileId = const Value.absent(),
    this.version = const Value.absent(),
  });
  FirmwaresCompanion.insert({
    this.id = const Value.absent(),
    required int brandId,
    required int firmwareTypeId,
    required int apiProfileId,
    required String version,
  }) : brandId = Value(brandId),
       firmwareTypeId = Value(firmwareTypeId),
       apiProfileId = Value(apiProfileId),
       version = Value(version);
  static Insertable<Firmware> custom({
    Expression<int>? id,
    Expression<int>? brandId,
    Expression<int>? firmwareTypeId,
    Expression<int>? apiProfileId,
    Expression<String>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brandId != null) 'brand_id': brandId,
      if (firmwareTypeId != null) 'firmware_type_id': firmwareTypeId,
      if (apiProfileId != null) 'api_profile_id': apiProfileId,
      if (version != null) 'version': version,
    });
  }

  FirmwaresCompanion copyWith({
    Value<int>? id,
    Value<int>? brandId,
    Value<int>? firmwareTypeId,
    Value<int>? apiProfileId,
    Value<String>? version,
  }) {
    return FirmwaresCompanion(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      firmwareTypeId: firmwareTypeId ?? this.firmwareTypeId,
      apiProfileId: apiProfileId ?? this.apiProfileId,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<int>(brandId.value);
    }
    if (firmwareTypeId.present) {
      map['firmware_type_id'] = Variable<int>(firmwareTypeId.value);
    }
    if (apiProfileId.present) {
      map['api_profile_id'] = Variable<int>(apiProfileId.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FirmwaresCompanion(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('firmwareTypeId: $firmwareTypeId, ')
          ..write('apiProfileId: $apiProfileId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $EndpointsTable extends Endpoints
    with TableInfo<$EndpointsTable, Endpoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EndpointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _apiProfileIdMeta = const VerificationMeta(
    'apiProfileId',
  );
  @override
  late final GeneratedColumn<int> apiProfileId = GeneratedColumn<int>(
    'api_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES api_profiles (id)',
    ),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _httpMethodMeta = const VerificationMeta(
    'httpMethod',
  );
  @override
  late final GeneratedColumn<String> httpMethod = GeneratedColumn<String>(
    'http_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requiresAuthMeta = const VerificationMeta(
    'requiresAuth',
  );
  @override
  late final GeneratedColumn<bool> requiresAuth = GeneratedColumn<bool>(
    'requires_auth',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("requires_auth" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    apiProfileId,
    category,
    operation,
    httpMethod,
    path,
    requiresAuth,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'endpoints';
  @override
  VerificationContext validateIntegrity(
    Insertable<Endpoint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_profile_id')) {
      context.handle(
        _apiProfileIdMeta,
        apiProfileId.isAcceptableOrUnknown(
          data['api_profile_id']!,
          _apiProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_apiProfileIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('http_method')) {
      context.handle(
        _httpMethodMeta,
        httpMethod.isAcceptableOrUnknown(data['http_method']!, _httpMethodMeta),
      );
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('requires_auth')) {
      context.handle(
        _requiresAuthMeta,
        requiresAuth.isAcceptableOrUnknown(
          data['requires_auth']!,
          _requiresAuthMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Endpoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Endpoint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      apiProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_profile_id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      httpMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}http_method'],
      ),
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      requiresAuth: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}requires_auth'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $EndpointsTable createAlias(String alias) {
    return $EndpointsTable(attachedDatabase, alias);
  }
}

class Endpoint extends DataClass implements Insertable<Endpoint> {
  final int id;
  final int apiProfileId;
  final String category;
  final String operation;
  final String? httpMethod;
  final String path;
  final bool requiresAuth;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Endpoint({
    required this.id,
    required this.apiProfileId,
    required this.category,
    required this.operation,
    this.httpMethod,
    required this.path,
    required this.requiresAuth,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['api_profile_id'] = Variable<int>(apiProfileId);
    map['category'] = Variable<String>(category);
    map['operation'] = Variable<String>(operation);
    if (!nullToAbsent || httpMethod != null) {
      map['http_method'] = Variable<String>(httpMethod);
    }
    map['path'] = Variable<String>(path);
    map['requires_auth'] = Variable<bool>(requiresAuth);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  EndpointsCompanion toCompanion(bool nullToAbsent) {
    return EndpointsCompanion(
      id: Value(id),
      apiProfileId: Value(apiProfileId),
      category: Value(category),
      operation: Value(operation),
      httpMethod: httpMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(httpMethod),
      path: Value(path),
      requiresAuth: Value(requiresAuth),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Endpoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Endpoint(
      id: serializer.fromJson<int>(json['id']),
      apiProfileId: serializer.fromJson<int>(json['apiProfileId']),
      category: serializer.fromJson<String>(json['category']),
      operation: serializer.fromJson<String>(json['operation']),
      httpMethod: serializer.fromJson<String?>(json['httpMethod']),
      path: serializer.fromJson<String>(json['path']),
      requiresAuth: serializer.fromJson<bool>(json['requiresAuth']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiProfileId': serializer.toJson<int>(apiProfileId),
      'category': serializer.toJson<String>(category),
      'operation': serializer.toJson<String>(operation),
      'httpMethod': serializer.toJson<String?>(httpMethod),
      'path': serializer.toJson<String>(path),
      'requiresAuth': serializer.toJson<bool>(requiresAuth),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Endpoint copyWith({
    int? id,
    int? apiProfileId,
    String? category,
    String? operation,
    Value<String?> httpMethod = const Value.absent(),
    String? path,
    bool? requiresAuth,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Endpoint(
    id: id ?? this.id,
    apiProfileId: apiProfileId ?? this.apiProfileId,
    category: category ?? this.category,
    operation: operation ?? this.operation,
    httpMethod: httpMethod.present ? httpMethod.value : this.httpMethod,
    path: path ?? this.path,
    requiresAuth: requiresAuth ?? this.requiresAuth,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Endpoint copyWithCompanion(EndpointsCompanion data) {
    return Endpoint(
      id: data.id.present ? data.id.value : this.id,
      apiProfileId: data.apiProfileId.present
          ? data.apiProfileId.value
          : this.apiProfileId,
      category: data.category.present ? data.category.value : this.category,
      operation: data.operation.present ? data.operation.value : this.operation,
      httpMethod: data.httpMethod.present
          ? data.httpMethod.value
          : this.httpMethod,
      path: data.path.present ? data.path.value : this.path,
      requiresAuth: data.requiresAuth.present
          ? data.requiresAuth.value
          : this.requiresAuth,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Endpoint(')
          ..write('id: $id, ')
          ..write('apiProfileId: $apiProfileId, ')
          ..write('category: $category, ')
          ..write('operation: $operation, ')
          ..write('httpMethod: $httpMethod, ')
          ..write('path: $path, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    apiProfileId,
    category,
    operation,
    httpMethod,
    path,
    requiresAuth,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Endpoint &&
          other.id == this.id &&
          other.apiProfileId == this.apiProfileId &&
          other.category == this.category &&
          other.operation == this.operation &&
          other.httpMethod == this.httpMethod &&
          other.path == this.path &&
          other.requiresAuth == this.requiresAuth &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EndpointsCompanion extends UpdateCompanion<Endpoint> {
  final Value<int> id;
  final Value<int> apiProfileId;
  final Value<String> category;
  final Value<String> operation;
  final Value<String?> httpMethod;
  final Value<String> path;
  final Value<bool> requiresAuth;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const EndpointsCompanion({
    this.id = const Value.absent(),
    this.apiProfileId = const Value.absent(),
    this.category = const Value.absent(),
    this.operation = const Value.absent(),
    this.httpMethod = const Value.absent(),
    this.path = const Value.absent(),
    this.requiresAuth = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EndpointsCompanion.insert({
    this.id = const Value.absent(),
    required int apiProfileId,
    required String category,
    required String operation,
    this.httpMethod = const Value.absent(),
    required String path,
    this.requiresAuth = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : apiProfileId = Value(apiProfileId),
       category = Value(category),
       operation = Value(operation),
       path = Value(path);
  static Insertable<Endpoint> custom({
    Expression<int>? id,
    Expression<int>? apiProfileId,
    Expression<String>? category,
    Expression<String>? operation,
    Expression<String>? httpMethod,
    Expression<String>? path,
    Expression<bool>? requiresAuth,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiProfileId != null) 'api_profile_id': apiProfileId,
      if (category != null) 'category': category,
      if (operation != null) 'operation': operation,
      if (httpMethod != null) 'http_method': httpMethod,
      if (path != null) 'path': path,
      if (requiresAuth != null) 'requires_auth': requiresAuth,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EndpointsCompanion copyWith({
    Value<int>? id,
    Value<int>? apiProfileId,
    Value<String>? category,
    Value<String>? operation,
    Value<String?>? httpMethod,
    Value<String>? path,
    Value<bool>? requiresAuth,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return EndpointsCompanion(
      id: id ?? this.id,
      apiProfileId: apiProfileId ?? this.apiProfileId,
      category: category ?? this.category,
      operation: operation ?? this.operation,
      httpMethod: httpMethod ?? this.httpMethod,
      path: path ?? this.path,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiProfileId.present) {
      map['api_profile_id'] = Variable<int>(apiProfileId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (httpMethod.present) {
      map['http_method'] = Variable<String>(httpMethod.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (requiresAuth.present) {
      map['requires_auth'] = Variable<bool>(requiresAuth.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EndpointsCompanion(')
          ..write('id: $id, ')
          ..write('apiProfileId: $apiProfileId, ')
          ..write('category: $category, ')
          ..write('operation: $operation, ')
          ..write('httpMethod: $httpMethod, ')
          ..write('path: $path, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CapabilitiesTable extends Capabilities
    with TableInfo<$CapabilitiesTable, Capability> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CapabilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, key, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'capabilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<Capability> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Capability map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Capability(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CapabilitiesTable createAlias(String alias) {
    return $CapabilitiesTable(attachedDatabase, alias);
  }
}

class Capability extends DataClass implements Insertable<Capability> {
  final int id;
  final String key;
  final String name;
  final String? description;
  const Capability({
    required this.id,
    required this.key,
    required this.name,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CapabilitiesCompanion toCompanion(bool nullToAbsent) {
    return CapabilitiesCompanion(
      id: Value(id),
      key: Value(key),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Capability.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Capability(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  Capability copyWith({
    int? id,
    String? key,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => Capability(
    id: id ?? this.id,
    key: key ?? this.key,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  Capability copyWithCompanion(CapabilitiesCompanion data) {
    return Capability(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Capability(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Capability &&
          other.id == this.id &&
          other.key == this.key &&
          other.name == this.name &&
          other.description == this.description);
}

class CapabilitiesCompanion extends UpdateCompanion<Capability> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> name;
  final Value<String?> description;
  const CapabilitiesCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  CapabilitiesCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String name,
    this.description = const Value.absent(),
  }) : key = Value(key),
       name = Value(name);
  static Insertable<Capability> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  CapabilitiesCompanion copyWith({
    Value<int>? id,
    Value<String>? key,
    Value<String>? name,
    Value<String?>? description,
  }) {
    return CapabilitiesCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CapabilitiesCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $FirmwareCapabilitiesTable extends FirmwareCapabilities
    with TableInfo<$FirmwareCapabilitiesTable, FirmwareCapability> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FirmwareCapabilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _firmwareIdMeta = const VerificationMeta(
    'firmwareId',
  );
  @override
  late final GeneratedColumn<int> firmwareId = GeneratedColumn<int>(
    'firmware_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES firmwares (id)',
    ),
  );
  static const VerificationMeta _capabilityIdMeta = const VerificationMeta(
    'capabilityId',
  );
  @override
  late final GeneratedColumn<int> capabilityId = GeneratedColumn<int>(
    'capability_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES capabilities (id)',
    ),
  );
  static const VerificationMeta _supportedMeta = const VerificationMeta(
    'supported',
  );
  @override
  late final GeneratedColumn<bool> supported = GeneratedColumn<bool>(
    'supported',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supported" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    firmwareId,
    capabilityId,
    supported,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'firmware_capabilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<FirmwareCapability> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('firmware_id')) {
      context.handle(
        _firmwareIdMeta,
        firmwareId.isAcceptableOrUnknown(data['firmware_id']!, _firmwareIdMeta),
      );
    } else if (isInserting) {
      context.missing(_firmwareIdMeta);
    }
    if (data.containsKey('capability_id')) {
      context.handle(
        _capabilityIdMeta,
        capabilityId.isAcceptableOrUnknown(
          data['capability_id']!,
          _capabilityIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_capabilityIdMeta);
    }
    if (data.containsKey('supported')) {
      context.handle(
        _supportedMeta,
        supported.isAcceptableOrUnknown(data['supported']!, _supportedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {firmwareId, capabilityId},
  ];
  @override
  FirmwareCapability map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FirmwareCapability(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      firmwareId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}firmware_id'],
      )!,
      capabilityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capability_id'],
      )!,
      supported: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supported'],
      )!,
    );
  }

  @override
  $FirmwareCapabilitiesTable createAlias(String alias) {
    return $FirmwareCapabilitiesTable(attachedDatabase, alias);
  }
}

class FirmwareCapability extends DataClass
    implements Insertable<FirmwareCapability> {
  final int id;
  final int firmwareId;
  final int capabilityId;
  final bool supported;
  const FirmwareCapability({
    required this.id,
    required this.firmwareId,
    required this.capabilityId,
    required this.supported,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['firmware_id'] = Variable<int>(firmwareId);
    map['capability_id'] = Variable<int>(capabilityId);
    map['supported'] = Variable<bool>(supported);
    return map;
  }

  FirmwareCapabilitiesCompanion toCompanion(bool nullToAbsent) {
    return FirmwareCapabilitiesCompanion(
      id: Value(id),
      firmwareId: Value(firmwareId),
      capabilityId: Value(capabilityId),
      supported: Value(supported),
    );
  }

  factory FirmwareCapability.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FirmwareCapability(
      id: serializer.fromJson<int>(json['id']),
      firmwareId: serializer.fromJson<int>(json['firmwareId']),
      capabilityId: serializer.fromJson<int>(json['capabilityId']),
      supported: serializer.fromJson<bool>(json['supported']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firmwareId': serializer.toJson<int>(firmwareId),
      'capabilityId': serializer.toJson<int>(capabilityId),
      'supported': serializer.toJson<bool>(supported),
    };
  }

  FirmwareCapability copyWith({
    int? id,
    int? firmwareId,
    int? capabilityId,
    bool? supported,
  }) => FirmwareCapability(
    id: id ?? this.id,
    firmwareId: firmwareId ?? this.firmwareId,
    capabilityId: capabilityId ?? this.capabilityId,
    supported: supported ?? this.supported,
  );
  FirmwareCapability copyWithCompanion(FirmwareCapabilitiesCompanion data) {
    return FirmwareCapability(
      id: data.id.present ? data.id.value : this.id,
      firmwareId: data.firmwareId.present
          ? data.firmwareId.value
          : this.firmwareId,
      capabilityId: data.capabilityId.present
          ? data.capabilityId.value
          : this.capabilityId,
      supported: data.supported.present ? data.supported.value : this.supported,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FirmwareCapability(')
          ..write('id: $id, ')
          ..write('firmwareId: $firmwareId, ')
          ..write('capabilityId: $capabilityId, ')
          ..write('supported: $supported')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firmwareId, capabilityId, supported);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FirmwareCapability &&
          other.id == this.id &&
          other.firmwareId == this.firmwareId &&
          other.capabilityId == this.capabilityId &&
          other.supported == this.supported);
}

class FirmwareCapabilitiesCompanion
    extends UpdateCompanion<FirmwareCapability> {
  final Value<int> id;
  final Value<int> firmwareId;
  final Value<int> capabilityId;
  final Value<bool> supported;
  const FirmwareCapabilitiesCompanion({
    this.id = const Value.absent(),
    this.firmwareId = const Value.absent(),
    this.capabilityId = const Value.absent(),
    this.supported = const Value.absent(),
  });
  FirmwareCapabilitiesCompanion.insert({
    this.id = const Value.absent(),
    required int firmwareId,
    required int capabilityId,
    this.supported = const Value.absent(),
  }) : firmwareId = Value(firmwareId),
       capabilityId = Value(capabilityId);
  static Insertable<FirmwareCapability> custom({
    Expression<int>? id,
    Expression<int>? firmwareId,
    Expression<int>? capabilityId,
    Expression<bool>? supported,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firmwareId != null) 'firmware_id': firmwareId,
      if (capabilityId != null) 'capability_id': capabilityId,
      if (supported != null) 'supported': supported,
    });
  }

  FirmwareCapabilitiesCompanion copyWith({
    Value<int>? id,
    Value<int>? firmwareId,
    Value<int>? capabilityId,
    Value<bool>? supported,
  }) {
    return FirmwareCapabilitiesCompanion(
      id: id ?? this.id,
      firmwareId: firmwareId ?? this.firmwareId,
      capabilityId: capabilityId ?? this.capabilityId,
      supported: supported ?? this.supported,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firmwareId.present) {
      map['firmware_id'] = Variable<int>(firmwareId.value);
    }
    if (capabilityId.present) {
      map['capability_id'] = Variable<int>(capabilityId.value);
    }
    if (supported.present) {
      map['supported'] = Variable<bool>(supported.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FirmwareCapabilitiesCompanion(')
          ..write('id: $id, ')
          ..write('firmwareId: $firmwareId, ')
          ..write('capabilityId: $capabilityId, ')
          ..write('supported: $supported')
          ..write(')'))
        .toString();
  }
}

class $FingerprintsTable extends Fingerprints
    with TableInfo<$FingerprintsTable, Fingerprint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FingerprintsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _brandIdMeta = const VerificationMeta(
    'brandId',
  );
  @override
  late final GeneratedColumn<int> brandId = GeneratedColumn<int>(
    'brand_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES brands (id)',
    ),
  );
  static const VerificationMeta _firmwareIdMeta = const VerificationMeta(
    'firmwareId',
  );
  @override
  late final GeneratedColumn<int> firmwareId = GeneratedColumn<int>(
    'firmware_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES firmwares (id)',
    ),
  );
  static const VerificationMeta _matchTypeMeta = const VerificationMeta(
    'matchType',
  );
  @override
  late final GeneratedColumn<String> matchType = GeneratedColumn<String>(
    'match_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _matchValueMeta = const VerificationMeta(
    'matchValue',
  );
  @override
  late final GeneratedColumn<String> matchValue = GeneratedColumn<String>(
    'match_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brandId,
    firmwareId,
    matchType,
    matchValue,
    confidence,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fingerprints';
  @override
  VerificationContext validateIntegrity(
    Insertable<Fingerprint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('brand_id')) {
      context.handle(
        _brandIdMeta,
        brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta),
      );
    }
    if (data.containsKey('firmware_id')) {
      context.handle(
        _firmwareIdMeta,
        firmwareId.isAcceptableOrUnknown(data['firmware_id']!, _firmwareIdMeta),
      );
    }
    if (data.containsKey('match_type')) {
      context.handle(
        _matchTypeMeta,
        matchType.isAcceptableOrUnknown(data['match_type']!, _matchTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_matchTypeMeta);
    }
    if (data.containsKey('match_value')) {
      context.handle(
        _matchValueMeta,
        matchValue.isAcceptableOrUnknown(data['match_value']!, _matchValueMeta),
      );
    } else if (isInserting) {
      context.missing(_matchValueMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fingerprint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Fingerprint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      brandId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}brand_id'],
      ),
      firmwareId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}firmware_id'],
      ),
      matchType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}match_type'],
      )!,
      matchValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}match_value'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      )!,
    );
  }

  @override
  $FingerprintsTable createAlias(String alias) {
    return $FingerprintsTable(attachedDatabase, alias);
  }
}

class Fingerprint extends DataClass implements Insertable<Fingerprint> {
  final int id;
  final int? brandId;
  final int? firmwareId;
  final String matchType;
  final String matchValue;
  final int confidence;
  const Fingerprint({
    required this.id,
    this.brandId,
    this.firmwareId,
    required this.matchType,
    required this.matchValue,
    required this.confidence,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || brandId != null) {
      map['brand_id'] = Variable<int>(brandId);
    }
    if (!nullToAbsent || firmwareId != null) {
      map['firmware_id'] = Variable<int>(firmwareId);
    }
    map['match_type'] = Variable<String>(matchType);
    map['match_value'] = Variable<String>(matchValue);
    map['confidence'] = Variable<int>(confidence);
    return map;
  }

  FingerprintsCompanion toCompanion(bool nullToAbsent) {
    return FingerprintsCompanion(
      id: Value(id),
      brandId: brandId == null && nullToAbsent
          ? const Value.absent()
          : Value(brandId),
      firmwareId: firmwareId == null && nullToAbsent
          ? const Value.absent()
          : Value(firmwareId),
      matchType: Value(matchType),
      matchValue: Value(matchValue),
      confidence: Value(confidence),
    );
  }

  factory Fingerprint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Fingerprint(
      id: serializer.fromJson<int>(json['id']),
      brandId: serializer.fromJson<int?>(json['brandId']),
      firmwareId: serializer.fromJson<int?>(json['firmwareId']),
      matchType: serializer.fromJson<String>(json['matchType']),
      matchValue: serializer.fromJson<String>(json['matchValue']),
      confidence: serializer.fromJson<int>(json['confidence']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'brandId': serializer.toJson<int?>(brandId),
      'firmwareId': serializer.toJson<int?>(firmwareId),
      'matchType': serializer.toJson<String>(matchType),
      'matchValue': serializer.toJson<String>(matchValue),
      'confidence': serializer.toJson<int>(confidence),
    };
  }

  Fingerprint copyWith({
    int? id,
    Value<int?> brandId = const Value.absent(),
    Value<int?> firmwareId = const Value.absent(),
    String? matchType,
    String? matchValue,
    int? confidence,
  }) => Fingerprint(
    id: id ?? this.id,
    brandId: brandId.present ? brandId.value : this.brandId,
    firmwareId: firmwareId.present ? firmwareId.value : this.firmwareId,
    matchType: matchType ?? this.matchType,
    matchValue: matchValue ?? this.matchValue,
    confidence: confidence ?? this.confidence,
  );
  Fingerprint copyWithCompanion(FingerprintsCompanion data) {
    return Fingerprint(
      id: data.id.present ? data.id.value : this.id,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      firmwareId: data.firmwareId.present
          ? data.firmwareId.value
          : this.firmwareId,
      matchType: data.matchType.present ? data.matchType.value : this.matchType,
      matchValue: data.matchValue.present
          ? data.matchValue.value
          : this.matchValue,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Fingerprint(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('firmwareId: $firmwareId, ')
          ..write('matchType: $matchType, ')
          ..write('matchValue: $matchValue, ')
          ..write('confidence: $confidence')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, brandId, firmwareId, matchType, matchValue, confidence);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fingerprint &&
          other.id == this.id &&
          other.brandId == this.brandId &&
          other.firmwareId == this.firmwareId &&
          other.matchType == this.matchType &&
          other.matchValue == this.matchValue &&
          other.confidence == this.confidence);
}

class FingerprintsCompanion extends UpdateCompanion<Fingerprint> {
  final Value<int> id;
  final Value<int?> brandId;
  final Value<int?> firmwareId;
  final Value<String> matchType;
  final Value<String> matchValue;
  final Value<int> confidence;
  const FingerprintsCompanion({
    this.id = const Value.absent(),
    this.brandId = const Value.absent(),
    this.firmwareId = const Value.absent(),
    this.matchType = const Value.absent(),
    this.matchValue = const Value.absent(),
    this.confidence = const Value.absent(),
  });
  FingerprintsCompanion.insert({
    this.id = const Value.absent(),
    this.brandId = const Value.absent(),
    this.firmwareId = const Value.absent(),
    required String matchType,
    required String matchValue,
    this.confidence = const Value.absent(),
  }) : matchType = Value(matchType),
       matchValue = Value(matchValue);
  static Insertable<Fingerprint> custom({
    Expression<int>? id,
    Expression<int>? brandId,
    Expression<int>? firmwareId,
    Expression<String>? matchType,
    Expression<String>? matchValue,
    Expression<int>? confidence,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brandId != null) 'brand_id': brandId,
      if (firmwareId != null) 'firmware_id': firmwareId,
      if (matchType != null) 'match_type': matchType,
      if (matchValue != null) 'match_value': matchValue,
      if (confidence != null) 'confidence': confidence,
    });
  }

  FingerprintsCompanion copyWith({
    Value<int>? id,
    Value<int?>? brandId,
    Value<int?>? firmwareId,
    Value<String>? matchType,
    Value<String>? matchValue,
    Value<int>? confidence,
  }) {
    return FingerprintsCompanion(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      firmwareId: firmwareId ?? this.firmwareId,
      matchType: matchType ?? this.matchType,
      matchValue: matchValue ?? this.matchValue,
      confidence: confidence ?? this.confidence,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<int>(brandId.value);
    }
    if (firmwareId.present) {
      map['firmware_id'] = Variable<int>(firmwareId.value);
    }
    if (matchType.present) {
      map['match_type'] = Variable<String>(matchType.value);
    }
    if (matchValue.present) {
      map['match_value'] = Variable<String>(matchValue.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FingerprintsCompanion(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('firmwareId: $firmwareId, ')
          ..write('matchType: $matchType, ')
          ..write('matchValue: $matchValue, ')
          ..write('confidence: $confidence')
          ..write(')'))
        .toString();
  }
}

class $VersionRulesTable extends VersionRules
    with TableInfo<$VersionRulesTable, VersionRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VersionRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _apiProfileIdMeta = const VerificationMeta(
    'apiProfileId',
  );
  @override
  late final GeneratedColumn<int> apiProfileId = GeneratedColumn<int>(
    'api_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES api_profiles (id)',
    ),
  );
  static const VerificationMeta _minVersionSortMeta = const VerificationMeta(
    'minVersionSort',
  );
  @override
  late final GeneratedColumn<int> minVersionSort = GeneratedColumn<int>(
    'min_version_sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxVersionSortMeta = const VerificationMeta(
    'maxVersionSort',
  );
  @override
  late final GeneratedColumn<int> maxVersionSort = GeneratedColumn<int>(
    'max_version_sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _driverIdMeta = const VerificationMeta(
    'driverId',
  );
  @override
  late final GeneratedColumn<int> driverId = GeneratedColumn<int>(
    'driver_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES drivers (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    apiProfileId,
    minVersionSort,
    maxVersionSort,
    driverId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'version_rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<VersionRule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_profile_id')) {
      context.handle(
        _apiProfileIdMeta,
        apiProfileId.isAcceptableOrUnknown(
          data['api_profile_id']!,
          _apiProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_apiProfileIdMeta);
    }
    if (data.containsKey('min_version_sort')) {
      context.handle(
        _minVersionSortMeta,
        minVersionSort.isAcceptableOrUnknown(
          data['min_version_sort']!,
          _minVersionSortMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minVersionSortMeta);
    }
    if (data.containsKey('max_version_sort')) {
      context.handle(
        _maxVersionSortMeta,
        maxVersionSort.isAcceptableOrUnknown(
          data['max_version_sort']!,
          _maxVersionSortMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maxVersionSortMeta);
    }
    if (data.containsKey('driver_id')) {
      context.handle(
        _driverIdMeta,
        driverId.isAcceptableOrUnknown(data['driver_id']!, _driverIdMeta),
      );
    } else if (isInserting) {
      context.missing(_driverIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VersionRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VersionRule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      apiProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_profile_id'],
      )!,
      minVersionSort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}min_version_sort'],
      )!,
      maxVersionSort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_version_sort'],
      )!,
      driverId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}driver_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VersionRulesTable createAlias(String alias) {
    return $VersionRulesTable(attachedDatabase, alias);
  }
}

class VersionRule extends DataClass implements Insertable<VersionRule> {
  final int id;
  final int apiProfileId;
  final int minVersionSort;
  final int maxVersionSort;
  final int driverId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VersionRule({
    required this.id,
    required this.apiProfileId,
    required this.minVersionSort,
    required this.maxVersionSort,
    required this.driverId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['api_profile_id'] = Variable<int>(apiProfileId);
    map['min_version_sort'] = Variable<int>(minVersionSort);
    map['max_version_sort'] = Variable<int>(maxVersionSort);
    map['driver_id'] = Variable<int>(driverId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VersionRulesCompanion toCompanion(bool nullToAbsent) {
    return VersionRulesCompanion(
      id: Value(id),
      apiProfileId: Value(apiProfileId),
      minVersionSort: Value(minVersionSort),
      maxVersionSort: Value(maxVersionSort),
      driverId: Value(driverId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VersionRule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VersionRule(
      id: serializer.fromJson<int>(json['id']),
      apiProfileId: serializer.fromJson<int>(json['apiProfileId']),
      minVersionSort: serializer.fromJson<int>(json['minVersionSort']),
      maxVersionSort: serializer.fromJson<int>(json['maxVersionSort']),
      driverId: serializer.fromJson<int>(json['driverId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiProfileId': serializer.toJson<int>(apiProfileId),
      'minVersionSort': serializer.toJson<int>(minVersionSort),
      'maxVersionSort': serializer.toJson<int>(maxVersionSort),
      'driverId': serializer.toJson<int>(driverId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VersionRule copyWith({
    int? id,
    int? apiProfileId,
    int? minVersionSort,
    int? maxVersionSort,
    int? driverId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => VersionRule(
    id: id ?? this.id,
    apiProfileId: apiProfileId ?? this.apiProfileId,
    minVersionSort: minVersionSort ?? this.minVersionSort,
    maxVersionSort: maxVersionSort ?? this.maxVersionSort,
    driverId: driverId ?? this.driverId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VersionRule copyWithCompanion(VersionRulesCompanion data) {
    return VersionRule(
      id: data.id.present ? data.id.value : this.id,
      apiProfileId: data.apiProfileId.present
          ? data.apiProfileId.value
          : this.apiProfileId,
      minVersionSort: data.minVersionSort.present
          ? data.minVersionSort.value
          : this.minVersionSort,
      maxVersionSort: data.maxVersionSort.present
          ? data.maxVersionSort.value
          : this.maxVersionSort,
      driverId: data.driverId.present ? data.driverId.value : this.driverId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VersionRule(')
          ..write('id: $id, ')
          ..write('apiProfileId: $apiProfileId, ')
          ..write('minVersionSort: $minVersionSort, ')
          ..write('maxVersionSort: $maxVersionSort, ')
          ..write('driverId: $driverId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    apiProfileId,
    minVersionSort,
    maxVersionSort,
    driverId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VersionRule &&
          other.id == this.id &&
          other.apiProfileId == this.apiProfileId &&
          other.minVersionSort == this.minVersionSort &&
          other.maxVersionSort == this.maxVersionSort &&
          other.driverId == this.driverId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VersionRulesCompanion extends UpdateCompanion<VersionRule> {
  final Value<int> id;
  final Value<int> apiProfileId;
  final Value<int> minVersionSort;
  final Value<int> maxVersionSort;
  final Value<int> driverId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VersionRulesCompanion({
    this.id = const Value.absent(),
    this.apiProfileId = const Value.absent(),
    this.minVersionSort = const Value.absent(),
    this.maxVersionSort = const Value.absent(),
    this.driverId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VersionRulesCompanion.insert({
    this.id = const Value.absent(),
    required int apiProfileId,
    required int minVersionSort,
    required int maxVersionSort,
    required int driverId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : apiProfileId = Value(apiProfileId),
       minVersionSort = Value(minVersionSort),
       maxVersionSort = Value(maxVersionSort),
       driverId = Value(driverId);
  static Insertable<VersionRule> custom({
    Expression<int>? id,
    Expression<int>? apiProfileId,
    Expression<int>? minVersionSort,
    Expression<int>? maxVersionSort,
    Expression<int>? driverId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiProfileId != null) 'api_profile_id': apiProfileId,
      if (minVersionSort != null) 'min_version_sort': minVersionSort,
      if (maxVersionSort != null) 'max_version_sort': maxVersionSort,
      if (driverId != null) 'driver_id': driverId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VersionRulesCompanion copyWith({
    Value<int>? id,
    Value<int>? apiProfileId,
    Value<int>? minVersionSort,
    Value<int>? maxVersionSort,
    Value<int>? driverId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return VersionRulesCompanion(
      id: id ?? this.id,
      apiProfileId: apiProfileId ?? this.apiProfileId,
      minVersionSort: minVersionSort ?? this.minVersionSort,
      maxVersionSort: maxVersionSort ?? this.maxVersionSort,
      driverId: driverId ?? this.driverId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiProfileId.present) {
      map['api_profile_id'] = Variable<int>(apiProfileId.value);
    }
    if (minVersionSort.present) {
      map['min_version_sort'] = Variable<int>(minVersionSort.value);
    }
    if (maxVersionSort.present) {
      map['max_version_sort'] = Variable<int>(maxVersionSort.value);
    }
    if (driverId.present) {
      map['driver_id'] = Variable<int>(driverId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VersionRulesCompanion(')
          ..write('id: $id, ')
          ..write('apiProfileId: $apiProfileId, ')
          ..write('minVersionSort: $minVersionSort, ')
          ..write('maxVersionSort: $maxVersionSort, ')
          ..write('driverId: $driverId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserDevicesTable extends UserDevices
    with TableInfo<$UserDevicesTable, UserDevice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _brandIdMeta = const VerificationMeta(
    'brandId',
  );
  @override
  late final GeneratedColumn<int> brandId = GeneratedColumn<int>(
    'brand_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES brands (id)',
    ),
  );
  static const VerificationMeta _routerModelMeta = const VerificationMeta(
    'routerModel',
  );
  @override
  late final GeneratedColumn<String> routerModel = GeneratedColumn<String>(
    'router_model',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dnsMeta = const VerificationMeta('dns');
  @override
  late final GeneratedColumn<String> dns = GeneratedColumn<String>(
    'dns',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endpointIdMeta = const VerificationMeta(
    'endpointId',
  );
  @override
  late final GeneratedColumn<int> endpointId = GeneratedColumn<int>(
    'endpoint_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSeenAtMeta = const VerificationMeta(
    'lastSeenAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSeenAt = GeneratedColumn<DateTime>(
    'last_seen_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brandId,
    routerModel,
    dns,
    endpointId,
    lastSeenAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_devices';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDevice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('brand_id')) {
      context.handle(
        _brandIdMeta,
        brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta),
      );
    } else if (isInserting) {
      context.missing(_brandIdMeta);
    }
    if (data.containsKey('router_model')) {
      context.handle(
        _routerModelMeta,
        routerModel.isAcceptableOrUnknown(
          data['router_model']!,
          _routerModelMeta,
        ),
      );
    }
    if (data.containsKey('dns')) {
      context.handle(
        _dnsMeta,
        dns.isAcceptableOrUnknown(data['dns']!, _dnsMeta),
      );
    }
    if (data.containsKey('endpoint_id')) {
      context.handle(
        _endpointIdMeta,
        endpointId.isAcceptableOrUnknown(data['endpoint_id']!, _endpointIdMeta),
      );
    }
    if (data.containsKey('last_seen_at')) {
      context.handle(
        _lastSeenAtMeta,
        lastSeenAt.isAcceptableOrUnknown(
          data['last_seen_at']!,
          _lastSeenAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDevice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDevice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      brandId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}brand_id'],
      )!,
      routerModel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}router_model'],
      ),
      dns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dns'],
      ),
      endpointId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}endpoint_id'],
      ),
      lastSeenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_seen_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserDevicesTable createAlias(String alias) {
    return $UserDevicesTable(attachedDatabase, alias);
  }
}

class UserDevice extends DataClass implements Insertable<UserDevice> {
  final int id;
  final int brandId;
  final String? routerModel;
  final String? dns;
  final int? endpointId;
  final DateTime? lastSeenAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserDevice({
    required this.id,
    required this.brandId,
    this.routerModel,
    this.dns,
    this.endpointId,
    this.lastSeenAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['brand_id'] = Variable<int>(brandId);
    if (!nullToAbsent || routerModel != null) {
      map['router_model'] = Variable<String>(routerModel);
    }
    if (!nullToAbsent || dns != null) {
      map['dns'] = Variable<String>(dns);
    }
    if (!nullToAbsent || endpointId != null) {
      map['endpoint_id'] = Variable<int>(endpointId);
    }
    if (!nullToAbsent || lastSeenAt != null) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserDevicesCompanion toCompanion(bool nullToAbsent) {
    return UserDevicesCompanion(
      id: Value(id),
      brandId: Value(brandId),
      routerModel: routerModel == null && nullToAbsent
          ? const Value.absent()
          : Value(routerModel),
      dns: dns == null && nullToAbsent ? const Value.absent() : Value(dns),
      endpointId: endpointId == null && nullToAbsent
          ? const Value.absent()
          : Value(endpointId),
      lastSeenAt: lastSeenAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeenAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserDevice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDevice(
      id: serializer.fromJson<int>(json['id']),
      brandId: serializer.fromJson<int>(json['brandId']),
      routerModel: serializer.fromJson<String?>(json['routerModel']),
      dns: serializer.fromJson<String?>(json['dns']),
      endpointId: serializer.fromJson<int?>(json['endpointId']),
      lastSeenAt: serializer.fromJson<DateTime?>(json['lastSeenAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'brandId': serializer.toJson<int>(brandId),
      'routerModel': serializer.toJson<String?>(routerModel),
      'dns': serializer.toJson<String?>(dns),
      'endpointId': serializer.toJson<int?>(endpointId),
      'lastSeenAt': serializer.toJson<DateTime?>(lastSeenAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserDevice copyWith({
    int? id,
    int? brandId,
    Value<String?> routerModel = const Value.absent(),
    Value<String?> dns = const Value.absent(),
    Value<int?> endpointId = const Value.absent(),
    Value<DateTime?> lastSeenAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserDevice(
    id: id ?? this.id,
    brandId: brandId ?? this.brandId,
    routerModel: routerModel.present ? routerModel.value : this.routerModel,
    dns: dns.present ? dns.value : this.dns,
    endpointId: endpointId.present ? endpointId.value : this.endpointId,
    lastSeenAt: lastSeenAt.present ? lastSeenAt.value : this.lastSeenAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserDevice copyWithCompanion(UserDevicesCompanion data) {
    return UserDevice(
      id: data.id.present ? data.id.value : this.id,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      routerModel: data.routerModel.present
          ? data.routerModel.value
          : this.routerModel,
      dns: data.dns.present ? data.dns.value : this.dns,
      endpointId: data.endpointId.present
          ? data.endpointId.value
          : this.endpointId,
      lastSeenAt: data.lastSeenAt.present
          ? data.lastSeenAt.value
          : this.lastSeenAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDevice(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('routerModel: $routerModel, ')
          ..write('dns: $dns, ')
          ..write('endpointId: $endpointId, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    brandId,
    routerModel,
    dns,
    endpointId,
    lastSeenAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDevice &&
          other.id == this.id &&
          other.brandId == this.brandId &&
          other.routerModel == this.routerModel &&
          other.dns == this.dns &&
          other.endpointId == this.endpointId &&
          other.lastSeenAt == this.lastSeenAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserDevicesCompanion extends UpdateCompanion<UserDevice> {
  final Value<int> id;
  final Value<int> brandId;
  final Value<String?> routerModel;
  final Value<String?> dns;
  final Value<int?> endpointId;
  final Value<DateTime?> lastSeenAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserDevicesCompanion({
    this.id = const Value.absent(),
    this.brandId = const Value.absent(),
    this.routerModel = const Value.absent(),
    this.dns = const Value.absent(),
    this.endpointId = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserDevicesCompanion.insert({
    this.id = const Value.absent(),
    required int brandId,
    this.routerModel = const Value.absent(),
    this.dns = const Value.absent(),
    this.endpointId = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : brandId = Value(brandId);
  static Insertable<UserDevice> custom({
    Expression<int>? id,
    Expression<int>? brandId,
    Expression<String>? routerModel,
    Expression<String>? dns,
    Expression<int>? endpointId,
    Expression<DateTime>? lastSeenAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brandId != null) 'brand_id': brandId,
      if (routerModel != null) 'router_model': routerModel,
      if (dns != null) 'dns': dns,
      if (endpointId != null) 'endpoint_id': endpointId,
      if (lastSeenAt != null) 'last_seen_at': lastSeenAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserDevicesCompanion copyWith({
    Value<int>? id,
    Value<int>? brandId,
    Value<String?>? routerModel,
    Value<String?>? dns,
    Value<int?>? endpointId,
    Value<DateTime?>? lastSeenAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UserDevicesCompanion(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      routerModel: routerModel ?? this.routerModel,
      dns: dns ?? this.dns,
      endpointId: endpointId ?? this.endpointId,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<int>(brandId.value);
    }
    if (routerModel.present) {
      map['router_model'] = Variable<String>(routerModel.value);
    }
    if (dns.present) {
      map['dns'] = Variable<String>(dns.value);
    }
    if (endpointId.present) {
      map['endpoint_id'] = Variable<int>(endpointId.value);
    }
    if (lastSeenAt.present) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDevicesCompanion(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('routerModel: $routerModel, ')
          ..write('dns: $dns, ')
          ..write('endpointId: $endpointId, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BrandsTable brands = $BrandsTable(this);
  late final $FirmwareTypesTable firmwareTypes = $FirmwareTypesTable(this);
  late final $ProtocolsTable protocols = $ProtocolsTable(this);
  late final $AuthenticationMethodsTable authenticationMethods =
      $AuthenticationMethodsTable(this);
  late final $DriversTable drivers = $DriversTable(this);
  late final $ApiProfilesTable apiProfiles = $ApiProfilesTable(this);
  late final $FirmwaresTable firmwares = $FirmwaresTable(this);
  late final $EndpointsTable endpoints = $EndpointsTable(this);
  late final $CapabilitiesTable capabilities = $CapabilitiesTable(this);
  late final $FirmwareCapabilitiesTable firmwareCapabilities =
      $FirmwareCapabilitiesTable(this);
  late final $FingerprintsTable fingerprints = $FingerprintsTable(this);
  late final $VersionRulesTable versionRules = $VersionRulesTable(this);
  late final $UserDevicesTable userDevices = $UserDevicesTable(this);
  late final Index idxEndpointsApiProfile = Index(
    'idx_endpoints_api_profile',
    'CREATE INDEX idx_endpoints_api_profile ON endpoints (api_profile_id)',
  );
  late final Index idxFingerprintsBrand = Index(
    'idx_fingerprints_brand',
    'CREATE INDEX idx_fingerprints_brand ON fingerprints (brand_id)',
  );
  late final Index idxFingerprintsFirmware = Index(
    'idx_fingerprints_firmware',
    'CREATE INDEX idx_fingerprints_firmware ON fingerprints (firmware_id)',
  );
  late final Index idxFingerprintsMatchType = Index(
    'idx_fingerprints_match_type',
    'CREATE INDEX idx_fingerprints_match_type ON fingerprints (match_type)',
  );
  late final Index idxVersionRulesLookup = Index(
    'idx_version_rules_lookup',
    'CREATE INDEX idx_version_rules_lookup ON version_rules (api_profile_id, min_version_sort, max_version_sort)',
  );
  late final BrandsDao brandsDao = BrandsDao(this as AppDatabase);
  late final FirmwareTypesDao firmwareTypesDao = FirmwareTypesDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    brands,
    firmwareTypes,
    protocols,
    authenticationMethods,
    drivers,
    apiProfiles,
    firmwares,
    endpoints,
    capabilities,
    firmwareCapabilities,
    fingerprints,
    versionRules,
    userDevices,
    idxEndpointsApiProfile,
    idxFingerprintsBrand,
    idxFingerprintsFirmware,
    idxFingerprintsMatchType,
    idxVersionRulesLookup,
  ];
}

typedef $$BrandsTableCreateCompanionBuilder =
    BrandsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> website,
      Value<String?> logo,
      Value<String?> notes,
      Value<String?> dns,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$BrandsTableUpdateCompanionBuilder =
    BrandsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> website,
      Value<String?> logo,
      Value<String?> notes,
      Value<String?> dns,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$BrandsTableReferences
    extends BaseReferences<_$AppDatabase, $BrandsTable, Brand> {
  $$BrandsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FirmwaresTable, List<Firmware>>
  _firmwaresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.firmwares,
    aliasName: 'brands__id__firmwares__brand_id',
  );

  $$FirmwaresTableProcessedTableManager get firmwaresRefs {
    final manager = $$FirmwaresTableTableManager(
      $_db,
      $_db.firmwares,
    ).filter((f) => f.brandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_firmwaresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FingerprintsTable, List<Fingerprint>>
  _fingerprintsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.fingerprints,
    aliasName: 'brands__id__fingerprints__brand_id',
  );

  $$FingerprintsTableProcessedTableManager get fingerprintsRefs {
    final manager = $$FingerprintsTableTableManager(
      $_db,
      $_db.fingerprints,
    ).filter((f) => f.brandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_fingerprintsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserDevicesTable, List<UserDevice>>
  _userDevicesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userDevices,
    aliasName: 'brands__id__user_devices__brand_id',
  );

  $$UserDevicesTableProcessedTableManager get userDevicesRefs {
    final manager = $$UserDevicesTableTableManager(
      $_db,
      $_db.userDevices,
    ).filter((f) => f.brandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userDevicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BrandsTableFilterComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dns => $composableBuilder(
    column: $table.dns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> firmwaresRefs(
    Expression<bool> Function($$FirmwaresTableFilterComposer f) f,
  ) {
    final $$FirmwaresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableFilterComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> fingerprintsRefs(
    Expression<bool> Function($$FingerprintsTableFilterComposer f) f,
  ) {
    final $$FingerprintsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.fingerprints,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FingerprintsTableFilterComposer(
            $db: $db,
            $table: $db.fingerprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userDevicesRefs(
    Expression<bool> Function($$UserDevicesTableFilterComposer f) f,
  ) {
    final $$UserDevicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDevices,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDevicesTableFilterComposer(
            $db: $db,
            $table: $db.userDevices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BrandsTableOrderingComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dns => $composableBuilder(
    column: $table.dns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BrandsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get dns =>
      $composableBuilder(column: $table.dns, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> firmwaresRefs<T extends Object>(
    Expression<T> Function($$FirmwaresTableAnnotationComposer a) f,
  ) {
    final $$FirmwaresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableAnnotationComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> fingerprintsRefs<T extends Object>(
    Expression<T> Function($$FingerprintsTableAnnotationComposer a) f,
  ) {
    final $$FingerprintsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.fingerprints,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FingerprintsTableAnnotationComposer(
            $db: $db,
            $table: $db.fingerprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userDevicesRefs<T extends Object>(
    Expression<T> Function($$UserDevicesTableAnnotationComposer a) f,
  ) {
    final $$UserDevicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDevices,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDevicesTableAnnotationComposer(
            $db: $db,
            $table: $db.userDevices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BrandsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BrandsTable,
          Brand,
          $$BrandsTableFilterComposer,
          $$BrandsTableOrderingComposer,
          $$BrandsTableAnnotationComposer,
          $$BrandsTableCreateCompanionBuilder,
          $$BrandsTableUpdateCompanionBuilder,
          (Brand, $$BrandsTableReferences),
          Brand,
          PrefetchHooks Function({
            bool firmwaresRefs,
            bool fingerprintsRefs,
            bool userDevicesRefs,
          })
        > {
  $$BrandsTableTableManager(_$AppDatabase db, $BrandsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String?> logo = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> dns = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BrandsCompanion(
                id: id,
                name: name,
                website: website,
                logo: logo,
                notes: notes,
                dns: dns,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> website = const Value.absent(),
                Value<String?> logo = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> dns = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BrandsCompanion.insert(
                id: id,
                name: name,
                website: website,
                logo: logo,
                notes: notes,
                dns: dns,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BrandsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                firmwaresRefs = false,
                fingerprintsRefs = false,
                userDevicesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (firmwaresRefs) db.firmwares,
                    if (fingerprintsRefs) db.fingerprints,
                    if (userDevicesRefs) db.userDevices,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (firmwaresRefs)
                        await $_getPrefetchedData<
                          Brand,
                          $BrandsTable,
                          Firmware
                        >(
                          currentTable: table,
                          referencedTable: $$BrandsTableReferences
                              ._firmwaresRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BrandsTableReferences(
                                db,
                                table,
                                p0,
                              ).firmwaresRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.brandId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (fingerprintsRefs)
                        await $_getPrefetchedData<
                          Brand,
                          $BrandsTable,
                          Fingerprint
                        >(
                          currentTable: table,
                          referencedTable: $$BrandsTableReferences
                              ._fingerprintsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BrandsTableReferences(
                                db,
                                table,
                                p0,
                              ).fingerprintsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.brandId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userDevicesRefs)
                        await $_getPrefetchedData<
                          Brand,
                          $BrandsTable,
                          UserDevice
                        >(
                          currentTable: table,
                          referencedTable: $$BrandsTableReferences
                              ._userDevicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BrandsTableReferences(
                                db,
                                table,
                                p0,
                              ).userDevicesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.brandId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BrandsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BrandsTable,
      Brand,
      $$BrandsTableFilterComposer,
      $$BrandsTableOrderingComposer,
      $$BrandsTableAnnotationComposer,
      $$BrandsTableCreateCompanionBuilder,
      $$BrandsTableUpdateCompanionBuilder,
      (Brand, $$BrandsTableReferences),
      Brand,
      PrefetchHooks Function({
        bool firmwaresRefs,
        bool fingerprintsRefs,
        bool userDevicesRefs,
      })
    >;
typedef $$FirmwareTypesTableCreateCompanionBuilder =
    FirmwareTypesCompanion Function({Value<int> id, required String name});
typedef $$FirmwareTypesTableUpdateCompanionBuilder =
    FirmwareTypesCompanion Function({Value<int> id, Value<String> name});

final class $$FirmwareTypesTableReferences
    extends BaseReferences<_$AppDatabase, $FirmwareTypesTable, FirmwareType> {
  $$FirmwareTypesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$FirmwaresTable, List<Firmware>>
  _firmwaresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.firmwares,
    aliasName: 'firmware_types__id__firmwares__firmware_type_id',
  );

  $$FirmwaresTableProcessedTableManager get firmwaresRefs {
    final manager = $$FirmwaresTableTableManager(
      $_db,
      $_db.firmwares,
    ).filter((f) => f.firmwareTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_firmwaresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FirmwareTypesTableFilterComposer
    extends Composer<_$AppDatabase, $FirmwareTypesTable> {
  $$FirmwareTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> firmwaresRefs(
    Expression<bool> Function($$FirmwaresTableFilterComposer f) f,
  ) {
    final $$FirmwaresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.firmwareTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableFilterComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FirmwareTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $FirmwareTypesTable> {
  $$FirmwareTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FirmwareTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FirmwareTypesTable> {
  $$FirmwareTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> firmwaresRefs<T extends Object>(
    Expression<T> Function($$FirmwaresTableAnnotationComposer a) f,
  ) {
    final $$FirmwaresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.firmwareTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableAnnotationComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FirmwareTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FirmwareTypesTable,
          FirmwareType,
          $$FirmwareTypesTableFilterComposer,
          $$FirmwareTypesTableOrderingComposer,
          $$FirmwareTypesTableAnnotationComposer,
          $$FirmwareTypesTableCreateCompanionBuilder,
          $$FirmwareTypesTableUpdateCompanionBuilder,
          (FirmwareType, $$FirmwareTypesTableReferences),
          FirmwareType,
          PrefetchHooks Function({bool firmwaresRefs})
        > {
  $$FirmwareTypesTableTableManager(_$AppDatabase db, $FirmwareTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FirmwareTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FirmwareTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FirmwareTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => FirmwareTypesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  FirmwareTypesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FirmwareTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({firmwaresRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (firmwaresRefs) db.firmwares],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (firmwaresRefs)
                    await $_getPrefetchedData<
                      FirmwareType,
                      $FirmwareTypesTable,
                      Firmware
                    >(
                      currentTable: table,
                      referencedTable: $$FirmwareTypesTableReferences
                          ._firmwaresRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FirmwareTypesTableReferences(
                            db,
                            table,
                            p0,
                          ).firmwaresRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.firmwareTypeId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FirmwareTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FirmwareTypesTable,
      FirmwareType,
      $$FirmwareTypesTableFilterComposer,
      $$FirmwareTypesTableOrderingComposer,
      $$FirmwareTypesTableAnnotationComposer,
      $$FirmwareTypesTableCreateCompanionBuilder,
      $$FirmwareTypesTableUpdateCompanionBuilder,
      (FirmwareType, $$FirmwareTypesTableReferences),
      FirmwareType,
      PrefetchHooks Function({bool firmwaresRefs})
    >;
typedef $$ProtocolsTableCreateCompanionBuilder =
    ProtocolsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
    });
typedef $$ProtocolsTableUpdateCompanionBuilder =
    ProtocolsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
    });

final class $$ProtocolsTableReferences
    extends BaseReferences<_$AppDatabase, $ProtocolsTable, Protocol> {
  $$ProtocolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ApiProfilesTable, List<ApiProfile>>
  _apiProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.apiProfiles,
    aliasName: 'protocols__id__api_profiles__protocol_id',
  );

  $$ApiProfilesTableProcessedTableManager get apiProfilesRefs {
    final manager = $$ApiProfilesTableTableManager(
      $_db,
      $_db.apiProfiles,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_apiProfilesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProtocolsTableFilterComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> apiProfilesRefs(
    Expression<bool> Function($$ApiProfilesTableFilterComposer f) f,
  ) {
    final $$ApiProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableFilterComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProtocolsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProtocolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> apiProfilesRefs<T extends Object>(
    Expression<T> Function($$ApiProfilesTableAnnotationComposer a) f,
  ) {
    final $$ApiProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProtocolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProtocolsTable,
          Protocol,
          $$ProtocolsTableFilterComposer,
          $$ProtocolsTableOrderingComposer,
          $$ProtocolsTableAnnotationComposer,
          $$ProtocolsTableCreateCompanionBuilder,
          $$ProtocolsTableUpdateCompanionBuilder,
          (Protocol, $$ProtocolsTableReferences),
          Protocol,
          PrefetchHooks Function({bool apiProfilesRefs})
        > {
  $$ProtocolsTableTableManager(_$AppDatabase db, $ProtocolsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProtocolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProtocolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProtocolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => ProtocolsCompanion(
                id: id,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
              }) => ProtocolsCompanion.insert(
                id: id,
                name: name,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProtocolsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({apiProfilesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (apiProfilesRefs) db.apiProfiles],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (apiProfilesRefs)
                    await $_getPrefetchedData<
                      Protocol,
                      $ProtocolsTable,
                      ApiProfile
                    >(
                      currentTable: table,
                      referencedTable: $$ProtocolsTableReferences
                          ._apiProfilesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProtocolsTableReferences(
                            db,
                            table,
                            p0,
                          ).apiProfilesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.protocolId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProtocolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProtocolsTable,
      Protocol,
      $$ProtocolsTableFilterComposer,
      $$ProtocolsTableOrderingComposer,
      $$ProtocolsTableAnnotationComposer,
      $$ProtocolsTableCreateCompanionBuilder,
      $$ProtocolsTableUpdateCompanionBuilder,
      (Protocol, $$ProtocolsTableReferences),
      Protocol,
      PrefetchHooks Function({bool apiProfilesRefs})
    >;
typedef $$AuthenticationMethodsTableCreateCompanionBuilder =
    AuthenticationMethodsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> passwordEncoding,
      Value<bool> requiresNonce,
      Value<bool> requiresCsrf,
      Value<String?> notes,
    });
typedef $$AuthenticationMethodsTableUpdateCompanionBuilder =
    AuthenticationMethodsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> passwordEncoding,
      Value<bool> requiresNonce,
      Value<bool> requiresCsrf,
      Value<String?> notes,
    });

final class $$AuthenticationMethodsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AuthenticationMethodsTable,
          AuthenticationMethod
        > {
  $$AuthenticationMethodsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ApiProfilesTable, List<ApiProfile>>
  _apiProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.apiProfiles,
    aliasName: 'authentication_methods__id__api_profiles__authentication_id',
  );

  $$ApiProfilesTableProcessedTableManager get apiProfilesRefs {
    final manager = $$ApiProfilesTableTableManager(
      $_db,
      $_db.apiProfiles,
    ).filter((f) => f.authenticationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_apiProfilesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuthenticationMethodsTableFilterComposer
    extends Composer<_$AppDatabase, $AuthenticationMethodsTable> {
  $$AuthenticationMethodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordEncoding => $composableBuilder(
    column: $table.passwordEncoding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get requiresNonce => $composableBuilder(
    column: $table.requiresNonce,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get requiresCsrf => $composableBuilder(
    column: $table.requiresCsrf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> apiProfilesRefs(
    Expression<bool> Function($$ApiProfilesTableFilterComposer f) f,
  ) {
    final $$ApiProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.authenticationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableFilterComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthenticationMethodsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthenticationMethodsTable> {
  $$AuthenticationMethodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordEncoding => $composableBuilder(
    column: $table.passwordEncoding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get requiresNonce => $composableBuilder(
    column: $table.requiresNonce,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get requiresCsrf => $composableBuilder(
    column: $table.requiresCsrf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthenticationMethodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthenticationMethodsTable> {
  $$AuthenticationMethodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get passwordEncoding => $composableBuilder(
    column: $table.passwordEncoding,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get requiresNonce => $composableBuilder(
    column: $table.requiresNonce,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get requiresCsrf => $composableBuilder(
    column: $table.requiresCsrf,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> apiProfilesRefs<T extends Object>(
    Expression<T> Function($$ApiProfilesTableAnnotationComposer a) f,
  ) {
    final $$ApiProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.authenticationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthenticationMethodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthenticationMethodsTable,
          AuthenticationMethod,
          $$AuthenticationMethodsTableFilterComposer,
          $$AuthenticationMethodsTableOrderingComposer,
          $$AuthenticationMethodsTableAnnotationComposer,
          $$AuthenticationMethodsTableCreateCompanionBuilder,
          $$AuthenticationMethodsTableUpdateCompanionBuilder,
          (AuthenticationMethod, $$AuthenticationMethodsTableReferences),
          AuthenticationMethod,
          PrefetchHooks Function({bool apiProfilesRefs})
        > {
  $$AuthenticationMethodsTableTableManager(
    _$AppDatabase db,
    $AuthenticationMethodsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthenticationMethodsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AuthenticationMethodsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AuthenticationMethodsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> passwordEncoding = const Value.absent(),
                Value<bool> requiresNonce = const Value.absent(),
                Value<bool> requiresCsrf = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => AuthenticationMethodsCompanion(
                id: id,
                name: name,
                passwordEncoding: passwordEncoding,
                requiresNonce: requiresNonce,
                requiresCsrf: requiresCsrf,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> passwordEncoding = const Value.absent(),
                Value<bool> requiresNonce = const Value.absent(),
                Value<bool> requiresCsrf = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => AuthenticationMethodsCompanion.insert(
                id: id,
                name: name,
                passwordEncoding: passwordEncoding,
                requiresNonce: requiresNonce,
                requiresCsrf: requiresCsrf,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuthenticationMethodsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({apiProfilesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (apiProfilesRefs) db.apiProfiles],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (apiProfilesRefs)
                    await $_getPrefetchedData<
                      AuthenticationMethod,
                      $AuthenticationMethodsTable,
                      ApiProfile
                    >(
                      currentTable: table,
                      referencedTable: $$AuthenticationMethodsTableReferences
                          ._apiProfilesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AuthenticationMethodsTableReferences(
                            db,
                            table,
                            p0,
                          ).apiProfilesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.authenticationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AuthenticationMethodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthenticationMethodsTable,
      AuthenticationMethod,
      $$AuthenticationMethodsTableFilterComposer,
      $$AuthenticationMethodsTableOrderingComposer,
      $$AuthenticationMethodsTableAnnotationComposer,
      $$AuthenticationMethodsTableCreateCompanionBuilder,
      $$AuthenticationMethodsTableUpdateCompanionBuilder,
      (AuthenticationMethod, $$AuthenticationMethodsTableReferences),
      AuthenticationMethod,
      PrefetchHooks Function({bool apiProfilesRefs})
    >;
typedef $$DriversTableCreateCompanionBuilder =
    DriversCompanion Function({
      Value<int> id,
      required String name,
      required String driverClass,
      Value<String?> notes,
    });
typedef $$DriversTableUpdateCompanionBuilder =
    DriversCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> driverClass,
      Value<String?> notes,
    });

final class $$DriversTableReferences
    extends BaseReferences<_$AppDatabase, $DriversTable, Driver> {
  $$DriversTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ApiProfilesTable, List<ApiProfile>>
  _apiProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.apiProfiles,
    aliasName: 'drivers__id__api_profiles__default_driver_id',
  );

  $$ApiProfilesTableProcessedTableManager get apiProfilesRefs {
    final manager = $$ApiProfilesTableTableManager(
      $_db,
      $_db.apiProfiles,
    ).filter((f) => f.defaultDriverId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_apiProfilesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VersionRulesTable, List<VersionRule>>
  _versionRulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.versionRules,
    aliasName: 'drivers__id__version_rules__driver_id',
  );

  $$VersionRulesTableProcessedTableManager get versionRulesRefs {
    final manager = $$VersionRulesTableTableManager(
      $_db,
      $_db.versionRules,
    ).filter((f) => f.driverId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_versionRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DriversTableFilterComposer
    extends Composer<_$AppDatabase, $DriversTable> {
  $$DriversTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get driverClass => $composableBuilder(
    column: $table.driverClass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> apiProfilesRefs(
    Expression<bool> Function($$ApiProfilesTableFilterComposer f) f,
  ) {
    final $$ApiProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.defaultDriverId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableFilterComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> versionRulesRefs(
    Expression<bool> Function($$VersionRulesTableFilterComposer f) f,
  ) {
    final $$VersionRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versionRules,
      getReferencedColumn: (t) => t.driverId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersionRulesTableFilterComposer(
            $db: $db,
            $table: $db.versionRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DriversTableOrderingComposer
    extends Composer<_$AppDatabase, $DriversTable> {
  $$DriversTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get driverClass => $composableBuilder(
    column: $table.driverClass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DriversTableAnnotationComposer
    extends Composer<_$AppDatabase, $DriversTable> {
  $$DriversTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get driverClass => $composableBuilder(
    column: $table.driverClass,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> apiProfilesRefs<T extends Object>(
    Expression<T> Function($$ApiProfilesTableAnnotationComposer a) f,
  ) {
    final $$ApiProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.defaultDriverId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> versionRulesRefs<T extends Object>(
    Expression<T> Function($$VersionRulesTableAnnotationComposer a) f,
  ) {
    final $$VersionRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versionRules,
      getReferencedColumn: (t) => t.driverId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersionRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.versionRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DriversTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DriversTable,
          Driver,
          $$DriversTableFilterComposer,
          $$DriversTableOrderingComposer,
          $$DriversTableAnnotationComposer,
          $$DriversTableCreateCompanionBuilder,
          $$DriversTableUpdateCompanionBuilder,
          (Driver, $$DriversTableReferences),
          Driver,
          PrefetchHooks Function({bool apiProfilesRefs, bool versionRulesRefs})
        > {
  $$DriversTableTableManager(_$AppDatabase db, $DriversTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriversTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DriversTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriversTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> driverClass = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => DriversCompanion(
                id: id,
                name: name,
                driverClass: driverClass,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String driverClass,
                Value<String?> notes = const Value.absent(),
              }) => DriversCompanion.insert(
                id: id,
                name: name,
                driverClass: driverClass,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DriversTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({apiProfilesRefs = false, versionRulesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (apiProfilesRefs) db.apiProfiles,
                    if (versionRulesRefs) db.versionRules,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (apiProfilesRefs)
                        await $_getPrefetchedData<
                          Driver,
                          $DriversTable,
                          ApiProfile
                        >(
                          currentTable: table,
                          referencedTable: $$DriversTableReferences
                              ._apiProfilesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DriversTableReferences(
                                db,
                                table,
                                p0,
                              ).apiProfilesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.defaultDriverId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (versionRulesRefs)
                        await $_getPrefetchedData<
                          Driver,
                          $DriversTable,
                          VersionRule
                        >(
                          currentTable: table,
                          referencedTable: $$DriversTableReferences
                              ._versionRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DriversTableReferences(
                                db,
                                table,
                                p0,
                              ).versionRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.driverId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DriversTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DriversTable,
      Driver,
      $$DriversTableFilterComposer,
      $$DriversTableOrderingComposer,
      $$DriversTableAnnotationComposer,
      $$DriversTableCreateCompanionBuilder,
      $$DriversTableUpdateCompanionBuilder,
      (Driver, $$DriversTableReferences),
      Driver,
      PrefetchHooks Function({bool apiProfilesRefs, bool versionRulesRefs})
    >;
typedef $$ApiProfilesTableCreateCompanionBuilder =
    ApiProfilesCompanion Function({
      Value<int> id,
      required String name,
      required int protocolId,
      required int authenticationId,
      Value<String?> transport,
      Value<int?> defaultPort,
      Value<String?> baseUrl,
      Value<String?> basePath,
      Value<String?> loginEndpoint,
      Value<String?> logoutEndpoint,
      Value<bool> csrfEnabled,
      Value<String?> cookieName,
      Value<String?> sessionHeader,
      Value<int?> defaultDriverId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ApiProfilesTableUpdateCompanionBuilder =
    ApiProfilesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> protocolId,
      Value<int> authenticationId,
      Value<String?> transport,
      Value<int?> defaultPort,
      Value<String?> baseUrl,
      Value<String?> basePath,
      Value<String?> loginEndpoint,
      Value<String?> logoutEndpoint,
      Value<bool> csrfEnabled,
      Value<String?> cookieName,
      Value<String?> sessionHeader,
      Value<int?> defaultDriverId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ApiProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $ApiProfilesTable, ApiProfile> {
  $$ApiProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias('api_profiles__protocol_id__protocols__id');

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<int>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AuthenticationMethodsTable _authenticationIdTable(_$AppDatabase db) =>
      db.authenticationMethods.createAlias(
        'api_profiles__authentication_id__authentication_methods__id',
      );

  $$AuthenticationMethodsTableProcessedTableManager get authenticationId {
    final $_column = $_itemColumn<int>('authentication_id')!;

    final manager = $$AuthenticationMethodsTableTableManager(
      $_db,
      $_db.authenticationMethods,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authenticationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DriversTable _defaultDriverIdTable(_$AppDatabase db) =>
      db.drivers.createAlias('api_profiles__default_driver_id__drivers__id');

  $$DriversTableProcessedTableManager? get defaultDriverId {
    final $_column = $_itemColumn<int>('default_driver_id');
    if ($_column == null) return null;
    final manager = $$DriversTableTableManager(
      $_db,
      $_db.drivers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_defaultDriverIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FirmwaresTable, List<Firmware>>
  _firmwaresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.firmwares,
    aliasName: 'api_profiles__id__firmwares__api_profile_id',
  );

  $$FirmwaresTableProcessedTableManager get firmwaresRefs {
    final manager = $$FirmwaresTableTableManager(
      $_db,
      $_db.firmwares,
    ).filter((f) => f.apiProfileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_firmwaresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EndpointsTable, List<Endpoint>>
  _endpointsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.endpoints,
    aliasName: 'api_profiles__id__endpoints__api_profile_id',
  );

  $$EndpointsTableProcessedTableManager get endpointsRefs {
    final manager = $$EndpointsTableTableManager(
      $_db,
      $_db.endpoints,
    ).filter((f) => f.apiProfileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_endpointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VersionRulesTable, List<VersionRule>>
  _versionRulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.versionRules,
    aliasName: 'api_profiles__id__version_rules__api_profile_id',
  );

  $$VersionRulesTableProcessedTableManager get versionRulesRefs {
    final manager = $$VersionRulesTableTableManager(
      $_db,
      $_db.versionRules,
    ).filter((f) => f.apiProfileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_versionRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ApiProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ApiProfilesTable> {
  $$ApiProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transport => $composableBuilder(
    column: $table.transport,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultPort => $composableBuilder(
    column: $table.defaultPort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get basePath => $composableBuilder(
    column: $table.basePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get loginEndpoint => $composableBuilder(
    column: $table.loginEndpoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoutEndpoint => $composableBuilder(
    column: $table.logoutEndpoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get csrfEnabled => $composableBuilder(
    column: $table.csrfEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cookieName => $composableBuilder(
    column: $table.cookieName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionHeader => $composableBuilder(
    column: $table.sessionHeader,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthenticationMethodsTableFilterComposer get authenticationId {
    final $$AuthenticationMethodsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.authenticationId,
          referencedTable: $db.authenticationMethods,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AuthenticationMethodsTableFilterComposer(
                $db: $db,
                $table: $db.authenticationMethods,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$DriversTableFilterComposer get defaultDriverId {
    final $$DriversTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.defaultDriverId,
      referencedTable: $db.drivers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DriversTableFilterComposer(
            $db: $db,
            $table: $db.drivers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> firmwaresRefs(
    Expression<bool> Function($$FirmwaresTableFilterComposer f) f,
  ) {
    final $$FirmwaresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.apiProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableFilterComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> endpointsRefs(
    Expression<bool> Function($$EndpointsTableFilterComposer f) f,
  ) {
    final $$EndpointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.endpoints,
      getReferencedColumn: (t) => t.apiProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndpointsTableFilterComposer(
            $db: $db,
            $table: $db.endpoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> versionRulesRefs(
    Expression<bool> Function($$VersionRulesTableFilterComposer f) f,
  ) {
    final $$VersionRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versionRules,
      getReferencedColumn: (t) => t.apiProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersionRulesTableFilterComposer(
            $db: $db,
            $table: $db.versionRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApiProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ApiProfilesTable> {
  $$ApiProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transport => $composableBuilder(
    column: $table.transport,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultPort => $composableBuilder(
    column: $table.defaultPort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get basePath => $composableBuilder(
    column: $table.basePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get loginEndpoint => $composableBuilder(
    column: $table.loginEndpoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoutEndpoint => $composableBuilder(
    column: $table.logoutEndpoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get csrfEnabled => $composableBuilder(
    column: $table.csrfEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cookieName => $composableBuilder(
    column: $table.cookieName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionHeader => $composableBuilder(
    column: $table.sessionHeader,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthenticationMethodsTableOrderingComposer get authenticationId {
    final $$AuthenticationMethodsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.authenticationId,
          referencedTable: $db.authenticationMethods,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AuthenticationMethodsTableOrderingComposer(
                $db: $db,
                $table: $db.authenticationMethods,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$DriversTableOrderingComposer get defaultDriverId {
    final $$DriversTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.defaultDriverId,
      referencedTable: $db.drivers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DriversTableOrderingComposer(
            $db: $db,
            $table: $db.drivers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ApiProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ApiProfilesTable> {
  $$ApiProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get transport =>
      $composableBuilder(column: $table.transport, builder: (column) => column);

  GeneratedColumn<int> get defaultPort => $composableBuilder(
    column: $table.defaultPort,
    builder: (column) => column,
  );

  GeneratedColumn<String> get baseUrl =>
      $composableBuilder(column: $table.baseUrl, builder: (column) => column);

  GeneratedColumn<String> get basePath =>
      $composableBuilder(column: $table.basePath, builder: (column) => column);

  GeneratedColumn<String> get loginEndpoint => $composableBuilder(
    column: $table.loginEndpoint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoutEndpoint => $composableBuilder(
    column: $table.logoutEndpoint,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get csrfEnabled => $composableBuilder(
    column: $table.csrfEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cookieName => $composableBuilder(
    column: $table.cookieName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionHeader => $composableBuilder(
    column: $table.sessionHeader,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthenticationMethodsTableAnnotationComposer get authenticationId {
    final $$AuthenticationMethodsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.authenticationId,
          referencedTable: $db.authenticationMethods,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AuthenticationMethodsTableAnnotationComposer(
                $db: $db,
                $table: $db.authenticationMethods,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$DriversTableAnnotationComposer get defaultDriverId {
    final $$DriversTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.defaultDriverId,
      referencedTable: $db.drivers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DriversTableAnnotationComposer(
            $db: $db,
            $table: $db.drivers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> firmwaresRefs<T extends Object>(
    Expression<T> Function($$FirmwaresTableAnnotationComposer a) f,
  ) {
    final $$FirmwaresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.apiProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableAnnotationComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> endpointsRefs<T extends Object>(
    Expression<T> Function($$EndpointsTableAnnotationComposer a) f,
  ) {
    final $$EndpointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.endpoints,
      getReferencedColumn: (t) => t.apiProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndpointsTableAnnotationComposer(
            $db: $db,
            $table: $db.endpoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> versionRulesRefs<T extends Object>(
    Expression<T> Function($$VersionRulesTableAnnotationComposer a) f,
  ) {
    final $$VersionRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versionRules,
      getReferencedColumn: (t) => t.apiProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersionRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.versionRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApiProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ApiProfilesTable,
          ApiProfile,
          $$ApiProfilesTableFilterComposer,
          $$ApiProfilesTableOrderingComposer,
          $$ApiProfilesTableAnnotationComposer,
          $$ApiProfilesTableCreateCompanionBuilder,
          $$ApiProfilesTableUpdateCompanionBuilder,
          (ApiProfile, $$ApiProfilesTableReferences),
          ApiProfile,
          PrefetchHooks Function({
            bool protocolId,
            bool authenticationId,
            bool defaultDriverId,
            bool firmwaresRefs,
            bool endpointsRefs,
            bool versionRulesRefs,
          })
        > {
  $$ApiProfilesTableTableManager(_$AppDatabase db, $ApiProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ApiProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ApiProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ApiProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> protocolId = const Value.absent(),
                Value<int> authenticationId = const Value.absent(),
                Value<String?> transport = const Value.absent(),
                Value<int?> defaultPort = const Value.absent(),
                Value<String?> baseUrl = const Value.absent(),
                Value<String?> basePath = const Value.absent(),
                Value<String?> loginEndpoint = const Value.absent(),
                Value<String?> logoutEndpoint = const Value.absent(),
                Value<bool> csrfEnabled = const Value.absent(),
                Value<String?> cookieName = const Value.absent(),
                Value<String?> sessionHeader = const Value.absent(),
                Value<int?> defaultDriverId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ApiProfilesCompanion(
                id: id,
                name: name,
                protocolId: protocolId,
                authenticationId: authenticationId,
                transport: transport,
                defaultPort: defaultPort,
                baseUrl: baseUrl,
                basePath: basePath,
                loginEndpoint: loginEndpoint,
                logoutEndpoint: logoutEndpoint,
                csrfEnabled: csrfEnabled,
                cookieName: cookieName,
                sessionHeader: sessionHeader,
                defaultDriverId: defaultDriverId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int protocolId,
                required int authenticationId,
                Value<String?> transport = const Value.absent(),
                Value<int?> defaultPort = const Value.absent(),
                Value<String?> baseUrl = const Value.absent(),
                Value<String?> basePath = const Value.absent(),
                Value<String?> loginEndpoint = const Value.absent(),
                Value<String?> logoutEndpoint = const Value.absent(),
                Value<bool> csrfEnabled = const Value.absent(),
                Value<String?> cookieName = const Value.absent(),
                Value<String?> sessionHeader = const Value.absent(),
                Value<int?> defaultDriverId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ApiProfilesCompanion.insert(
                id: id,
                name: name,
                protocolId: protocolId,
                authenticationId: authenticationId,
                transport: transport,
                defaultPort: defaultPort,
                baseUrl: baseUrl,
                basePath: basePath,
                loginEndpoint: loginEndpoint,
                logoutEndpoint: logoutEndpoint,
                csrfEnabled: csrfEnabled,
                cookieName: cookieName,
                sessionHeader: sessionHeader,
                defaultDriverId: defaultDriverId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ApiProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                protocolId = false,
                authenticationId = false,
                defaultDriverId = false,
                firmwaresRefs = false,
                endpointsRefs = false,
                versionRulesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (firmwaresRefs) db.firmwares,
                    if (endpointsRefs) db.endpoints,
                    if (versionRulesRefs) db.versionRules,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (protocolId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.protocolId,
                                    referencedTable:
                                        $$ApiProfilesTableReferences
                                            ._protocolIdTable(db),
                                    referencedColumn:
                                        $$ApiProfilesTableReferences
                                            ._protocolIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (authenticationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.authenticationId,
                                    referencedTable:
                                        $$ApiProfilesTableReferences
                                            ._authenticationIdTable(db),
                                    referencedColumn:
                                        $$ApiProfilesTableReferences
                                            ._authenticationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (defaultDriverId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.defaultDriverId,
                                    referencedTable:
                                        $$ApiProfilesTableReferences
                                            ._defaultDriverIdTable(db),
                                    referencedColumn:
                                        $$ApiProfilesTableReferences
                                            ._defaultDriverIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (firmwaresRefs)
                        await $_getPrefetchedData<
                          ApiProfile,
                          $ApiProfilesTable,
                          Firmware
                        >(
                          currentTable: table,
                          referencedTable: $$ApiProfilesTableReferences
                              ._firmwaresRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ApiProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).firmwaresRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.apiProfileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (endpointsRefs)
                        await $_getPrefetchedData<
                          ApiProfile,
                          $ApiProfilesTable,
                          Endpoint
                        >(
                          currentTable: table,
                          referencedTable: $$ApiProfilesTableReferences
                              ._endpointsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ApiProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).endpointsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.apiProfileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (versionRulesRefs)
                        await $_getPrefetchedData<
                          ApiProfile,
                          $ApiProfilesTable,
                          VersionRule
                        >(
                          currentTable: table,
                          referencedTable: $$ApiProfilesTableReferences
                              ._versionRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ApiProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).versionRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.apiProfileId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ApiProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ApiProfilesTable,
      ApiProfile,
      $$ApiProfilesTableFilterComposer,
      $$ApiProfilesTableOrderingComposer,
      $$ApiProfilesTableAnnotationComposer,
      $$ApiProfilesTableCreateCompanionBuilder,
      $$ApiProfilesTableUpdateCompanionBuilder,
      (ApiProfile, $$ApiProfilesTableReferences),
      ApiProfile,
      PrefetchHooks Function({
        bool protocolId,
        bool authenticationId,
        bool defaultDriverId,
        bool firmwaresRefs,
        bool endpointsRefs,
        bool versionRulesRefs,
      })
    >;
typedef $$FirmwaresTableCreateCompanionBuilder =
    FirmwaresCompanion Function({
      Value<int> id,
      required int brandId,
      required int firmwareTypeId,
      required int apiProfileId,
      required String version,
    });
typedef $$FirmwaresTableUpdateCompanionBuilder =
    FirmwaresCompanion Function({
      Value<int> id,
      Value<int> brandId,
      Value<int> firmwareTypeId,
      Value<int> apiProfileId,
      Value<String> version,
    });

final class $$FirmwaresTableReferences
    extends BaseReferences<_$AppDatabase, $FirmwaresTable, Firmware> {
  $$FirmwaresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BrandsTable _brandIdTable(_$AppDatabase db) =>
      db.brands.createAlias('firmwares__brand_id__brands__id');

  $$BrandsTableProcessedTableManager get brandId {
    final $_column = $_itemColumn<int>('brand_id')!;

    final manager = $$BrandsTableTableManager(
      $_db,
      $_db.brands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_brandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FirmwareTypesTable _firmwareTypeIdTable(_$AppDatabase db) => db
      .firmwareTypes
      .createAlias('firmwares__firmware_type_id__firmware_types__id');

  $$FirmwareTypesTableProcessedTableManager get firmwareTypeId {
    final $_column = $_itemColumn<int>('firmware_type_id')!;

    final manager = $$FirmwareTypesTableTableManager(
      $_db,
      $_db.firmwareTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firmwareTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ApiProfilesTable _apiProfileIdTable(_$AppDatabase db) =>
      db.apiProfiles.createAlias('firmwares__api_profile_id__api_profiles__id');

  $$ApiProfilesTableProcessedTableManager get apiProfileId {
    final $_column = $_itemColumn<int>('api_profile_id')!;

    final manager = $$ApiProfilesTableTableManager(
      $_db,
      $_db.apiProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_apiProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $FirmwareCapabilitiesTable,
    List<FirmwareCapability>
  >
  _firmwareCapabilitiesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.firmwareCapabilities,
        aliasName: 'firmwares__id__firmware_capabilities__firmware_id',
      );

  $$FirmwareCapabilitiesTableProcessedTableManager
  get firmwareCapabilitiesRefs {
    final manager = $$FirmwareCapabilitiesTableTableManager(
      $_db,
      $_db.firmwareCapabilities,
    ).filter((f) => f.firmwareId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _firmwareCapabilitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FingerprintsTable, List<Fingerprint>>
  _fingerprintsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.fingerprints,
    aliasName: 'firmwares__id__fingerprints__firmware_id',
  );

  $$FingerprintsTableProcessedTableManager get fingerprintsRefs {
    final manager = $$FingerprintsTableTableManager(
      $_db,
      $_db.fingerprints,
    ).filter((f) => f.firmwareId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_fingerprintsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FirmwaresTableFilterComposer
    extends Composer<_$AppDatabase, $FirmwaresTable> {
  $$FirmwaresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  $$BrandsTableFilterComposer get brandId {
    final $$BrandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableFilterComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FirmwareTypesTableFilterComposer get firmwareTypeId {
    final $$FirmwareTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareTypeId,
      referencedTable: $db.firmwareTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwareTypesTableFilterComposer(
            $db: $db,
            $table: $db.firmwareTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ApiProfilesTableFilterComposer get apiProfileId {
    final $$ApiProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableFilterComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> firmwareCapabilitiesRefs(
    Expression<bool> Function($$FirmwareCapabilitiesTableFilterComposer f) f,
  ) {
    final $$FirmwareCapabilitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwareCapabilities,
      getReferencedColumn: (t) => t.firmwareId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwareCapabilitiesTableFilterComposer(
            $db: $db,
            $table: $db.firmwareCapabilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> fingerprintsRefs(
    Expression<bool> Function($$FingerprintsTableFilterComposer f) f,
  ) {
    final $$FingerprintsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.fingerprints,
      getReferencedColumn: (t) => t.firmwareId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FingerprintsTableFilterComposer(
            $db: $db,
            $table: $db.fingerprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FirmwaresTableOrderingComposer
    extends Composer<_$AppDatabase, $FirmwaresTable> {
  $$FirmwaresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  $$BrandsTableOrderingComposer get brandId {
    final $$BrandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableOrderingComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FirmwareTypesTableOrderingComposer get firmwareTypeId {
    final $$FirmwareTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareTypeId,
      referencedTable: $db.firmwareTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwareTypesTableOrderingComposer(
            $db: $db,
            $table: $db.firmwareTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ApiProfilesTableOrderingComposer get apiProfileId {
    final $$ApiProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FirmwaresTableAnnotationComposer
    extends Composer<_$AppDatabase, $FirmwaresTable> {
  $$FirmwaresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  $$BrandsTableAnnotationComposer get brandId {
    final $$BrandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableAnnotationComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FirmwareTypesTableAnnotationComposer get firmwareTypeId {
    final $$FirmwareTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareTypeId,
      referencedTable: $db.firmwareTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwareTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.firmwareTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ApiProfilesTableAnnotationComposer get apiProfileId {
    final $$ApiProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> firmwareCapabilitiesRefs<T extends Object>(
    Expression<T> Function($$FirmwareCapabilitiesTableAnnotationComposer a) f,
  ) {
    final $$FirmwareCapabilitiesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.firmwareCapabilities,
          getReferencedColumn: (t) => t.firmwareId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FirmwareCapabilitiesTableAnnotationComposer(
                $db: $db,
                $table: $db.firmwareCapabilities,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> fingerprintsRefs<T extends Object>(
    Expression<T> Function($$FingerprintsTableAnnotationComposer a) f,
  ) {
    final $$FingerprintsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.fingerprints,
      getReferencedColumn: (t) => t.firmwareId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FingerprintsTableAnnotationComposer(
            $db: $db,
            $table: $db.fingerprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FirmwaresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FirmwaresTable,
          Firmware,
          $$FirmwaresTableFilterComposer,
          $$FirmwaresTableOrderingComposer,
          $$FirmwaresTableAnnotationComposer,
          $$FirmwaresTableCreateCompanionBuilder,
          $$FirmwaresTableUpdateCompanionBuilder,
          (Firmware, $$FirmwaresTableReferences),
          Firmware,
          PrefetchHooks Function({
            bool brandId,
            bool firmwareTypeId,
            bool apiProfileId,
            bool firmwareCapabilitiesRefs,
            bool fingerprintsRefs,
          })
        > {
  $$FirmwaresTableTableManager(_$AppDatabase db, $FirmwaresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FirmwaresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FirmwaresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FirmwaresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> brandId = const Value.absent(),
                Value<int> firmwareTypeId = const Value.absent(),
                Value<int> apiProfileId = const Value.absent(),
                Value<String> version = const Value.absent(),
              }) => FirmwaresCompanion(
                id: id,
                brandId: brandId,
                firmwareTypeId: firmwareTypeId,
                apiProfileId: apiProfileId,
                version: version,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int brandId,
                required int firmwareTypeId,
                required int apiProfileId,
                required String version,
              }) => FirmwaresCompanion.insert(
                id: id,
                brandId: brandId,
                firmwareTypeId: firmwareTypeId,
                apiProfileId: apiProfileId,
                version: version,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FirmwaresTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                brandId = false,
                firmwareTypeId = false,
                apiProfileId = false,
                firmwareCapabilitiesRefs = false,
                fingerprintsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (firmwareCapabilitiesRefs) db.firmwareCapabilities,
                    if (fingerprintsRefs) db.fingerprints,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (brandId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.brandId,
                                    referencedTable: $$FirmwaresTableReferences
                                        ._brandIdTable(db),
                                    referencedColumn: $$FirmwaresTableReferences
                                        ._brandIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (firmwareTypeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.firmwareTypeId,
                                    referencedTable: $$FirmwaresTableReferences
                                        ._firmwareTypeIdTable(db),
                                    referencedColumn: $$FirmwaresTableReferences
                                        ._firmwareTypeIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (apiProfileId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.apiProfileId,
                                    referencedTable: $$FirmwaresTableReferences
                                        ._apiProfileIdTable(db),
                                    referencedColumn: $$FirmwaresTableReferences
                                        ._apiProfileIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (firmwareCapabilitiesRefs)
                        await $_getPrefetchedData<
                          Firmware,
                          $FirmwaresTable,
                          FirmwareCapability
                        >(
                          currentTable: table,
                          referencedTable: $$FirmwaresTableReferences
                              ._firmwareCapabilitiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FirmwaresTableReferences(
                                db,
                                table,
                                p0,
                              ).firmwareCapabilitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.firmwareId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (fingerprintsRefs)
                        await $_getPrefetchedData<
                          Firmware,
                          $FirmwaresTable,
                          Fingerprint
                        >(
                          currentTable: table,
                          referencedTable: $$FirmwaresTableReferences
                              ._fingerprintsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FirmwaresTableReferences(
                                db,
                                table,
                                p0,
                              ).fingerprintsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.firmwareId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FirmwaresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FirmwaresTable,
      Firmware,
      $$FirmwaresTableFilterComposer,
      $$FirmwaresTableOrderingComposer,
      $$FirmwaresTableAnnotationComposer,
      $$FirmwaresTableCreateCompanionBuilder,
      $$FirmwaresTableUpdateCompanionBuilder,
      (Firmware, $$FirmwaresTableReferences),
      Firmware,
      PrefetchHooks Function({
        bool brandId,
        bool firmwareTypeId,
        bool apiProfileId,
        bool firmwareCapabilitiesRefs,
        bool fingerprintsRefs,
      })
    >;
typedef $$EndpointsTableCreateCompanionBuilder =
    EndpointsCompanion Function({
      Value<int> id,
      required int apiProfileId,
      required String category,
      required String operation,
      Value<String?> httpMethod,
      required String path,
      Value<bool> requiresAuth,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$EndpointsTableUpdateCompanionBuilder =
    EndpointsCompanion Function({
      Value<int> id,
      Value<int> apiProfileId,
      Value<String> category,
      Value<String> operation,
      Value<String?> httpMethod,
      Value<String> path,
      Value<bool> requiresAuth,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$EndpointsTableReferences
    extends BaseReferences<_$AppDatabase, $EndpointsTable, Endpoint> {
  $$EndpointsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ApiProfilesTable _apiProfileIdTable(_$AppDatabase db) =>
      db.apiProfiles.createAlias('endpoints__api_profile_id__api_profiles__id');

  $$ApiProfilesTableProcessedTableManager get apiProfileId {
    final $_column = $_itemColumn<int>('api_profile_id')!;

    final manager = $$ApiProfilesTableTableManager(
      $_db,
      $_db.apiProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_apiProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EndpointsTableFilterComposer
    extends Composer<_$AppDatabase, $EndpointsTable> {
  $$EndpointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get httpMethod => $composableBuilder(
    column: $table.httpMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ApiProfilesTableFilterComposer get apiProfileId {
    final $$ApiProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableFilterComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EndpointsTableOrderingComposer
    extends Composer<_$AppDatabase, $EndpointsTable> {
  $$EndpointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get httpMethod => $composableBuilder(
    column: $table.httpMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ApiProfilesTableOrderingComposer get apiProfileId {
    final $$ApiProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EndpointsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EndpointsTable> {
  $$EndpointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get httpMethod => $composableBuilder(
    column: $table.httpMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ApiProfilesTableAnnotationComposer get apiProfileId {
    final $$ApiProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EndpointsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EndpointsTable,
          Endpoint,
          $$EndpointsTableFilterComposer,
          $$EndpointsTableOrderingComposer,
          $$EndpointsTableAnnotationComposer,
          $$EndpointsTableCreateCompanionBuilder,
          $$EndpointsTableUpdateCompanionBuilder,
          (Endpoint, $$EndpointsTableReferences),
          Endpoint,
          PrefetchHooks Function({bool apiProfileId})
        > {
  $$EndpointsTableTableManager(_$AppDatabase db, $EndpointsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EndpointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EndpointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EndpointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> apiProfileId = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String?> httpMethod = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<bool> requiresAuth = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => EndpointsCompanion(
                id: id,
                apiProfileId: apiProfileId,
                category: category,
                operation: operation,
                httpMethod: httpMethod,
                path: path,
                requiresAuth: requiresAuth,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int apiProfileId,
                required String category,
                required String operation,
                Value<String?> httpMethod = const Value.absent(),
                required String path,
                Value<bool> requiresAuth = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => EndpointsCompanion.insert(
                id: id,
                apiProfileId: apiProfileId,
                category: category,
                operation: operation,
                httpMethod: httpMethod,
                path: path,
                requiresAuth: requiresAuth,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EndpointsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({apiProfileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (apiProfileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.apiProfileId,
                                referencedTable: $$EndpointsTableReferences
                                    ._apiProfileIdTable(db),
                                referencedColumn: $$EndpointsTableReferences
                                    ._apiProfileIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EndpointsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EndpointsTable,
      Endpoint,
      $$EndpointsTableFilterComposer,
      $$EndpointsTableOrderingComposer,
      $$EndpointsTableAnnotationComposer,
      $$EndpointsTableCreateCompanionBuilder,
      $$EndpointsTableUpdateCompanionBuilder,
      (Endpoint, $$EndpointsTableReferences),
      Endpoint,
      PrefetchHooks Function({bool apiProfileId})
    >;
typedef $$CapabilitiesTableCreateCompanionBuilder =
    CapabilitiesCompanion Function({
      Value<int> id,
      required String key,
      required String name,
      Value<String?> description,
    });
typedef $$CapabilitiesTableUpdateCompanionBuilder =
    CapabilitiesCompanion Function({
      Value<int> id,
      Value<String> key,
      Value<String> name,
      Value<String?> description,
    });

final class $$CapabilitiesTableReferences
    extends BaseReferences<_$AppDatabase, $CapabilitiesTable, Capability> {
  $$CapabilitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $FirmwareCapabilitiesTable,
    List<FirmwareCapability>
  >
  _firmwareCapabilitiesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.firmwareCapabilities,
        aliasName: 'capabilities__id__firmware_capabilities__capability_id',
      );

  $$FirmwareCapabilitiesTableProcessedTableManager
  get firmwareCapabilitiesRefs {
    final manager = $$FirmwareCapabilitiesTableTableManager(
      $_db,
      $_db.firmwareCapabilities,
    ).filter((f) => f.capabilityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _firmwareCapabilitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CapabilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $CapabilitiesTable> {
  $$CapabilitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> firmwareCapabilitiesRefs(
    Expression<bool> Function($$FirmwareCapabilitiesTableFilterComposer f) f,
  ) {
    final $$FirmwareCapabilitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.firmwareCapabilities,
      getReferencedColumn: (t) => t.capabilityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwareCapabilitiesTableFilterComposer(
            $db: $db,
            $table: $db.firmwareCapabilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CapabilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $CapabilitiesTable> {
  $$CapabilitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CapabilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CapabilitiesTable> {
  $$CapabilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> firmwareCapabilitiesRefs<T extends Object>(
    Expression<T> Function($$FirmwareCapabilitiesTableAnnotationComposer a) f,
  ) {
    final $$FirmwareCapabilitiesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.firmwareCapabilities,
          getReferencedColumn: (t) => t.capabilityId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FirmwareCapabilitiesTableAnnotationComposer(
                $db: $db,
                $table: $db.firmwareCapabilities,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CapabilitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CapabilitiesTable,
          Capability,
          $$CapabilitiesTableFilterComposer,
          $$CapabilitiesTableOrderingComposer,
          $$CapabilitiesTableAnnotationComposer,
          $$CapabilitiesTableCreateCompanionBuilder,
          $$CapabilitiesTableUpdateCompanionBuilder,
          (Capability, $$CapabilitiesTableReferences),
          Capability,
          PrefetchHooks Function({bool firmwareCapabilitiesRefs})
        > {
  $$CapabilitiesTableTableManager(_$AppDatabase db, $CapabilitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CapabilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CapabilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CapabilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => CapabilitiesCompanion(
                id: id,
                key: key,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String key,
                required String name,
                Value<String?> description = const Value.absent(),
              }) => CapabilitiesCompanion.insert(
                id: id,
                key: key,
                name: name,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CapabilitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({firmwareCapabilitiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (firmwareCapabilitiesRefs) db.firmwareCapabilities,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (firmwareCapabilitiesRefs)
                    await $_getPrefetchedData<
                      Capability,
                      $CapabilitiesTable,
                      FirmwareCapability
                    >(
                      currentTable: table,
                      referencedTable: $$CapabilitiesTableReferences
                          ._firmwareCapabilitiesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CapabilitiesTableReferences(
                            db,
                            table,
                            p0,
                          ).firmwareCapabilitiesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.capabilityId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CapabilitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CapabilitiesTable,
      Capability,
      $$CapabilitiesTableFilterComposer,
      $$CapabilitiesTableOrderingComposer,
      $$CapabilitiesTableAnnotationComposer,
      $$CapabilitiesTableCreateCompanionBuilder,
      $$CapabilitiesTableUpdateCompanionBuilder,
      (Capability, $$CapabilitiesTableReferences),
      Capability,
      PrefetchHooks Function({bool firmwareCapabilitiesRefs})
    >;
typedef $$FirmwareCapabilitiesTableCreateCompanionBuilder =
    FirmwareCapabilitiesCompanion Function({
      Value<int> id,
      required int firmwareId,
      required int capabilityId,
      Value<bool> supported,
    });
typedef $$FirmwareCapabilitiesTableUpdateCompanionBuilder =
    FirmwareCapabilitiesCompanion Function({
      Value<int> id,
      Value<int> firmwareId,
      Value<int> capabilityId,
      Value<bool> supported,
    });

final class $$FirmwareCapabilitiesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FirmwareCapabilitiesTable,
          FirmwareCapability
        > {
  $$FirmwareCapabilitiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FirmwaresTable _firmwareIdTable(_$AppDatabase db) => db.firmwares
      .createAlias('firmware_capabilities__firmware_id__firmwares__id');

  $$FirmwaresTableProcessedTableManager get firmwareId {
    final $_column = $_itemColumn<int>('firmware_id')!;

    final manager = $$FirmwaresTableTableManager(
      $_db,
      $_db.firmwares,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firmwareIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CapabilitiesTable _capabilityIdTable(_$AppDatabase db) => db
      .capabilities
      .createAlias('firmware_capabilities__capability_id__capabilities__id');

  $$CapabilitiesTableProcessedTableManager get capabilityId {
    final $_column = $_itemColumn<int>('capability_id')!;

    final manager = $$CapabilitiesTableTableManager(
      $_db,
      $_db.capabilities,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_capabilityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FirmwareCapabilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $FirmwareCapabilitiesTable> {
  $$FirmwareCapabilitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supported => $composableBuilder(
    column: $table.supported,
    builder: (column) => ColumnFilters(column),
  );

  $$FirmwaresTableFilterComposer get firmwareId {
    final $$FirmwaresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareId,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableFilterComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CapabilitiesTableFilterComposer get capabilityId {
    final $$CapabilitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.capabilityId,
      referencedTable: $db.capabilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CapabilitiesTableFilterComposer(
            $db: $db,
            $table: $db.capabilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FirmwareCapabilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $FirmwareCapabilitiesTable> {
  $$FirmwareCapabilitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supported => $composableBuilder(
    column: $table.supported,
    builder: (column) => ColumnOrderings(column),
  );

  $$FirmwaresTableOrderingComposer get firmwareId {
    final $$FirmwaresTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareId,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableOrderingComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CapabilitiesTableOrderingComposer get capabilityId {
    final $$CapabilitiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.capabilityId,
      referencedTable: $db.capabilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CapabilitiesTableOrderingComposer(
            $db: $db,
            $table: $db.capabilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FirmwareCapabilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FirmwareCapabilitiesTable> {
  $$FirmwareCapabilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get supported =>
      $composableBuilder(column: $table.supported, builder: (column) => column);

  $$FirmwaresTableAnnotationComposer get firmwareId {
    final $$FirmwaresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareId,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableAnnotationComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CapabilitiesTableAnnotationComposer get capabilityId {
    final $$CapabilitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.capabilityId,
      referencedTable: $db.capabilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CapabilitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.capabilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FirmwareCapabilitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FirmwareCapabilitiesTable,
          FirmwareCapability,
          $$FirmwareCapabilitiesTableFilterComposer,
          $$FirmwareCapabilitiesTableOrderingComposer,
          $$FirmwareCapabilitiesTableAnnotationComposer,
          $$FirmwareCapabilitiesTableCreateCompanionBuilder,
          $$FirmwareCapabilitiesTableUpdateCompanionBuilder,
          (FirmwareCapability, $$FirmwareCapabilitiesTableReferences),
          FirmwareCapability,
          PrefetchHooks Function({bool firmwareId, bool capabilityId})
        > {
  $$FirmwareCapabilitiesTableTableManager(
    _$AppDatabase db,
    $FirmwareCapabilitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FirmwareCapabilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FirmwareCapabilitiesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FirmwareCapabilitiesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> firmwareId = const Value.absent(),
                Value<int> capabilityId = const Value.absent(),
                Value<bool> supported = const Value.absent(),
              }) => FirmwareCapabilitiesCompanion(
                id: id,
                firmwareId: firmwareId,
                capabilityId: capabilityId,
                supported: supported,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int firmwareId,
                required int capabilityId,
                Value<bool> supported = const Value.absent(),
              }) => FirmwareCapabilitiesCompanion.insert(
                id: id,
                firmwareId: firmwareId,
                capabilityId: capabilityId,
                supported: supported,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FirmwareCapabilitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({firmwareId = false, capabilityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (firmwareId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.firmwareId,
                                referencedTable:
                                    $$FirmwareCapabilitiesTableReferences
                                        ._firmwareIdTable(db),
                                referencedColumn:
                                    $$FirmwareCapabilitiesTableReferences
                                        ._firmwareIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (capabilityId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.capabilityId,
                                referencedTable:
                                    $$FirmwareCapabilitiesTableReferences
                                        ._capabilityIdTable(db),
                                referencedColumn:
                                    $$FirmwareCapabilitiesTableReferences
                                        ._capabilityIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FirmwareCapabilitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FirmwareCapabilitiesTable,
      FirmwareCapability,
      $$FirmwareCapabilitiesTableFilterComposer,
      $$FirmwareCapabilitiesTableOrderingComposer,
      $$FirmwareCapabilitiesTableAnnotationComposer,
      $$FirmwareCapabilitiesTableCreateCompanionBuilder,
      $$FirmwareCapabilitiesTableUpdateCompanionBuilder,
      (FirmwareCapability, $$FirmwareCapabilitiesTableReferences),
      FirmwareCapability,
      PrefetchHooks Function({bool firmwareId, bool capabilityId})
    >;
typedef $$FingerprintsTableCreateCompanionBuilder =
    FingerprintsCompanion Function({
      Value<int> id,
      Value<int?> brandId,
      Value<int?> firmwareId,
      required String matchType,
      required String matchValue,
      Value<int> confidence,
    });
typedef $$FingerprintsTableUpdateCompanionBuilder =
    FingerprintsCompanion Function({
      Value<int> id,
      Value<int?> brandId,
      Value<int?> firmwareId,
      Value<String> matchType,
      Value<String> matchValue,
      Value<int> confidence,
    });

final class $$FingerprintsTableReferences
    extends BaseReferences<_$AppDatabase, $FingerprintsTable, Fingerprint> {
  $$FingerprintsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BrandsTable _brandIdTable(_$AppDatabase db) =>
      db.brands.createAlias('fingerprints__brand_id__brands__id');

  $$BrandsTableProcessedTableManager? get brandId {
    final $_column = $_itemColumn<int>('brand_id');
    if ($_column == null) return null;
    final manager = $$BrandsTableTableManager(
      $_db,
      $_db.brands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_brandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FirmwaresTable _firmwareIdTable(_$AppDatabase db) =>
      db.firmwares.createAlias('fingerprints__firmware_id__firmwares__id');

  $$FirmwaresTableProcessedTableManager? get firmwareId {
    final $_column = $_itemColumn<int>('firmware_id');
    if ($_column == null) return null;
    final manager = $$FirmwaresTableTableManager(
      $_db,
      $_db.firmwares,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firmwareIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FingerprintsTableFilterComposer
    extends Composer<_$AppDatabase, $FingerprintsTable> {
  $$FingerprintsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get matchType => $composableBuilder(
    column: $table.matchType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get matchValue => $composableBuilder(
    column: $table.matchValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  $$BrandsTableFilterComposer get brandId {
    final $$BrandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableFilterComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FirmwaresTableFilterComposer get firmwareId {
    final $$FirmwaresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareId,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableFilterComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FingerprintsTableOrderingComposer
    extends Composer<_$AppDatabase, $FingerprintsTable> {
  $$FingerprintsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get matchType => $composableBuilder(
    column: $table.matchType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get matchValue => $composableBuilder(
    column: $table.matchValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  $$BrandsTableOrderingComposer get brandId {
    final $$BrandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableOrderingComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FirmwaresTableOrderingComposer get firmwareId {
    final $$FirmwaresTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareId,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableOrderingComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FingerprintsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FingerprintsTable> {
  $$FingerprintsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get matchType =>
      $composableBuilder(column: $table.matchType, builder: (column) => column);

  GeneratedColumn<String> get matchValue => $composableBuilder(
    column: $table.matchValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  $$BrandsTableAnnotationComposer get brandId {
    final $$BrandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableAnnotationComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FirmwaresTableAnnotationComposer get firmwareId {
    final $$FirmwaresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firmwareId,
      referencedTable: $db.firmwares,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FirmwaresTableAnnotationComposer(
            $db: $db,
            $table: $db.firmwares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FingerprintsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FingerprintsTable,
          Fingerprint,
          $$FingerprintsTableFilterComposer,
          $$FingerprintsTableOrderingComposer,
          $$FingerprintsTableAnnotationComposer,
          $$FingerprintsTableCreateCompanionBuilder,
          $$FingerprintsTableUpdateCompanionBuilder,
          (Fingerprint, $$FingerprintsTableReferences),
          Fingerprint,
          PrefetchHooks Function({bool brandId, bool firmwareId})
        > {
  $$FingerprintsTableTableManager(_$AppDatabase db, $FingerprintsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FingerprintsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FingerprintsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FingerprintsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> brandId = const Value.absent(),
                Value<int?> firmwareId = const Value.absent(),
                Value<String> matchType = const Value.absent(),
                Value<String> matchValue = const Value.absent(),
                Value<int> confidence = const Value.absent(),
              }) => FingerprintsCompanion(
                id: id,
                brandId: brandId,
                firmwareId: firmwareId,
                matchType: matchType,
                matchValue: matchValue,
                confidence: confidence,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> brandId = const Value.absent(),
                Value<int?> firmwareId = const Value.absent(),
                required String matchType,
                required String matchValue,
                Value<int> confidence = const Value.absent(),
              }) => FingerprintsCompanion.insert(
                id: id,
                brandId: brandId,
                firmwareId: firmwareId,
                matchType: matchType,
                matchValue: matchValue,
                confidence: confidence,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FingerprintsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({brandId = false, firmwareId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (brandId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.brandId,
                                referencedTable: $$FingerprintsTableReferences
                                    ._brandIdTable(db),
                                referencedColumn: $$FingerprintsTableReferences
                                    ._brandIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (firmwareId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.firmwareId,
                                referencedTable: $$FingerprintsTableReferences
                                    ._firmwareIdTable(db),
                                referencedColumn: $$FingerprintsTableReferences
                                    ._firmwareIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FingerprintsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FingerprintsTable,
      Fingerprint,
      $$FingerprintsTableFilterComposer,
      $$FingerprintsTableOrderingComposer,
      $$FingerprintsTableAnnotationComposer,
      $$FingerprintsTableCreateCompanionBuilder,
      $$FingerprintsTableUpdateCompanionBuilder,
      (Fingerprint, $$FingerprintsTableReferences),
      Fingerprint,
      PrefetchHooks Function({bool brandId, bool firmwareId})
    >;
typedef $$VersionRulesTableCreateCompanionBuilder =
    VersionRulesCompanion Function({
      Value<int> id,
      required int apiProfileId,
      required int minVersionSort,
      required int maxVersionSort,
      required int driverId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$VersionRulesTableUpdateCompanionBuilder =
    VersionRulesCompanion Function({
      Value<int> id,
      Value<int> apiProfileId,
      Value<int> minVersionSort,
      Value<int> maxVersionSort,
      Value<int> driverId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$VersionRulesTableReferences
    extends BaseReferences<_$AppDatabase, $VersionRulesTable, VersionRule> {
  $$VersionRulesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ApiProfilesTable _apiProfileIdTable(_$AppDatabase db) => db
      .apiProfiles
      .createAlias('version_rules__api_profile_id__api_profiles__id');

  $$ApiProfilesTableProcessedTableManager get apiProfileId {
    final $_column = $_itemColumn<int>('api_profile_id')!;

    final manager = $$ApiProfilesTableTableManager(
      $_db,
      $_db.apiProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_apiProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DriversTable _driverIdTable(_$AppDatabase db) =>
      db.drivers.createAlias('version_rules__driver_id__drivers__id');

  $$DriversTableProcessedTableManager get driverId {
    final $_column = $_itemColumn<int>('driver_id')!;

    final manager = $$DriversTableTableManager(
      $_db,
      $_db.drivers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_driverIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VersionRulesTableFilterComposer
    extends Composer<_$AppDatabase, $VersionRulesTable> {
  $$VersionRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minVersionSort => $composableBuilder(
    column: $table.minVersionSort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxVersionSort => $composableBuilder(
    column: $table.maxVersionSort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ApiProfilesTableFilterComposer get apiProfileId {
    final $$ApiProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableFilterComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DriversTableFilterComposer get driverId {
    final $$DriversTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.drivers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DriversTableFilterComposer(
            $db: $db,
            $table: $db.drivers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VersionRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $VersionRulesTable> {
  $$VersionRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minVersionSort => $composableBuilder(
    column: $table.minVersionSort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxVersionSort => $composableBuilder(
    column: $table.maxVersionSort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ApiProfilesTableOrderingComposer get apiProfileId {
    final $$ApiProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DriversTableOrderingComposer get driverId {
    final $$DriversTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.drivers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DriversTableOrderingComposer(
            $db: $db,
            $table: $db.drivers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VersionRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VersionRulesTable> {
  $$VersionRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minVersionSort => $composableBuilder(
    column: $table.minVersionSort,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxVersionSort => $composableBuilder(
    column: $table.maxVersionSort,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ApiProfilesTableAnnotationComposer get apiProfileId {
    final $$ApiProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiProfileId,
      referencedTable: $db.apiProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.apiProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DriversTableAnnotationComposer get driverId {
    final $$DriversTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.drivers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DriversTableAnnotationComposer(
            $db: $db,
            $table: $db.drivers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VersionRulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VersionRulesTable,
          VersionRule,
          $$VersionRulesTableFilterComposer,
          $$VersionRulesTableOrderingComposer,
          $$VersionRulesTableAnnotationComposer,
          $$VersionRulesTableCreateCompanionBuilder,
          $$VersionRulesTableUpdateCompanionBuilder,
          (VersionRule, $$VersionRulesTableReferences),
          VersionRule,
          PrefetchHooks Function({bool apiProfileId, bool driverId})
        > {
  $$VersionRulesTableTableManager(_$AppDatabase db, $VersionRulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VersionRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VersionRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VersionRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> apiProfileId = const Value.absent(),
                Value<int> minVersionSort = const Value.absent(),
                Value<int> maxVersionSort = const Value.absent(),
                Value<int> driverId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VersionRulesCompanion(
                id: id,
                apiProfileId: apiProfileId,
                minVersionSort: minVersionSort,
                maxVersionSort: maxVersionSort,
                driverId: driverId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int apiProfileId,
                required int minVersionSort,
                required int maxVersionSort,
                required int driverId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VersionRulesCompanion.insert(
                id: id,
                apiProfileId: apiProfileId,
                minVersionSort: minVersionSort,
                maxVersionSort: maxVersionSort,
                driverId: driverId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VersionRulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({apiProfileId = false, driverId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (apiProfileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.apiProfileId,
                                referencedTable: $$VersionRulesTableReferences
                                    ._apiProfileIdTable(db),
                                referencedColumn: $$VersionRulesTableReferences
                                    ._apiProfileIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (driverId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.driverId,
                                referencedTable: $$VersionRulesTableReferences
                                    ._driverIdTable(db),
                                referencedColumn: $$VersionRulesTableReferences
                                    ._driverIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VersionRulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VersionRulesTable,
      VersionRule,
      $$VersionRulesTableFilterComposer,
      $$VersionRulesTableOrderingComposer,
      $$VersionRulesTableAnnotationComposer,
      $$VersionRulesTableCreateCompanionBuilder,
      $$VersionRulesTableUpdateCompanionBuilder,
      (VersionRule, $$VersionRulesTableReferences),
      VersionRule,
      PrefetchHooks Function({bool apiProfileId, bool driverId})
    >;
typedef $$UserDevicesTableCreateCompanionBuilder =
    UserDevicesCompanion Function({
      Value<int> id,
      required int brandId,
      Value<String?> routerModel,
      Value<String?> dns,
      Value<int?> endpointId,
      Value<DateTime?> lastSeenAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UserDevicesTableUpdateCompanionBuilder =
    UserDevicesCompanion Function({
      Value<int> id,
      Value<int> brandId,
      Value<String?> routerModel,
      Value<String?> dns,
      Value<int?> endpointId,
      Value<DateTime?> lastSeenAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$UserDevicesTableReferences
    extends BaseReferences<_$AppDatabase, $UserDevicesTable, UserDevice> {
  $$UserDevicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BrandsTable _brandIdTable(_$AppDatabase db) =>
      db.brands.createAlias('user_devices__brand_id__brands__id');

  $$BrandsTableProcessedTableManager get brandId {
    final $_column = $_itemColumn<int>('brand_id')!;

    final manager = $$BrandsTableTableManager(
      $_db,
      $_db.brands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_brandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserDevicesTableFilterComposer
    extends Composer<_$AppDatabase, $UserDevicesTable> {
  $$UserDevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routerModel => $composableBuilder(
    column: $table.routerModel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dns => $composableBuilder(
    column: $table.dns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endpointId => $composableBuilder(
    column: $table.endpointId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BrandsTableFilterComposer get brandId {
    final $$BrandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableFilterComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDevicesTable> {
  $$UserDevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routerModel => $composableBuilder(
    column: $table.routerModel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dns => $composableBuilder(
    column: $table.dns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endpointId => $composableBuilder(
    column: $table.endpointId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BrandsTableOrderingComposer get brandId {
    final $$BrandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableOrderingComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDevicesTable> {
  $$UserDevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get routerModel => $composableBuilder(
    column: $table.routerModel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dns =>
      $composableBuilder(column: $table.dns, builder: (column) => column);

  GeneratedColumn<int> get endpointId => $composableBuilder(
    column: $table.endpointId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$BrandsTableAnnotationComposer get brandId {
    final $$BrandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableAnnotationComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDevicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserDevicesTable,
          UserDevice,
          $$UserDevicesTableFilterComposer,
          $$UserDevicesTableOrderingComposer,
          $$UserDevicesTableAnnotationComposer,
          $$UserDevicesTableCreateCompanionBuilder,
          $$UserDevicesTableUpdateCompanionBuilder,
          (UserDevice, $$UserDevicesTableReferences),
          UserDevice,
          PrefetchHooks Function({bool brandId})
        > {
  $$UserDevicesTableTableManager(_$AppDatabase db, $UserDevicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> brandId = const Value.absent(),
                Value<String?> routerModel = const Value.absent(),
                Value<String?> dns = const Value.absent(),
                Value<int?> endpointId = const Value.absent(),
                Value<DateTime?> lastSeenAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserDevicesCompanion(
                id: id,
                brandId: brandId,
                routerModel: routerModel,
                dns: dns,
                endpointId: endpointId,
                lastSeenAt: lastSeenAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int brandId,
                Value<String?> routerModel = const Value.absent(),
                Value<String?> dns = const Value.absent(),
                Value<int?> endpointId = const Value.absent(),
                Value<DateTime?> lastSeenAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserDevicesCompanion.insert(
                id: id,
                brandId: brandId,
                routerModel: routerModel,
                dns: dns,
                endpointId: endpointId,
                lastSeenAt: lastSeenAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserDevicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({brandId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (brandId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.brandId,
                                referencedTable: $$UserDevicesTableReferences
                                    ._brandIdTable(db),
                                referencedColumn: $$UserDevicesTableReferences
                                    ._brandIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserDevicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserDevicesTable,
      UserDevice,
      $$UserDevicesTableFilterComposer,
      $$UserDevicesTableOrderingComposer,
      $$UserDevicesTableAnnotationComposer,
      $$UserDevicesTableCreateCompanionBuilder,
      $$UserDevicesTableUpdateCompanionBuilder,
      (UserDevice, $$UserDevicesTableReferences),
      UserDevice,
      PrefetchHooks Function({bool brandId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db, _db.brands);
  $$FirmwareTypesTableTableManager get firmwareTypes =>
      $$FirmwareTypesTableTableManager(_db, _db.firmwareTypes);
  $$ProtocolsTableTableManager get protocols =>
      $$ProtocolsTableTableManager(_db, _db.protocols);
  $$AuthenticationMethodsTableTableManager get authenticationMethods =>
      $$AuthenticationMethodsTableTableManager(_db, _db.authenticationMethods);
  $$DriversTableTableManager get drivers =>
      $$DriversTableTableManager(_db, _db.drivers);
  $$ApiProfilesTableTableManager get apiProfiles =>
      $$ApiProfilesTableTableManager(_db, _db.apiProfiles);
  $$FirmwaresTableTableManager get firmwares =>
      $$FirmwaresTableTableManager(_db, _db.firmwares);
  $$EndpointsTableTableManager get endpoints =>
      $$EndpointsTableTableManager(_db, _db.endpoints);
  $$CapabilitiesTableTableManager get capabilities =>
      $$CapabilitiesTableTableManager(_db, _db.capabilities);
  $$FirmwareCapabilitiesTableTableManager get firmwareCapabilities =>
      $$FirmwareCapabilitiesTableTableManager(_db, _db.firmwareCapabilities);
  $$FingerprintsTableTableManager get fingerprints =>
      $$FingerprintsTableTableManager(_db, _db.fingerprints);
  $$VersionRulesTableTableManager get versionRules =>
      $$VersionRulesTableTableManager(_db, _db.versionRules);
  $$UserDevicesTableTableManager get userDevices =>
      $$UserDevicesTableTableManager(_db, _db.userDevices);
}
