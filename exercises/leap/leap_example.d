bool is_leap(uint year) {
  bool div_by(uint n) {
    return year % n == 0;
  }
  return div_by(4) && (!div_by(100) || div_by(400));
}

unittest {
  assert(!is_leap(2015));
  assert(is_leap(2016));
  assert(!is_leap(2100));
  assert(is_leap(2000));
}

void main() {}
