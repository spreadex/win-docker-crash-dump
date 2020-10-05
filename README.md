# crash-test
minimum repo to replicate windows error reporting not generating dump files in a windows container.

## Building crash-test

    docker build . -t crash-test;

## Running crash-test
There is a helper script to help run the contianer.  It will default to running the app with the user exception flag which is the only flag that generates a dump file.  Running with either the so or oom flag will not generate a dump file.

    .\run-container.ps1  # defaults to -flag ue
    .\run-container.ps1 -flag so

## Flags

| Flag      | Description               |
|:----------|:--------------------------|
| so        | StackOverflow exception   |
| ue        | User exception            |
| oom       | OutOfMemory exception     |