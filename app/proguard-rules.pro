-optimizationpasses 10
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontoptimize
-dontpreverify
#-verbose # enable log
-ignorewarning

-optimizations !code/simplification/arithmetic,!field/*,!class/merging/* #Confusion algorithm
-optimizations !code/simplification/arithmetic
-optimizations !code/simplification/cast

-allowaccessmodification
-useuniqueclassmembernames
-keepattributes SourceFile,LineNumberTable
-dontwarn android.support.**
-dontskipnonpubliclibraryclasses -dontskipnonpubliclibraryclassmembers

# 记录生成的日志数据,gradle build时在本项目根目录输出
# apk 包内所有 class 的内部结构
#-dump pgd_class_files.txt
# 未混淆的类和成员
#-printseeds pgd_seeds.txt
# 列出从 apk 中删除的代码
#-printusage pgd_unused.txt
# 混淆前后的映射
#-printmapping pgd_mapping.txt

# 混淆jar
#-libraryjars libs/juniversalchardet-1.0.3.jar

#保护注解
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod

# 不混淆 下面类及其子类
-keep public class * extends android.app.Fragment
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.support.v4.app.Fragment
-keep public class com.android.vending.licensing.ILicensingService

# 不混淆Native方法名
-keepclasseswithmembernames class * {
    native <methods>;
}

#不混淆Parcelable的子类，防止android.os.BadParcelableException
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

#不混淆Serializable的子类
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# 不混淆自定义View
-keepclasseswithmembernames class * {
    public <init>(android.content.Context);
}
-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet, int, int);
}

# 不混淆枚举
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# 不混淆 com.android.support:appcompat-v7
-keep public class android.support.v7.widget.** { *; }
-keep public class android.support.v7.internal.widget.** { *; }
-keep public class android.support.v7.internal.view.menu.** { *; }

#不混淆 com.android.support:design
-dontwarn android.support.design.**
-keep class android.support.design.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }

# 不混淆BuildConfig
#-keep class com.example.BuildConfig { *; }

# 不混淆v4库
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }

#-keep public class * extends android.support.v4.view.ActionProvider {
#    public <init>(android.content.Context);
#}

# LeakCanary
-keep class org.eclipse.mat.** { *; }
-keep class com.squareup.leakcanary.** { *; }

# class$ methods are inserted by some compilers to implement .class construct,
-keepclassmembernames class * {
    java.lang.Class class$(java.lang.String);
    java.lang.Class class$(java.lang.String, boolean);
}

# Keep classes and methods that have the guava @VisibleForTesting annotation
-keep @com.google.common.annotations.VisibleForTesting class *
-keepclassmembers class * {
    @com.google.common.annotations.VisibleForTesting *;
}

##########################
#Keep square Retrofit okhttp stuff
#-dontwarn com.squareup.okhttp.internal.huc.**
#-dontwarn okio.**
#-dontwarn com.google.appengine.api.urlfetch.**
#-dontwarn rx.**
#-keep class com.squareup.** { *; }
#-keep class com.viselabs.aquariummanager.util.seneye.** { *; }
#-keep class retrofit.http.* { *; }
#-keep class retrofit.** { *; }
#-keepclasseswithmembers class * {
#    @retrofit.** *;
#}
#-keepclassmembers class * {
#    @retrofit.** *;
#}

# OkHttp oddities
#-dontwarn com.squareup.okhttp.internal.http.*
#-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
#-keepnames class com.levelup.http.okhttp.** { *; }
#-keepnames interface com.levelup.http.okhttp.** { *; }
#-keepnames class com.squareup.okhttp.** { *; }
#-keepnames interface com.squareup.okhttp.** { *; }

# Keep GSON stuff
#-keep class sun.misc.Unsafe { *; }
#-keep class com.google.gson.** { *; }
# Application classes that will be serialized/deserialized over Gson
#-keep class com.xxx.xxx.** { *; }#保持实体数据结构接口不被混淆(也就是被GSON注解的实体结构) 此处xxx.xxx是自己接口的包名

#-keep class com.xxx.xxx.** { *; }#保持WEB接口不被混淆 此处xxx.xxx是自己接口的包名