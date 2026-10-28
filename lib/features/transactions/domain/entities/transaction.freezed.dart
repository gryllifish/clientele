// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Transaction {

 int get id; String get title;/// The client who paid.
 String get clientName;/// In whole US dollars.
 int get amount; DateTime get occurredAt;/// Clients involved in the work, in display order.
 List<TransactionParticipant> get participants;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&const DeepCollectionEquality().equals(other.participants, participants));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,clientName,amount,occurredAt,const DeepCollectionEquality().hash(participants));

@override
String toString() {
  return 'Transaction(id: $id, title: $title, clientName: $clientName, amount: $amount, occurredAt: $occurredAt, participants: $participants)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 int id, String title, String clientName, int amount, DateTime occurredAt, List<TransactionParticipant> participants
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? clientName = null,Object? amount = null,Object? occurredAt = null,Object? participants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<TransactionParticipant>,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String clientName,  int amount,  DateTime occurredAt,  List<TransactionParticipant> participants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.title,_that.clientName,_that.amount,_that.occurredAt,_that.participants);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String clientName,  int amount,  DateTime occurredAt,  List<TransactionParticipant> participants)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.title,_that.clientName,_that.amount,_that.occurredAt,_that.participants);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String clientName,  int amount,  DateTime occurredAt,  List<TransactionParticipant> participants)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.title,_that.clientName,_that.amount,_that.occurredAt,_that.participants);case _:
  return null;

}
}

}

/// @nodoc


class _Transaction implements Transaction {
  const _Transaction({required this.id, required this.title, required this.clientName, required this.amount, required this.occurredAt, required final  List<TransactionParticipant> participants}): _participants = participants;
  

@override final  int id;
@override final  String title;
/// The client who paid.
@override final  String clientName;
/// In whole US dollars.
@override final  int amount;
@override final  DateTime occurredAt;
/// Clients involved in the work, in display order.
 final  List<TransactionParticipant> _participants;
/// Clients involved in the work, in display order.
@override List<TransactionParticipant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&const DeepCollectionEquality().equals(other._participants, _participants));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,clientName,amount,occurredAt,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'Transaction(id: $id, title: $title, clientName: $clientName, amount: $amount, occurredAt: $occurredAt, participants: $participants)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String clientName, int amount, DateTime occurredAt, List<TransactionParticipant> participants
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? clientName = null,Object? amount = null,Object? occurredAt = null,Object? participants = null,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<TransactionParticipant>,
  ));
}


}

/// @nodoc
mixin _$TransactionParticipant {

 int get clientId; String get photoAsset;
/// Create a copy of TransactionParticipant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionParticipantCopyWith<TransactionParticipant> get copyWith => _$TransactionParticipantCopyWithImpl<TransactionParticipant>(this as TransactionParticipant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionParticipant&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset));
}


@override
int get hashCode => Object.hash(runtimeType,clientId,photoAsset);

@override
String toString() {
  return 'TransactionParticipant(clientId: $clientId, photoAsset: $photoAsset)';
}


}

/// @nodoc
abstract mixin class $TransactionParticipantCopyWith<$Res>  {
  factory $TransactionParticipantCopyWith(TransactionParticipant value, $Res Function(TransactionParticipant) _then) = _$TransactionParticipantCopyWithImpl;
@useResult
$Res call({
 int clientId, String photoAsset
});




}
/// @nodoc
class _$TransactionParticipantCopyWithImpl<$Res>
    implements $TransactionParticipantCopyWith<$Res> {
  _$TransactionParticipantCopyWithImpl(this._self, this._then);

  final TransactionParticipant _self;
  final $Res Function(TransactionParticipant) _then;

/// Create a copy of TransactionParticipant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? photoAsset = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionParticipant].
extension TransactionParticipantPatterns on TransactionParticipant {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionParticipant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionParticipant() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionParticipant value)  $default,){
final _that = this;
switch (_that) {
case _TransactionParticipant():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionParticipant value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionParticipant() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int clientId,  String photoAsset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionParticipant() when $default != null:
return $default(_that.clientId,_that.photoAsset);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int clientId,  String photoAsset)  $default,) {final _that = this;
switch (_that) {
case _TransactionParticipant():
return $default(_that.clientId,_that.photoAsset);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int clientId,  String photoAsset)?  $default,) {final _that = this;
switch (_that) {
case _TransactionParticipant() when $default != null:
return $default(_that.clientId,_that.photoAsset);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionParticipant implements TransactionParticipant {
  const _TransactionParticipant({required this.clientId, required this.photoAsset});
  

@override final  int clientId;
@override final  String photoAsset;

/// Create a copy of TransactionParticipant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionParticipantCopyWith<_TransactionParticipant> get copyWith => __$TransactionParticipantCopyWithImpl<_TransactionParticipant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionParticipant&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset));
}


@override
int get hashCode => Object.hash(runtimeType,clientId,photoAsset);

@override
String toString() {
  return 'TransactionParticipant(clientId: $clientId, photoAsset: $photoAsset)';
}


}

/// @nodoc
abstract mixin class _$TransactionParticipantCopyWith<$Res> implements $TransactionParticipantCopyWith<$Res> {
  factory _$TransactionParticipantCopyWith(_TransactionParticipant value, $Res Function(_TransactionParticipant) _then) = __$TransactionParticipantCopyWithImpl;
@override @useResult
$Res call({
 int clientId, String photoAsset
});




}
/// @nodoc
class __$TransactionParticipantCopyWithImpl<$Res>
    implements _$TransactionParticipantCopyWith<$Res> {
  __$TransactionParticipantCopyWithImpl(this._self, this._then);

  final _TransactionParticipant _self;
  final $Res Function(_TransactionParticipant) _then;

/// Create a copy of TransactionParticipant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? photoAsset = null,}) {
  return _then(_TransactionParticipant(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
