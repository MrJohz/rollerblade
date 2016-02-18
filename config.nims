import strutils
import ospaths


--define:nodejs  # no dependency on HTML, esp. when debugging with echo statmenets

task build_js, "build rollerblade.js":
    mkdir("build")
    cd("src")

    switch("out", thisDir() / ".." / "build" / "rollerblade.js")
    setCommand "js"

task test_nim, "test rollerblade in nim":
    echo "testing main modules"
    echo staticExec("nim c -d:unittest --verbosity:0 -r " & thisDir() / "src" / "rollerblade.nim")
    echo "-----------"

    for file in listFiles("tests"):
        let filename = file.extractFilename()
        if filename.startsWith("test_") and filename.endsWith(".nim"):
            echo "testing ", file
            echo(staticExec "nim c --verbosity:0 -r " & file)

task test_js, "test built rollerblade.js with node":
    echo "ERROR: NO JS TESTS WRITTEN"
    quit(QuitFailure)

task tests, "run test suite":
    exec "nim test_nim"
    #exec "nim test_js"
