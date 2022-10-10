extension IfNotNullReturn<T, U> on T? {
  U? ifNotNullReturn(U value) => this == null ? null : value;
  U? innr(U value) => ifNotNullReturn(value);
}
