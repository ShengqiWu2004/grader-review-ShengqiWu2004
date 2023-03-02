CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
rm -fr curDir
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
if [[ -f student-submission/ListExamples.java ]]
then
    echo 'correct file detected'
    mkdir curDir/
    cp student-submission/ListExamples.java curDir/
    cp TestListExamples.java curDir/
    cd curDir
    javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
    if [[ $? -ne 0 ]]
    then 
        echo 'Compile failed'
        exit 1
    else
        echo 'Compile Succeeded'
        java TestListExample ListExample
        java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
        grep "Test run:" result.txt
    fi
else
    echo 'Invalid submission'
    exit 1
fi
