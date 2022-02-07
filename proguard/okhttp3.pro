## com.squareup.okhttp3:okhttp:3.12.2

# Platform calls Class.forName on types which do not exist on Android to determine platform.
-dontwarn okhttp3.**
-dontwarn okio.**

# java.nio.file.* usage which cannot be used at runtime. Animal sniffer annotation.
-dontwarn okio.Okio
# JDK 7-only method which is @hide on Android. Animal sniffer annotation.
-dontwarn okio.DeflaterSink
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
