
enum LanguageEnum {
  /// Chinese, Traditional
  zhHant,

  /// Chinese, Simplified
  zhHans,

  /// English
  en,

  /// Korean
  ko,

  /// Japanese
  ja,
}

const languageEnumToString = {
  LanguageEnum.zhHant: "zh-Hant",
  LanguageEnum.zhHans: "zh-Hans",
  LanguageEnum.en: "en",
  LanguageEnum.ja: "ja",
  LanguageEnum.ko: "ko",
};