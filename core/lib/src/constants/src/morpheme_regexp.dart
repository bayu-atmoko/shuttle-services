abstract class MorphemeRegExp {
  static RegExp password = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,}$');
  static RegExp phone = RegExp(r'^[0-9]{10,15}$');
  static RegExp email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
