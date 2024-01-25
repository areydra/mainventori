// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// ignore_for_file: type=lint
class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactNumberMeta =
      const VerificationMeta('contactNumber');
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
      'contact_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, contactNumber, email, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact_number')) {
      context.handle(
          _contactNumberMeta,
          contactNumber.isAcceptableOrUnknown(
              data['contact_number']!, _contactNumberMeta));
    } else if (isInserting) {
      context.missing(_contactNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      contactNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_number'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String name;
  final String contactNumber;
  final String email;
  final String address;
  const Customer(
      {required this.id,
      required this.name,
      required this.contactNumber,
      required this.email,
      required this.address});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['contact_number'] = Variable<String>(contactNumber);
    map['email'] = Variable<String>(email);
    map['address'] = Variable<String>(address);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      contactNumber: Value(contactNumber),
      email: Value(email),
      address: Value(address),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
      email: serializer.fromJson<String>(json['email']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'contactNumber': serializer.toJson<String>(contactNumber),
      'email': serializer.toJson<String>(email),
      'address': serializer.toJson<String>(address),
    };
  }

  Customer copyWith(
          {int? id,
          String? name,
          String? contactNumber,
          String? email,
          String? address}) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        contactNumber: contactNumber ?? this.contactNumber,
        email: email ?? this.email,
        address: address ?? this.address,
      );
  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, contactNumber, email, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.contactNumber == this.contactNumber &&
          other.email == this.email &&
          other.address == this.address);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> contactNumber;
  final Value<String> email;
  final Value<String> address;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String contactNumber,
    required String email,
    required String address,
  })  : name = Value(name),
        contactNumber = Value(contactNumber),
        email = Value(email),
        address = Value(address);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? contactNumber,
    Expression<String>? email,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
    });
  }

  CustomersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? contactNumber,
      Value<String>? email,
      Value<String>? address}) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      address: address ?? this.address,
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
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expectedDeliveryMeta =
      const VerificationMeta('expectedDelivery');
  @override
  late final GeneratedColumn<String> expectedDelivery = GeneratedColumn<String>(
      'expected_delivery', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderValueMeta =
      const VerificationMeta('orderValue');
  @override
  late final GeneratedColumn<int> orderValue = GeneratedColumn<int>(
      'order_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, expectedDelivery, unit, orderValue, quantity, orderId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('expected_delivery')) {
      context.handle(
          _expectedDeliveryMeta,
          expectedDelivery.isAcceptableOrUnknown(
              data['expected_delivery']!, _expectedDeliveryMeta));
    } else if (isInserting) {
      context.missing(_expectedDeliveryMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('order_value')) {
      context.handle(
          _orderValueMeta,
          orderValue.isAcceptableOrUnknown(
              data['order_value']!, _orderValueMeta));
    } else if (isInserting) {
      context.missing(_orderValueMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      expectedDelivery: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}expected_delivery'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      orderValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_value'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String name;
  final String expectedDelivery;
  final String unit;
  final int orderValue;
  final int quantity;
  final int orderId;
  const Order(
      {required this.id,
      required this.name,
      required this.expectedDelivery,
      required this.unit,
      required this.orderValue,
      required this.quantity,
      required this.orderId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['expected_delivery'] = Variable<String>(expectedDelivery);
    map['unit'] = Variable<String>(unit);
    map['order_value'] = Variable<int>(orderValue);
    map['quantity'] = Variable<int>(quantity);
    map['order_id'] = Variable<int>(orderId);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      name: Value(name),
      expectedDelivery: Value(expectedDelivery),
      unit: Value(unit),
      orderValue: Value(orderValue),
      quantity: Value(quantity),
      orderId: Value(orderId),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      expectedDelivery: serializer.fromJson<String>(json['expectedDelivery']),
      unit: serializer.fromJson<String>(json['unit']),
      orderValue: serializer.fromJson<int>(json['orderValue']),
      quantity: serializer.fromJson<int>(json['quantity']),
      orderId: serializer.fromJson<int>(json['orderId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'expectedDelivery': serializer.toJson<String>(expectedDelivery),
      'unit': serializer.toJson<String>(unit),
      'orderValue': serializer.toJson<int>(orderValue),
      'quantity': serializer.toJson<int>(quantity),
      'orderId': serializer.toJson<int>(orderId),
    };
  }

  Order copyWith(
          {int? id,
          String? name,
          String? expectedDelivery,
          String? unit,
          int? orderValue,
          int? quantity,
          int? orderId}) =>
      Order(
        id: id ?? this.id,
        name: name ?? this.name,
        expectedDelivery: expectedDelivery ?? this.expectedDelivery,
        unit: unit ?? this.unit,
        orderValue: orderValue ?? this.orderValue,
        quantity: quantity ?? this.quantity,
        orderId: orderId ?? this.orderId,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('expectedDelivery: $expectedDelivery, ')
          ..write('unit: $unit, ')
          ..write('orderValue: $orderValue, ')
          ..write('quantity: $quantity, ')
          ..write('orderId: $orderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, expectedDelivery, unit, orderValue, quantity, orderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.name == this.name &&
          other.expectedDelivery == this.expectedDelivery &&
          other.unit == this.unit &&
          other.orderValue == this.orderValue &&
          other.quantity == this.quantity &&
          other.orderId == this.orderId);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> expectedDelivery;
  final Value<String> unit;
  final Value<int> orderValue;
  final Value<int> quantity;
  final Value<int> orderId;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.expectedDelivery = const Value.absent(),
    this.unit = const Value.absent(),
    this.orderValue = const Value.absent(),
    this.quantity = const Value.absent(),
    this.orderId = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String expectedDelivery,
    required String unit,
    required int orderValue,
    required int quantity,
    required int orderId,
  })  : name = Value(name),
        expectedDelivery = Value(expectedDelivery),
        unit = Value(unit),
        orderValue = Value(orderValue),
        quantity = Value(quantity),
        orderId = Value(orderId);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? expectedDelivery,
    Expression<String>? unit,
    Expression<int>? orderValue,
    Expression<int>? quantity,
    Expression<int>? orderId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (expectedDelivery != null) 'expected_delivery': expectedDelivery,
      if (unit != null) 'unit': unit,
      if (orderValue != null) 'order_value': orderValue,
      if (quantity != null) 'quantity': quantity,
      if (orderId != null) 'order_id': orderId,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? expectedDelivery,
      Value<String>? unit,
      Value<int>? orderValue,
      Value<int>? quantity,
      Value<int>? orderId}) {
    return OrdersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      expectedDelivery: expectedDelivery ?? this.expectedDelivery,
      unit: unit ?? this.unit,
      orderValue: orderValue ?? this.orderValue,
      quantity: quantity ?? this.quantity,
      orderId: orderId ?? this.orderId,
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
    if (expectedDelivery.present) {
      map['expected_delivery'] = Variable<String>(expectedDelivery.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (orderValue.present) {
      map['order_value'] = Variable<int>(orderValue.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('expectedDelivery: $expectedDelivery, ')
          ..write('unit: $unit, ')
          ..write('orderValue: $orderValue, ')
          ..write('quantity: $quantity, ')
          ..write('orderId: $orderId')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<String> expiryDate = GeneratedColumn<String>(
      'expiry_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _buyingPriceMeta =
      const VerificationMeta('buyingPrice');
  @override
  late final GeneratedColumn<int> buyingPrice = GeneratedColumn<int>(
      'buying_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _thresholdVlueMeta =
      const VerificationMeta('thresholdVlue');
  @override
  late final GeneratedColumn<int> thresholdVlue = GeneratedColumn<int>(
      'threshold_vlue', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, expiryDate, unit, buyingPrice, quantity, thresholdVlue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    } else if (isInserting) {
      context.missing(_expiryDateMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('buying_price')) {
      context.handle(
          _buyingPriceMeta,
          buyingPrice.isAcceptableOrUnknown(
              data['buying_price']!, _buyingPriceMeta));
    } else if (isInserting) {
      context.missing(_buyingPriceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('threshold_vlue')) {
      context.handle(
          _thresholdVlueMeta,
          thresholdVlue.isAcceptableOrUnknown(
              data['threshold_vlue']!, _thresholdVlueMeta));
    } else if (isInserting) {
      context.missing(_thresholdVlueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expiry_date'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      buyingPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}buying_price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      thresholdVlue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}threshold_vlue'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String name;
  final String expiryDate;
  final String unit;
  final int buyingPrice;
  final int quantity;
  final int thresholdVlue;
  const Product(
      {required this.id,
      required this.name,
      required this.expiryDate,
      required this.unit,
      required this.buyingPrice,
      required this.quantity,
      required this.thresholdVlue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['expiry_date'] = Variable<String>(expiryDate);
    map['unit'] = Variable<String>(unit);
    map['buying_price'] = Variable<int>(buyingPrice);
    map['quantity'] = Variable<int>(quantity);
    map['threshold_vlue'] = Variable<int>(thresholdVlue);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      expiryDate: Value(expiryDate),
      unit: Value(unit),
      buyingPrice: Value(buyingPrice),
      quantity: Value(quantity),
      thresholdVlue: Value(thresholdVlue),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      expiryDate: serializer.fromJson<String>(json['expiryDate']),
      unit: serializer.fromJson<String>(json['unit']),
      buyingPrice: serializer.fromJson<int>(json['buyingPrice']),
      quantity: serializer.fromJson<int>(json['quantity']),
      thresholdVlue: serializer.fromJson<int>(json['thresholdVlue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'expiryDate': serializer.toJson<String>(expiryDate),
      'unit': serializer.toJson<String>(unit),
      'buyingPrice': serializer.toJson<int>(buyingPrice),
      'quantity': serializer.toJson<int>(quantity),
      'thresholdVlue': serializer.toJson<int>(thresholdVlue),
    };
  }

  Product copyWith(
          {int? id,
          String? name,
          String? expiryDate,
          String? unit,
          int? buyingPrice,
          int? quantity,
          int? thresholdVlue}) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        expiryDate: expiryDate ?? this.expiryDate,
        unit: unit ?? this.unit,
        buyingPrice: buyingPrice ?? this.buyingPrice,
        quantity: quantity ?? this.quantity,
        thresholdVlue: thresholdVlue ?? this.thresholdVlue,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('unit: $unit, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('thresholdVlue: $thresholdVlue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, expiryDate, unit, buyingPrice, quantity, thresholdVlue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.expiryDate == this.expiryDate &&
          other.unit == this.unit &&
          other.buyingPrice == this.buyingPrice &&
          other.quantity == this.quantity &&
          other.thresholdVlue == this.thresholdVlue);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> expiryDate;
  final Value<String> unit;
  final Value<int> buyingPrice;
  final Value<int> quantity;
  final Value<int> thresholdVlue;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.unit = const Value.absent(),
    this.buyingPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.thresholdVlue = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String expiryDate,
    required String unit,
    required int buyingPrice,
    required int quantity,
    required int thresholdVlue,
  })  : name = Value(name),
        expiryDate = Value(expiryDate),
        unit = Value(unit),
        buyingPrice = Value(buyingPrice),
        quantity = Value(quantity),
        thresholdVlue = Value(thresholdVlue);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? expiryDate,
    Expression<String>? unit,
    Expression<int>? buyingPrice,
    Expression<int>? quantity,
    Expression<int>? thresholdVlue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (unit != null) 'unit': unit,
      if (buyingPrice != null) 'buying_price': buyingPrice,
      if (quantity != null) 'quantity': quantity,
      if (thresholdVlue != null) 'threshold_vlue': thresholdVlue,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? expiryDate,
      Value<String>? unit,
      Value<int>? buyingPrice,
      Value<int>? quantity,
      Value<int>? thresholdVlue}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      expiryDate: expiryDate ?? this.expiryDate,
      unit: unit ?? this.unit,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      quantity: quantity ?? this.quantity,
      thresholdVlue: thresholdVlue ?? this.thresholdVlue,
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
    if (expiryDate.present) {
      map['expiry_date'] = Variable<String>(expiryDate.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (buyingPrice.present) {
      map['buying_price'] = Variable<int>(buyingPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (thresholdVlue.present) {
      map['threshold_vlue'] = Variable<int>(thresholdVlue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('unit: $unit, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('thresholdVlue: $thresholdVlue')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, Supplier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactNumberMeta =
      const VerificationMeta('contactNumber');
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
      'contact_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, contactNumber, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(Insertable<Supplier> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact_number')) {
      context.handle(
          _contactNumberMeta,
          contactNumber.isAcceptableOrUnknown(
              data['contact_number']!, _contactNumberMeta));
    } else if (isInserting) {
      context.missing(_contactNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Supplier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supplier(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      contactNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_number'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class Supplier extends DataClass implements Insertable<Supplier> {
  final int id;
  final String name;
  final String contactNumber;
  final String email;
  const Supplier(
      {required this.id,
      required this.name,
      required this.contactNumber,
      required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['contact_number'] = Variable<String>(contactNumber);
    map['email'] = Variable<String>(email);
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      name: Value(name),
      contactNumber: Value(contactNumber),
      email: Value(email),
    );
  }

  factory Supplier.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Supplier(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'contactNumber': serializer.toJson<String>(contactNumber),
      'email': serializer.toJson<String>(email),
    };
  }

  Supplier copyWith(
          {int? id, String? name, String? contactNumber, String? email}) =>
      Supplier(
        id: id ?? this.id,
        name: name ?? this.name,
        contactNumber: contactNumber ?? this.contactNumber,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('Supplier(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, contactNumber, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supplier &&
          other.id == this.id &&
          other.name == this.name &&
          other.contactNumber == this.contactNumber &&
          other.email == this.email);
}

class SuppliersCompanion extends UpdateCompanion<Supplier> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> contactNumber;
  final Value<String> email;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.email = const Value.absent(),
  });
  SuppliersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String contactNumber,
    required String email,
  })  : name = Value(name),
        contactNumber = Value(contactNumber),
        email = Value(email);
  static Insertable<Supplier> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? contactNumber,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (email != null) 'email': email,
    });
  }

  SuppliersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? contactNumber,
      Value<String>? email}) {
    return SuppliersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
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
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [customers, orders, products, suppliers];
}
