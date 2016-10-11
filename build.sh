#/bin/sh
set -e

mvn -T 1C clean install -DskipTests
mvn -f plugins/idea/pom.xml -T 1C clean install -Didea.home=$HOME/idea-15
mvn -f plugins/eclipse/pom.xml -T 1C clean install
./plugins/gradle/gradlew -b plugins/gradle/build.gradle clean assemble install
