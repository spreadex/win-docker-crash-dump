# crash-test
minimum repo to replicate windows error reporting not generating dump files in a windows container.

## Building crash-test

    docker build . -t crash-test;
> :warning: If you get the following "**no matching manifest for windows/amd64 10.0.17763**".  Change the base image tag to the tag that matches your version of windows. 
eg FROM mcr.microsoft.com/windows/servercore:2004 AS base -> FROM mcr.microsoft.com/windows/servercore:1903 AS base.  You can find the version of windows you are on by running **winver** from the command line. 

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