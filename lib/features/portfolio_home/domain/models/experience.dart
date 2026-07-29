class Experience {
  final String id;
  final String role;
  final String company;
  final String period;
  final List<String> descriptionPoints;
  final List<String> technologies;
  final String location;
  final String employmentType;
  final String companyLogoUrl;

  const Experience({
    required this.id,
    required this.role,
    required this.company,
    required this.period,
    required this.descriptionPoints,
    required this.technologies,
    required this.location,
    required this.employmentType,
    required this.companyLogoUrl,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'] as String,
      role: json['role'] as String,
      company: json['company'] as String,
      period: json['period'] as String,
      descriptionPoints: List<String>.from(json['descriptionPoints'] as List),
      technologies: List<String>.from(json['technologies'] as List),
      location: json['location'] as String,
      employmentType: json['employmentType'] as String,
      companyLogoUrl: json['companyLogoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'company': company,
      'period': period,
      'descriptionPoints': descriptionPoints,
      'technologies': technologies,
      'location': location,
      'employmentType': employmentType,
      'companyLogoUrl': companyLogoUrl,
    };
  }
}
