
String toPhoneFormat(String phone) {
  if (phone.length < 12) return phone;
  String res = "";
  if (phone[0] == "+")
    res = phone.substring(1, phone.length);
  else
    res = phone;
  return '+' + res.substring(0, 3) + ' ' + res.substring(3, 5) + ' ' + res.substring(5, 8) + ' ' + res.substring(8, 10) + ' ' + res.substring(10, 12);
}