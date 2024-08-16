class SlugModel {
  final String? title;
  final String? slug;
  final String? symbol;
  final String? flag;

  /// Constructor for UserModel
  SlugModel({
    this.flag = "",
    this.symbol = "",
    required this.title,
    required this.slug,
  });
}
