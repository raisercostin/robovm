#/bin/sh
set -e

VERSION=2.0.3
mvn -q dependency:get -Dartifact="co.leantechniques:maven-buildtime-extension:$VERSION"

mvn clean install -Dmaven.ext.class.path="$HOME/.m2/repository/co/leantechniques/maven-buildtime-extension/$VERSION/maven-buildtime-extension-$VERSION.jar"
mvn -f plugins/idea/pom.xml clean install -Didea.home=$HOME/idea-15 -Dmaven.ext.class.path="$HOME/.m2/repository/co/leantechniques/maven-buildtime-extension/$VERSION/maven-buildtime-extension-$VERSION.jar"
mvn -f plugins/eclipse/pom.xml clean install -Dmaven.ext.class.path="$HOME/.m2/repository/co/leantechniques/maven-buildtime-extension/$VERSION/maven-buildtime-extension-$VERSION.jar"
./plugins/gradle/gradlew -b plugins/gradle/build.gradle clean assemble install
