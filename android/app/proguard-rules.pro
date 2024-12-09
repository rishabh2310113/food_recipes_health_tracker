-keep class com.google.mlkit.** { *; }
-keepnames class com.google.mlkit.** { *; }
-keep class com.google.android.gms.** { *; }
-keepnames class com.google.android.gms.** { *; }

# Keep classes for text recognition
-keep class com.google.mlkit.vision.text.** { *; }

# Keep classes for specific languages if used
-keep class com.google.mlkit.vision.text.chinese.** { *; }
-keep class com.google.mlkit.vision.text.devanagari.** { *; }
-keep class com.google.mlkit.vision.text.japanese.** { *; }
-keep class com.google.mlkit.vision.text.korean.** { *; }