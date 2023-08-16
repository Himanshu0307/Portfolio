
class Project {
  final String name;
  final icon;
  final String description;
  final time;
  final String? githublink;
  final String? projectlink;
  final tech;

  Project(
      {required this.name,
      required this.description,
      required this.icon,
      required this.time,
      this.githublink,
      this.projectlink,
      this.tech=const []});
}
