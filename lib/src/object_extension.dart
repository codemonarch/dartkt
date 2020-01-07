class ElseBlock<T> {
  bool condition;
  T obj;
  ElseBlock(this.condition, this.obj);
  T elseBlock(T Function(T) action) => condition ? action(obj) : obj;
}

extension KTObjectExtension<T> on T {
  T also(void Function(T obj) block) {
    block(this);
    return this;
  }

  R let<R>(R Function(T obj) block) => block(this);
  T takeIf(bool Function(T) block) => block(this) ? this : null;
  T takeUnless(bool Function(T) block) => !block(this) ? this : null;

  ElseBlock<T> ifBlock(bool condition, T Function(T) block) =>
      ElseBlock(condition, condition ? block(this) : this);
  T block(void Function() action) {
    action();
    return this;
  }
}
