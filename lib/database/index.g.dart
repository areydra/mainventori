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
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productQuantityMeta =
      const VerificationMeta('productQuantity');
  @override
  late final GeneratedColumn<int> productQuantity = GeneratedColumn<int>(
      'product_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productSellingPriceMeta =
      const VerificationMeta('productSellingPrice');
  @override
  late final GeneratedColumn<int> productSellingPrice = GeneratedColumn<int>(
      'product_selling_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalOrdersQuantityMeta =
      const VerificationMeta('totalOrdersQuantity');
  @override
  late final GeneratedColumn<int> totalOrdersQuantity = GeneratedColumn<int>(
      'total_orders_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalOrdersSellingPriceMeta =
      const VerificationMeta('totalOrdersSellingPrice');
  @override
  late final GeneratedColumn<int> totalOrdersSellingPrice =
      GeneratedColumn<int>('total_orders_selling_price', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  @override
  late final GeneratedColumn<DateTime> deliveryDate = GeneratedColumn<DateTime>(
      'delivery_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _customerMeta =
      const VerificationMeta('customer');
  @override
  late final GeneratedColumn<String> customer = GeneratedColumn<String>(
      'customer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productName,
        productQuantity,
        productSellingPrice,
        totalOrdersQuantity,
        totalOrdersSellingPrice,
        deliveryDate,
        customer,
        createdAt
      ];
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
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_quantity')) {
      context.handle(
          _productQuantityMeta,
          productQuantity.isAcceptableOrUnknown(
              data['product_quantity']!, _productQuantityMeta));
    } else if (isInserting) {
      context.missing(_productQuantityMeta);
    }
    if (data.containsKey('product_selling_price')) {
      context.handle(
          _productSellingPriceMeta,
          productSellingPrice.isAcceptableOrUnknown(
              data['product_selling_price']!, _productSellingPriceMeta));
    } else if (isInserting) {
      context.missing(_productSellingPriceMeta);
    }
    if (data.containsKey('total_orders_quantity')) {
      context.handle(
          _totalOrdersQuantityMeta,
          totalOrdersQuantity.isAcceptableOrUnknown(
              data['total_orders_quantity']!, _totalOrdersQuantityMeta));
    } else if (isInserting) {
      context.missing(_totalOrdersQuantityMeta);
    }
    if (data.containsKey('total_orders_selling_price')) {
      context.handle(
          _totalOrdersSellingPriceMeta,
          totalOrdersSellingPrice.isAcceptableOrUnknown(
              data['total_orders_selling_price']!,
              _totalOrdersSellingPriceMeta));
    } else if (isInserting) {
      context.missing(_totalOrdersSellingPriceMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date']!, _deliveryDateMeta));
    } else if (isInserting) {
      context.missing(_deliveryDateMeta);
    }
    if (data.containsKey('customer')) {
      context.handle(_customerMeta,
          customer.isAcceptableOrUnknown(data['customer']!, _customerMeta));
    } else if (isInserting) {
      context.missing(_customerMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      productQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_quantity'])!,
      productSellingPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}product_selling_price'])!,
      totalOrdersQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_orders_quantity'])!,
      totalOrdersSellingPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}total_orders_selling_price'])!,
      deliveryDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}delivery_date'])!,
      customer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String productName;
  final int productQuantity;
  final int productSellingPrice;
  final int totalOrdersQuantity;
  final int totalOrdersSellingPrice;
  final DateTime deliveryDate;
  final String customer;
  final DateTime createdAt;
  const Order(
      {required this.id,
      required this.productName,
      required this.productQuantity,
      required this.productSellingPrice,
      required this.totalOrdersQuantity,
      required this.totalOrdersSellingPrice,
      required this.deliveryDate,
      required this.customer,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_name'] = Variable<String>(productName);
    map['product_quantity'] = Variable<int>(productQuantity);
    map['product_selling_price'] = Variable<int>(productSellingPrice);
    map['total_orders_quantity'] = Variable<int>(totalOrdersQuantity);
    map['total_orders_selling_price'] = Variable<int>(totalOrdersSellingPrice);
    map['delivery_date'] = Variable<DateTime>(deliveryDate);
    map['customer'] = Variable<String>(customer);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      productName: Value(productName),
      productQuantity: Value(productQuantity),
      productSellingPrice: Value(productSellingPrice),
      totalOrdersQuantity: Value(totalOrdersQuantity),
      totalOrdersSellingPrice: Value(totalOrdersSellingPrice),
      deliveryDate: Value(deliveryDate),
      customer: Value(customer),
      createdAt: Value(createdAt),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      productName: serializer.fromJson<String>(json['productName']),
      productQuantity: serializer.fromJson<int>(json['productQuantity']),
      productSellingPrice:
          serializer.fromJson<int>(json['productSellingPrice']),
      totalOrdersQuantity:
          serializer.fromJson<int>(json['totalOrdersQuantity']),
      totalOrdersSellingPrice:
          serializer.fromJson<int>(json['totalOrdersSellingPrice']),
      deliveryDate: serializer.fromJson<DateTime>(json['deliveryDate']),
      customer: serializer.fromJson<String>(json['customer']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productName': serializer.toJson<String>(productName),
      'productQuantity': serializer.toJson<int>(productQuantity),
      'productSellingPrice': serializer.toJson<int>(productSellingPrice),
      'totalOrdersQuantity': serializer.toJson<int>(totalOrdersQuantity),
      'totalOrdersSellingPrice':
          serializer.toJson<int>(totalOrdersSellingPrice),
      'deliveryDate': serializer.toJson<DateTime>(deliveryDate),
      'customer': serializer.toJson<String>(customer),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Order copyWith(
          {int? id,
          String? productName,
          int? productQuantity,
          int? productSellingPrice,
          int? totalOrdersQuantity,
          int? totalOrdersSellingPrice,
          DateTime? deliveryDate,
          String? customer,
          DateTime? createdAt}) =>
      Order(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        productQuantity: productQuantity ?? this.productQuantity,
        productSellingPrice: productSellingPrice ?? this.productSellingPrice,
        totalOrdersQuantity: totalOrdersQuantity ?? this.totalOrdersQuantity,
        totalOrdersSellingPrice:
            totalOrdersSellingPrice ?? this.totalOrdersSellingPrice,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        customer: customer ?? this.customer,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('productQuantity: $productQuantity, ')
          ..write('productSellingPrice: $productSellingPrice, ')
          ..write('totalOrdersQuantity: $totalOrdersQuantity, ')
          ..write('totalOrdersSellingPrice: $totalOrdersSellingPrice, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('customer: $customer, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      productName,
      productQuantity,
      productSellingPrice,
      totalOrdersQuantity,
      totalOrdersSellingPrice,
      deliveryDate,
      customer,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.productName == this.productName &&
          other.productQuantity == this.productQuantity &&
          other.productSellingPrice == this.productSellingPrice &&
          other.totalOrdersQuantity == this.totalOrdersQuantity &&
          other.totalOrdersSellingPrice == this.totalOrdersSellingPrice &&
          other.deliveryDate == this.deliveryDate &&
          other.customer == this.customer &&
          other.createdAt == this.createdAt);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> productName;
  final Value<int> productQuantity;
  final Value<int> productSellingPrice;
  final Value<int> totalOrdersQuantity;
  final Value<int> totalOrdersSellingPrice;
  final Value<DateTime> deliveryDate;
  final Value<String> customer;
  final Value<DateTime> createdAt;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
    this.productQuantity = const Value.absent(),
    this.productSellingPrice = const Value.absent(),
    this.totalOrdersQuantity = const Value.absent(),
    this.totalOrdersSellingPrice = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.customer = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String productName,
    required int productQuantity,
    required int productSellingPrice,
    required int totalOrdersQuantity,
    required int totalOrdersSellingPrice,
    required DateTime deliveryDate,
    required String customer,
    required DateTime createdAt,
  })  : productName = Value(productName),
        productQuantity = Value(productQuantity),
        productSellingPrice = Value(productSellingPrice),
        totalOrdersQuantity = Value(totalOrdersQuantity),
        totalOrdersSellingPrice = Value(totalOrdersSellingPrice),
        deliveryDate = Value(deliveryDate),
        customer = Value(customer),
        createdAt = Value(createdAt);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? productName,
    Expression<int>? productQuantity,
    Expression<int>? productSellingPrice,
    Expression<int>? totalOrdersQuantity,
    Expression<int>? totalOrdersSellingPrice,
    Expression<DateTime>? deliveryDate,
    Expression<String>? customer,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productName != null) 'product_name': productName,
      if (productQuantity != null) 'product_quantity': productQuantity,
      if (productSellingPrice != null)
        'product_selling_price': productSellingPrice,
      if (totalOrdersQuantity != null)
        'total_orders_quantity': totalOrdersQuantity,
      if (totalOrdersSellingPrice != null)
        'total_orders_selling_price': totalOrdersSellingPrice,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (customer != null) 'customer': customer,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? productName,
      Value<int>? productQuantity,
      Value<int>? productSellingPrice,
      Value<int>? totalOrdersQuantity,
      Value<int>? totalOrdersSellingPrice,
      Value<DateTime>? deliveryDate,
      Value<String>? customer,
      Value<DateTime>? createdAt}) {
    return OrdersCompanion(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      productQuantity: productQuantity ?? this.productQuantity,
      productSellingPrice: productSellingPrice ?? this.productSellingPrice,
      totalOrdersQuantity: totalOrdersQuantity ?? this.totalOrdersQuantity,
      totalOrdersSellingPrice:
          totalOrdersSellingPrice ?? this.totalOrdersSellingPrice,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      customer: customer ?? this.customer,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productQuantity.present) {
      map['product_quantity'] = Variable<int>(productQuantity.value);
    }
    if (productSellingPrice.present) {
      map['product_selling_price'] = Variable<int>(productSellingPrice.value);
    }
    if (totalOrdersQuantity.present) {
      map['total_orders_quantity'] = Variable<int>(totalOrdersQuantity.value);
    }
    if (totalOrdersSellingPrice.present) {
      map['total_orders_selling_price'] =
          Variable<int>(totalOrdersSellingPrice.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (customer.present) {
      map['customer'] = Variable<String>(customer.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('productQuantity: $productQuantity, ')
          ..write('productSellingPrice: $productSellingPrice, ')
          ..write('totalOrdersQuantity: $totalOrdersQuantity, ')
          ..write('totalOrdersSellingPrice: $totalOrdersSellingPrice, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('customer: $customer, ')
          ..write('createdAt: $createdAt')
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
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _supplierMeta =
      const VerificationMeta('supplier');
  @override
  late final GeneratedColumn<String> supplier = GeneratedColumn<String>(
      'supplier', aliasedName, false,
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
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateInMeta = const VerificationMeta('dateIn');
  @override
  late final GeneratedColumn<DateTime> dateIn = GeneratedColumn<DateTime>(
      'date_in', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _minStockMeta =
      const VerificationMeta('minStock');
  @override
  late final GeneratedColumn<int> minStock = GeneratedColumn<int>(
      'min_stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        name,
        category,
        supplier,
        buyingPrice,
        quantity,
        unit,
        dateIn,
        minStock
      ];
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
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('supplier')) {
      context.handle(_supplierMeta,
          supplier.isAcceptableOrUnknown(data['supplier']!, _supplierMeta));
    } else if (isInserting) {
      context.missing(_supplierMeta);
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
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('date_in')) {
      context.handle(_dateInMeta,
          dateIn.isAcceptableOrUnknown(data['date_in']!, _dateInMeta));
    } else if (isInserting) {
      context.missing(_dateInMeta);
    }
    if (data.containsKey('min_stock')) {
      context.handle(_minStockMeta,
          minStock.isAcceptableOrUnknown(data['min_stock']!, _minStockMeta));
    } else if (isInserting) {
      context.missing(_minStockMeta);
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
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      supplier: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier'])!,
      buyingPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}buying_price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      dateIn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_in'])!,
      minStock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_stock'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String code;
  final String name;
  final String category;
  final String supplier;
  final int buyingPrice;
  final int quantity;
  final String unit;
  final DateTime dateIn;
  final int minStock;
  const Product(
      {required this.id,
      required this.code,
      required this.name,
      required this.category,
      required this.supplier,
      required this.buyingPrice,
      required this.quantity,
      required this.unit,
      required this.dateIn,
      required this.minStock});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['supplier'] = Variable<String>(supplier);
    map['buying_price'] = Variable<int>(buyingPrice);
    map['quantity'] = Variable<int>(quantity);
    map['unit'] = Variable<String>(unit);
    map['date_in'] = Variable<DateTime>(dateIn);
    map['min_stock'] = Variable<int>(minStock);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      category: Value(category),
      supplier: Value(supplier),
      buyingPrice: Value(buyingPrice),
      quantity: Value(quantity),
      unit: Value(unit),
      dateIn: Value(dateIn),
      minStock: Value(minStock),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      supplier: serializer.fromJson<String>(json['supplier']),
      buyingPrice: serializer.fromJson<int>(json['buyingPrice']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unit: serializer.fromJson<String>(json['unit']),
      dateIn: serializer.fromJson<DateTime>(json['dateIn']),
      minStock: serializer.fromJson<int>(json['minStock']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'supplier': serializer.toJson<String>(supplier),
      'buyingPrice': serializer.toJson<int>(buyingPrice),
      'quantity': serializer.toJson<int>(quantity),
      'unit': serializer.toJson<String>(unit),
      'dateIn': serializer.toJson<DateTime>(dateIn),
      'minStock': serializer.toJson<int>(minStock),
    };
  }

  Product copyWith(
          {int? id,
          String? code,
          String? name,
          String? category,
          String? supplier,
          int? buyingPrice,
          int? quantity,
          String? unit,
          DateTime? dateIn,
          int? minStock}) =>
      Product(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        category: category ?? this.category,
        supplier: supplier ?? this.supplier,
        buyingPrice: buyingPrice ?? this.buyingPrice,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        dateIn: dateIn ?? this.dateIn,
        minStock: minStock ?? this.minStock,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('supplier: $supplier, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('dateIn: $dateIn, ')
          ..write('minStock: $minStock')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, category, supplier,
      buyingPrice, quantity, unit, dateIn, minStock);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.category == this.category &&
          other.supplier == this.supplier &&
          other.buyingPrice == this.buyingPrice &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.dateIn == this.dateIn &&
          other.minStock == this.minStock);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> category;
  final Value<String> supplier;
  final Value<int> buyingPrice;
  final Value<int> quantity;
  final Value<String> unit;
  final Value<DateTime> dateIn;
  final Value<int> minStock;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.supplier = const Value.absent(),
    this.buyingPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.dateIn = const Value.absent(),
    this.minStock = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String category,
    required String supplier,
    required int buyingPrice,
    required int quantity,
    required String unit,
    required DateTime dateIn,
    required int minStock,
  })  : code = Value(code),
        name = Value(name),
        category = Value(category),
        supplier = Value(supplier),
        buyingPrice = Value(buyingPrice),
        quantity = Value(quantity),
        unit = Value(unit),
        dateIn = Value(dateIn),
        minStock = Value(minStock);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? supplier,
    Expression<int>? buyingPrice,
    Expression<int>? quantity,
    Expression<String>? unit,
    Expression<DateTime>? dateIn,
    Expression<int>? minStock,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (supplier != null) 'supplier': supplier,
      if (buyingPrice != null) 'buying_price': buyingPrice,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (dateIn != null) 'date_in': dateIn,
      if (minStock != null) 'min_stock': minStock,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<String>? name,
      Value<String>? category,
      Value<String>? supplier,
      Value<int>? buyingPrice,
      Value<int>? quantity,
      Value<String>? unit,
      Value<DateTime>? dateIn,
      Value<int>? minStock}) {
    return ProductsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      category: category ?? this.category,
      supplier: supplier ?? this.supplier,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      dateIn: dateIn ?? this.dateIn,
      minStock: minStock ?? this.minStock,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (supplier.present) {
      map['supplier'] = Variable<String>(supplier.value);
    }
    if (buyingPrice.present) {
      map['buying_price'] = Variable<int>(buyingPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (dateIn.present) {
      map['date_in'] = Variable<DateTime>(dateIn.value);
    }
    if (minStock.present) {
      map['min_stock'] = Variable<int>(minStock.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('supplier: $supplier, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('dateIn: $dateIn, ')
          ..write('minStock: $minStock')
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

class $OrdersListTable extends OrdersList
    with TableInfo<$OrdersListTable, OrdersListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersListTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idOrdersMeta =
      const VerificationMeta('idOrders');
  @override
  late final GeneratedColumn<int> idOrders = GeneratedColumn<int>(
      'id_orders', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productCodeMeta =
      const VerificationMeta('productCode');
  @override
  late final GeneratedColumn<String> productCode = GeneratedColumn<String>(
      'product_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originalPriceMeta =
      const VerificationMeta('originalPrice');
  @override
  late final GeneratedColumn<int> originalPrice = GeneratedColumn<int>(
      'original_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sellingPriceMeta =
      const VerificationMeta('sellingPrice');
  @override
  late final GeneratedColumn<int> sellingPrice = GeneratedColumn<int>(
      'selling_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idOrders,
        productCode,
        productName,
        originalPrice,
        sellingPrice,
        quantity,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders_list';
  @override
  VerificationContext validateIntegrity(Insertable<OrdersListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_orders')) {
      context.handle(_idOrdersMeta,
          idOrders.isAcceptableOrUnknown(data['id_orders']!, _idOrdersMeta));
    } else if (isInserting) {
      context.missing(_idOrdersMeta);
    }
    if (data.containsKey('product_code')) {
      context.handle(
          _productCodeMeta,
          productCode.isAcceptableOrUnknown(
              data['product_code']!, _productCodeMeta));
    } else if (isInserting) {
      context.missing(_productCodeMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('original_price')) {
      context.handle(
          _originalPriceMeta,
          originalPrice.isAcceptableOrUnknown(
              data['original_price']!, _originalPriceMeta));
    } else if (isInserting) {
      context.missing(_originalPriceMeta);
    }
    if (data.containsKey('selling_price')) {
      context.handle(
          _sellingPriceMeta,
          sellingPrice.isAcceptableOrUnknown(
              data['selling_price']!, _sellingPriceMeta));
    } else if (isInserting) {
      context.missing(_sellingPriceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrdersListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrdersListData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idOrders: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_orders'])!,
      productCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_code'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      originalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}original_price'])!,
      sellingPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}selling_price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OrdersListTable createAlias(String alias) {
    return $OrdersListTable(attachedDatabase, alias);
  }
}

class OrdersListData extends DataClass implements Insertable<OrdersListData> {
  final int id;
  final int idOrders;
  final String productCode;
  final String productName;
  final int originalPrice;
  final int sellingPrice;
  final int quantity;
  final DateTime createdAt;
  const OrdersListData(
      {required this.id,
      required this.idOrders,
      required this.productCode,
      required this.productName,
      required this.originalPrice,
      required this.sellingPrice,
      required this.quantity,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_orders'] = Variable<int>(idOrders);
    map['product_code'] = Variable<String>(productCode);
    map['product_name'] = Variable<String>(productName);
    map['original_price'] = Variable<int>(originalPrice);
    map['selling_price'] = Variable<int>(sellingPrice);
    map['quantity'] = Variable<int>(quantity);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OrdersListCompanion toCompanion(bool nullToAbsent) {
    return OrdersListCompanion(
      id: Value(id),
      idOrders: Value(idOrders),
      productCode: Value(productCode),
      productName: Value(productName),
      originalPrice: Value(originalPrice),
      sellingPrice: Value(sellingPrice),
      quantity: Value(quantity),
      createdAt: Value(createdAt),
    );
  }

  factory OrdersListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrdersListData(
      id: serializer.fromJson<int>(json['id']),
      idOrders: serializer.fromJson<int>(json['idOrders']),
      productCode: serializer.fromJson<String>(json['productCode']),
      productName: serializer.fromJson<String>(json['productName']),
      originalPrice: serializer.fromJson<int>(json['originalPrice']),
      sellingPrice: serializer.fromJson<int>(json['sellingPrice']),
      quantity: serializer.fromJson<int>(json['quantity']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idOrders': serializer.toJson<int>(idOrders),
      'productCode': serializer.toJson<String>(productCode),
      'productName': serializer.toJson<String>(productName),
      'originalPrice': serializer.toJson<int>(originalPrice),
      'sellingPrice': serializer.toJson<int>(sellingPrice),
      'quantity': serializer.toJson<int>(quantity),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OrdersListData copyWith(
          {int? id,
          int? idOrders,
          String? productCode,
          String? productName,
          int? originalPrice,
          int? sellingPrice,
          int? quantity,
          DateTime? createdAt}) =>
      OrdersListData(
        id: id ?? this.id,
        idOrders: idOrders ?? this.idOrders,
        productCode: productCode ?? this.productCode,
        productName: productName ?? this.productName,
        originalPrice: originalPrice ?? this.originalPrice,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        quantity: quantity ?? this.quantity,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('OrdersListData(')
          ..write('id: $id, ')
          ..write('idOrders: $idOrders, ')
          ..write('productCode: $productCode, ')
          ..write('productName: $productName, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idOrders, productCode, productName,
      originalPrice, sellingPrice, quantity, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrdersListData &&
          other.id == this.id &&
          other.idOrders == this.idOrders &&
          other.productCode == this.productCode &&
          other.productName == this.productName &&
          other.originalPrice == this.originalPrice &&
          other.sellingPrice == this.sellingPrice &&
          other.quantity == this.quantity &&
          other.createdAt == this.createdAt);
}

class OrdersListCompanion extends UpdateCompanion<OrdersListData> {
  final Value<int> id;
  final Value<int> idOrders;
  final Value<String> productCode;
  final Value<String> productName;
  final Value<int> originalPrice;
  final Value<int> sellingPrice;
  final Value<int> quantity;
  final Value<DateTime> createdAt;
  const OrdersListCompanion({
    this.id = const Value.absent(),
    this.idOrders = const Value.absent(),
    this.productCode = const Value.absent(),
    this.productName = const Value.absent(),
    this.originalPrice = const Value.absent(),
    this.sellingPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrdersListCompanion.insert({
    this.id = const Value.absent(),
    required int idOrders,
    required String productCode,
    required String productName,
    required int originalPrice,
    required int sellingPrice,
    required int quantity,
    required DateTime createdAt,
  })  : idOrders = Value(idOrders),
        productCode = Value(productCode),
        productName = Value(productName),
        originalPrice = Value(originalPrice),
        sellingPrice = Value(sellingPrice),
        quantity = Value(quantity),
        createdAt = Value(createdAt);
  static Insertable<OrdersListData> custom({
    Expression<int>? id,
    Expression<int>? idOrders,
    Expression<String>? productCode,
    Expression<String>? productName,
    Expression<int>? originalPrice,
    Expression<int>? sellingPrice,
    Expression<int>? quantity,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idOrders != null) 'id_orders': idOrders,
      if (productCode != null) 'product_code': productCode,
      if (productName != null) 'product_name': productName,
      if (originalPrice != null) 'original_price': originalPrice,
      if (sellingPrice != null) 'selling_price': sellingPrice,
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrdersListCompanion copyWith(
      {Value<int>? id,
      Value<int>? idOrders,
      Value<String>? productCode,
      Value<String>? productName,
      Value<int>? originalPrice,
      Value<int>? sellingPrice,
      Value<int>? quantity,
      Value<DateTime>? createdAt}) {
    return OrdersListCompanion(
      id: id ?? this.id,
      idOrders: idOrders ?? this.idOrders,
      productCode: productCode ?? this.productCode,
      productName: productName ?? this.productName,
      originalPrice: originalPrice ?? this.originalPrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idOrders.present) {
      map['id_orders'] = Variable<int>(idOrders.value);
    }
    if (productCode.present) {
      map['product_code'] = Variable<String>(productCode.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (originalPrice.present) {
      map['original_price'] = Variable<int>(originalPrice.value);
    }
    if (sellingPrice.present) {
      map['selling_price'] = Variable<int>(sellingPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersListCompanion(')
          ..write('id: $id, ')
          ..write('idOrders: $idOrders, ')
          ..write('productCode: $productCode, ')
          ..write('productName: $productName, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt')
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
  late final $OrdersListTable ordersList = $OrdersListTable(this);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  late final OrdersDao ordersDao = OrdersDao(this as AppDatabase);
  late final OrdersListDao ordersListDao = OrdersListDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [customers, orders, products, suppliers, ordersList];
}
