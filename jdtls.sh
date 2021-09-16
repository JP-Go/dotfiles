#!/usr/bin/env bash
# Download eclipse jdtls first

# points to jdtls equinox jar file in the plugins direcory
JAR="$HOME/Java/plugins/org.eclipse.equinox.launcher_1.6.200.v20210416-2027.jar"
GRADLE_HOME=$HOME/gradle /usr/lib/jvm/java-16-openjdk/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $(echo "$JAR") \
# points to jdtls config_linux directory
  -configuration "$HOME/Java/config_linux" \
  -data "${1:-$HOME/workspace}" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED

