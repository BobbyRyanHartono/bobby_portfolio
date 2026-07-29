class ProfileInfo {
  final String name;
  final String title;
  final String bio;
  final String location;
  final String email;
  final String githubUrl;
  final String linkedinUrl;
  final String twitterUrl;
  final int yearsOfExperience;
  final int completedProjects;
  final int satisfiedClients;
  final Map<String, List<String>> skills;

  const ProfileInfo({
    required this.name,
    required this.title,
    required this.bio,
    required this.location,
    required this.email,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.twitterUrl,
    required this.yearsOfExperience,
    required this.completedProjects,
    required this.satisfiedClients,
    required this.skills,
  });
}
