extension KTObjectExtension<T> on T {
  T also(void Function(T obj) block) {
    block(this);
    return this;
  }

  R let<R>(R Function(T obj) block) => block(this);
  T takeIf(bool Function(T) block) => block(this) ? this : null;
  T takeUnless(bool Function(T) block) => !block(this) ? this : null;
}
