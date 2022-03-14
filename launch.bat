set x=%MCusername%

if "%x%"=="" (
	set MCusername=__USERNAME_HERE__
) else (
	echo MCusername was already set!
)

set x=%uuid%

if "%x%"=="" (
	set uuid=__UUID_HERE__
) else (
	echo uuid was already set!
)

set x=%accessToken%
if "%x%"=="" (
	set accessToken=__ACCESS_TOKEN_HERE__
) else (
	echo accessToken was already set!
)
set minecraftVersion=release

set java="__YOUR_JAVA_RUNTIME__"
set authhost="https://mc.graphite-official.com"
set accounthost="https://mc.graphite-official.com"
set sessionhost="https://mc.graphite-official.com"
set serviceshost="https://mc.graphite-official.com"
set clientMain="net.minecraft.client.main.Main"

set customGameDir="1.18.2 test/"
set GameVersion="1.18.2"
set assetsDir="assets/"
set assetsIDX=1.18

set currentJar=versions\1.18.2\1.18.2.jar
set dotMinecraft=%AppData%/.minecraft
cd /D %dotMinecraft%

set differentLibs=libraries/com/mojang/logging/1.0.0/logging-1.0.0.jar;libraries/com/mojang/blocklist/1.0.10/blocklist-1.0.10.jar;libraries/com/mojang/patchy/2.2.10/patchy-2.2.10.jar;libraries/com/github/oshi/oshi-core/5.8.5/oshi-core-5.8.5.jar;libraries/net/java/dev/jna/jna/5.10.0/jna-5.10.0.jar;libraries/net/java/dev/jna/jna-platform/5.10.0/jna-platform-5.10.0.jar;libraries/org/slf4j/slf4j-api/1.8.0-beta4/slf4j-api-1.8.0-beta4.jar;libraries/org/apache/logging/log4j/log4j-slf4j18-impl/2.17.0/log4j-slf4j18-impl-2.17.0.jar;libraries/com/ibm/icu/icu4j/70.1/icu4j-70.1.jar;libraries/com/mojang/javabridge/1.2.24/javabridge-1.2.24.jar;libraries/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar;libraries/io/netty/netty-all/4.1.68.Final/netty-all-4.1.68.Final.jar;libraries/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar;libraries/com/google/guava/guava/31.0.1-jre/guava-31.0.1-jre.jar;libraries/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar;libraries/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar;libraries/commons-codec/commons-codec/1.15/commons-codec-1.15.jar;libraries/com/mojang/brigadier/1.0.18/brigadier-1.0.18.jar;libraries/com/mojang/datafixerupper/4.1.27/datafixerupper-4.1.27.jar;libraries/com/google/code/gson/gson/2.8.9/gson-2.8.9.jar;libraries/com/mojang/authlib/3.3.39/authlib-3.3.39.jar;libraries/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar;libraries/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar;libraries/commons-logging/commons-logging/1.2/commons-logging-1.2.jar;libraries/org/apache/httpcomponents/httpcore/4.4.14/httpcore-4.4.14.jar;libraries/it/unimi/dsi/fastutil/8.5.6/fastutil-8.5.6.jar;libraries/org/apache/logging/log4j/log4j-api/2.17.0/log4j-api-2.17.0.jar;libraries/org/apache/logging/log4j/log4j-core/2.17.0/log4j-core-2.17.0.jar;libraries/org/lwjgl/lwjgl/3.2.1/lwjgl-3.2.1.jar;libraries/org/lwjgl/lwjgl/3.2.2/lwjgl-3.2.2.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.1/lwjgl-jemalloc-3.2.1.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.2/lwjgl-jemalloc-3.2.2.jar;libraries/org/lwjgl/lwjgl-openal/3.2.1/lwjgl-openal-3.2.1.jar;libraries/org/lwjgl/lwjgl-openal/3.2.2/lwjgl-openal-3.2.2.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.1/lwjgl-opengl-3.2.1.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.2/lwjgl-opengl-3.2.2.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.1/lwjgl-glfw-3.2.1.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.2/lwjgl-glfw-3.2.2.jar;libraries/org/lwjgl/lwjgl-stb/3.2.1/lwjgl-stb-3.2.1.jar;libraries/org/lwjgl/lwjgl-stb/3.2.2/lwjgl-stb-3.2.2.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.1/lwjgl-tinyfd-3.2.1.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2.jar;libraries/org/lwjgl/lwjgl/3.2.1/lwjgl-3.2.1.jar;libraries/org/lwjgl/lwjgl/3.2.1/lwjgl-3.2.1-javadoc.jar;libraries/org/lwjgl/lwjgl/3.2.1/lwjgl-3.2.1-natives-windows.jar;libraries/org/lwjgl/lwjgl/3.2.1/lwjgl-3.2.1-sources.jar;libraries/org/lwjgl/lwjgl/3.2.2/lwjgl-3.2.2.jar;libraries/org/lwjgl/lwjgl/3.2.2/lwjgl-3.2.2-natives-windows.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.1/lwjgl-jemalloc-3.2.1.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.1/lwjgl-jemalloc-3.2.1-javadoc.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.1/lwjgl-jemalloc-3.2.1-natives-windows.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.1/lwjgl-jemalloc-3.2.1-sources.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.2/lwjgl-jemalloc-3.2.2.jar;libraries/org/lwjgl/lwjgl-jemalloc/3.2.2/lwjgl-jemalloc-3.2.2-natives-windows.jar;libraries/org/lwjgl/lwjgl-openal/3.2.1/lwjgl-openal-3.2.1.jar;libraries/org/lwjgl/lwjgl-openal/3.2.1/lwjgl-openal-3.2.1-javadoc.jar;libraries/org/lwjgl/lwjgl-openal/3.2.1/lwjgl-openal-3.2.1-natives-windows.jar;libraries/org/lwjgl/lwjgl-openal/3.2.1/lwjgl-openal-3.2.1-sources.jar;libraries/org/lwjgl/lwjgl-openal/3.2.2/lwjgl-openal-3.2.2.jar;libraries/org/lwjgl/lwjgl-openal/3.2.2/lwjgl-openal-3.2.2-natives-windows.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.1/lwjgl-opengl-3.2.1.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.1/lwjgl-opengl-3.2.1-javadoc.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.1/lwjgl-opengl-3.2.1-natives-windows.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.1/lwjgl-opengl-3.2.1-sources.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.2/lwjgl-opengl-3.2.2.jar;libraries/org/lwjgl/lwjgl-opengl/3.2.2/lwjgl-opengl-3.2.2-natives-windows.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.1/lwjgl-glfw-3.2.1.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.1/lwjgl-glfw-3.2.1-javadoc.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.1/lwjgl-glfw-3.2.1-natives-windows.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.1/lwjgl-glfw-3.2.1-sources.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.2/lwjgl-glfw-3.2.2.jar;libraries/org/lwjgl/lwjgl-glfw/3.2.2/lwjgl-glfw-3.2.2-natives-windows.jar;libraries/org/lwjgl/lwjgl-stb/3.2.1/lwjgl-stb-3.2.1.jar;libraries/org/lwjgl/lwjgl-stb/3.2.1/lwjgl-stb-3.2.1-javadoc.jar;libraries/org/lwjgl/lwjgl-stb/3.2.1/lwjgl-stb-3.2.1-natives-windows.jar;libraries/org/lwjgl/lwjgl-stb/3.2.1/lwjgl-stb-3.2.1-sources.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2-javadoc.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2-natives-windows.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2-sources.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.1/lwjgl-tinyfd-3.2.1.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.1/lwjgl-tinyfd-3.2.1-javadoc.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.1/lwjgl-tinyfd-3.2.1-natives-windows.jar;libraries/org/lwjgl/lwjgl-tinyfd/3.2.1/lwjgl-tinyfd-3.2.1-sources.jar;libraries/org/lwjgl/lwjgl-stb/3.2.2/lwjgl-stb-3.2.2.jar;libraries/org/lwjgl/lwjgl-stb/3.2.2/lwjgl-stb-3.2.2-natives-windows.jar;libraries/com/mojang/text2speech/1.12.4/text2speech-1.12.4.jar;libraries/com/mojang/text2speech/1.12.4/text2speech-1.12.4.jar;libraries/com/mojang/text2speech/1.12.4/text2speech-1.12.4-natives-windows.jar;libraries/com/mojang/text2speech/1.12.4/text2speech-1.12.4-sources.jar;libraries/ca/weblite/java-objc-bridge/1.0.0/java-objc-bridge-1.0.0.jar;libraries/ca/weblite/java-objc-bridge/1.0.0/java-objc-bridge-1.0.0-javadoc.jar;libraries/ca/weblite/java-objc-bridge/1.0.0/java-objc-bridge-1.0.0-sources.jar;libraries/ca/weblite/java-objc-bridge/1.0.0/java-objc-bridge-1.0.0.jar

%java% -Dminecraft.api.auth.host=%authhost% -Dminecraft.api.account.host=%accounthost% -Dminecraft.api.session.host=%sessionhost% -Dminecraft.api.services.host=%serviceshost% -cp %currentJar%;%differentLibs% %clientMain% --username %MCusername% --version %GameVersion% --gameDir %customGameDir% --assetsDir %assetsDir% --assetIndex %assetsIDX% --uuid %uuid% --accessToken %accessToken% --userType mojang --versionType %minecraftVersion%