bool is_leap(uint year) {
  bool div_by(uint n) {
    return year % n == 0;
  }
  return div_by(4) && (!div_by(100) || div_by(400));
}
