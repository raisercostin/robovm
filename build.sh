#/bin/sh
set -e
mvn clean install
mvn -f plugins/idea/pom.xml clean install -Didea.home=$HOME/idea-15
mvn -f plugins/eclipse/pom.xml clean install
./plugins/gradle/gradlew -b plugins/gradle/build.gradle clean assemble install
