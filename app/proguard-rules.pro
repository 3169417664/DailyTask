# ============================================================
# Room
# ============================================================
-keep class com.pengxh.daily.app.sqlite.bean.** { *; }
-keep class com.pengxh.daily.app.sqlite.dao.** { *; }

# ============================================================
# EventBus
# ============================================================
-keepattributes *Annotation*
-keepclassmembers class ** {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}

# ============================================================
# Gson
# ============================================================
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }

# ============================================================
# Retrofit / OkHttp
# ============================================================
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepattributes Signature, InnerClasses, EnclosingMethod
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn javax.annotation.**
-dontwarn kotlin.Unit
-dontwarn retrofit2.KotlinExtensions
-dontwarn retrofit2.KotlinExtensions$*

# ============================================================
# Coroutines
# ============================================================
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepclassmembers class kotlinx.coroutines.** {
    volatile <fields>;
}

# ============================================================
# JavaMail / Jakarta Mail
# ============================================================
-dontwarn javax.mail.**
-dontwarn javax.activation.**
-dontwarn com.sun.mail.**
-keep class javax.mail.** { *; }
-keep class com.sun.mail.** { *; }
-keep class com.sun.activation.** { *; }

# ============================================================
# Bugly
# ============================================================
-dontwarn com.tencent.bugly.**
-keep class com.tencent.bugly.** { *; }
-keep public class * extends android.app.Service

# ============================================================
# Keep data classes (used via reflection/Gson)
# ============================================================
-keep class com.pengxh.daily.app.model.** { *; }
-keep class com.pengxh.daily.app.retrofit.** { *; }

# ============================================================
# Keep JNI native methods
# ============================================================
-keepclasseswithmembernames class * {
    native <methods>;
}

# ============================================================
# Keep ViewBinding
# ============================================================
-keep class * implements androidx.viewbinding.ViewBinding {
    public static * inflate(android.view.LayoutInflater);
    public static * bind(android.view.View);
}

# ============================================================
# General
# ============================================================
-keepattributes SourceFile,LineNumberTable
-keep class android.** { *; }
