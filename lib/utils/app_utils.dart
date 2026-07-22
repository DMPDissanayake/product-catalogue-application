class AppUtils {
  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return '';

    // Remove any spaces, dashes, or other characters, keep only digits
    String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanNumber.length <= 5) {
      return cleanNumber; // If 5 or fewer digits, return as is
    }
    // Mask first digits and show last 5 digits
    String masked = '*' * (cleanNumber.length - 3);
    String lastFive = cleanNumber.substring(cleanNumber.length - 3);

    return masked + lastFive;
  }
}
