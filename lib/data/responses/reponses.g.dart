// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reponses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseReponses _$BaseReponsesFromJson(Map<String, dynamic> json) => BaseReponses(
      statusCode: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseReponsesToJson(BaseReponses instance) =>
    <String, dynamic>{
      'status': instance.statusCode,
      'message': instance.message,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['id'] as String?,
      json['name'] as String?,
      (json['numberOfNotifications'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberOfNotifications': instance.numberOfNotifications,
    };

ContactsResponse _$ContactsResponseFromJson(Map<String, dynamic> json) =>
    ContactsResponse(
      json['phone'] as String?,
      json['facebook'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$ContactsResponseToJson(ContactsResponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'facebook': instance.facebookLink,
      'email': instance.emailAddress,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
      json['contacts'] == null
          ? null
          : ContactsResponse.fromJson(json['contacts'] as Map<String, dynamic>),
    )
      ..statusCode = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.statusCode,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
