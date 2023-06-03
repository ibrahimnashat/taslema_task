extension OnMap on Map<String, dynamic> {
  Map<String, dynamic> get toClear {
    removeWhere((key, value) => value == '');
    removeWhere((key, value) => key == 'id' && value == -1);
    return this;
  }
}
