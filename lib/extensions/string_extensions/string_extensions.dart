extension StringExtensions on String {
  String capitalizeFirst() => this[0].toUpperCase() + substring(1);
  String capitalizeAll() =>
      split(' ').map((word) => word.capitalizeFirst()).join(' ');
}
