class MenuItem<T> {
  final String label;
  final T value;
  final bool enabled;
  final String? disabledText;

  MenuItem(
      {required this.label,
        required this.value,
        this.enabled = true,
        this.disabledText});

  @override
  bool operator ==(covariant MenuItem<T> other) {
    if (identical(this, other)) return true;

    return other.label == label &&
        other.value == value &&
        other.enabled == enabled &&
        other.disabledText == disabledText;
  }

  @override
  int get hashCode {
    return label.hashCode ^
    value.hashCode ^
    enabled.hashCode ^
    disabledText.hashCode;
  }
}
