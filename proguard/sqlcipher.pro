## net.zetetic:android-database-sqlcipher

-keep,includedescriptorclasses class net.sqlcipher.** { *; }
-keep,includedescriptorclasses interface net.sqlcipher.** { *; }

## NOTE: アプリで定義しているデータオブジェクトをsqlcipher経由でDBに保存している。
## これらのモデルを最適化対象外にしないとクラッシュするため以下の記載で除外している。
-keepclassmembers public class com.talknote.talknote.** extends com.talknote.framework.domain.AbstractModel {
    <init>(android.database.Cursor);
}
-keep class com.talknote.framework.models.** { *; }
-keep class com.talknote.talknote.model.** { *;}

