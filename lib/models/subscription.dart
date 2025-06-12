enum SubscriptionType {
  yearly,
  monthly,
  weekly;

  static SubscriptionType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'yearly':
        return SubscriptionType.yearly;
      case 'monthly':
        return SubscriptionType.monthly;
      case 'weekly':
        return SubscriptionType.weekly;
      default:
        throw ArgumentError('Invalid subscription type: $value');
    }
  }

  String get displayName {
    switch (this) {
      case SubscriptionType.yearly:
        return 'Yearly';
      case SubscriptionType.monthly:
        return 'Monthly';
      case SubscriptionType.weekly:
        return 'Weekly';
    }
  }
}

class Subscription {
  final int id;
  final int userId;
  final SubscriptionType type;
  final DateTime createdAt;

  Subscription({
    required this.id,
    required this.userId,
    required this.type,
    required this.createdAt,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      type: SubscriptionType.fromString(json['type'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type.name,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Subscription(id: $id, userId: $userId, type: ${type.displayName}, createdAt: $createdAt)';
  }
}
