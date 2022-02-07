## 既存のproguardに存在し、消していいのかがそもそもよくわからないものをいったん、ここに定義しています。

-dontwarn org.apache.http.**

-keep public class org.apache.http.** {
    <methods>;
}

-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

### JSON
-keep class org.json.** { *; }
