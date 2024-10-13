class Specialist {
  final String name;
  final String experience;
  final double rating;
  final int reviews;
  final double billedRate;
  final String category;
  bool isHeartFilled;

  Specialist({
    required this.name,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.billedRate,
    required this.category,
    this.isHeartFilled = false,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) {
    return Specialist(
      name: json['name'],
      experience: json['experience'],
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'],
      billedRate: (json['billedRate'] as num).toDouble(),
      category: json['category'],
    );
  }
}
