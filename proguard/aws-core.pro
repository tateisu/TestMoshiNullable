## om.amazonaws:aws-android-sdk-core:2.19.0

# Class names are needed in reflection
-keepnames class com.amazonaws.**
-keepnames class com.amazon.**
# Request handlers defined in request.handlers
-keep class com.amazonaws.services.**.*Handler
# The following are referenced but aren't required to run
-dontwarn com.fasterxml.jackson.**
-dontwarn org.apache.commons.logging.**
# Android 6.0 release removes support for the Apache HTTP client
-dontwarn org.apache.http.**
# The SDK has several references of Apache HTTP client
-dontwarn com.amazonaws.http.**
-dontwarn com.amazonaws.metrics.**

## NOTE: 公式的に提示されている設定は
##   -dontwarn org.apache.commons.logging.**
## のみだが、そうすると起動でクラッシュするのでorg.apache.commons配下のクラスを全てキープするようにしている。
-keep public class org.apache.commons.** { *; }

## NOTE: アップロード処理にs3のTranserUtilityを使用すると内部のenumが削除されており、アップロードに失敗するため以下を追加。
## https://github.com/aws-amplify/aws-sdk-android/issues/704
-keepclassmembers enum com.amazonaws.** { *; }
