--define:nodejs  # no dependency on HTML, esp. when debugging with echo statmenets

task build, "build rollerblade.js":
    switch("out", "build/rollerblade.js")
    mkdir("build")

    setCommand "js"

task test_nim, "test rollerblade in nim":
    echo "ERROR: NO TESTS EXIST"
    quit(QuitFailure)

task test_js, "test built rollerblade.js with node":
    echo "ERROR: NO JS TESTS WRITTEN"
    quit(QuitFailure)

task tests, "run test suite":
    exec "nim test_nim"
    exec "nim test_js"