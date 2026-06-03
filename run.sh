./cleanup.sh

flex="lib/jflex-full-1.9.1.jar"
cup="lib/java-cup-11b.jar"
libs=".:lib/java-cup-11b.jar:lib/java-cup-11b-runtime.jar:lib/jflex-1.8.2.jar"

java -jar "$flex" LIP.flex
java -jar "$cup" -expect 1 -parser parser -symbols sym LIP.cup
javac -cp "$libs" *.java
java -cp "$libs" Main input.txt