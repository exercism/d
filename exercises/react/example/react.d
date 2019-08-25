module react;

class Reactor(T) {
  class Cell {
    @property T value() { return m_value; }
    private:
    ComputeCell[] dependents;
    T m_value;
  }

  class InputCell: Cell {
    // If this override getter is not present,
    // then value becomes write-only.
    override @property T value() { return super.value; }
    @property T value(T newValue) {
      m_value = newValue;
      foreach (dep; dependents) {
        dep.propagate();
      }
      foreach (dep; dependents) {
        dep.fireCallbacks();
      }
      return newValue;
    }

    this(T initialValue) {
      m_value = initialValue;
    }
  }

  class ComputeCell: Cell {
    this(Cell c, T function(T) f) {
      c.dependents ~= [this];
      this(() => f(c.value));
    }

    this(Cell c1, Cell c2, T function(T, T) f) {
      c1.dependents ~= [this];
      c2.dependents ~= [this];
      this(() => f(c1.value, c2.value));
    }

    void delegate() addCallback(void delegate(T) cb) {
      int id = callbacksIssued++;
      callbacks[id] = cb;
      return () { callbacks.remove(id); };
    }

    private:

    T delegate() compute;
    T lastCallbackValue;
    void delegate(T)[int] callbacks;
    int callbacksIssued = 0;

    this(T delegate() f) {
      compute = f;
      m_value = compute();
      lastCallbackValue = m_value;
    }

    void propagate() {
      T newValue = compute();
      if (value == newValue) {
        return;
      }
      m_value = newValue;
      foreach (dep; dependents) {
        dep.propagate();
      }
    }

    void fireCallbacks() {
      if (value == lastCallbackValue) {
        return;
      }
      lastCallbackValue = value;
      foreach (cb; callbacks) {
        cb(value);
      }
      foreach (dep; dependents) {
        dep.fireCallbacks();
      }
    }
  }
}
