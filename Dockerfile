FROM mcr.microsoft.com/windows/servercore:2004 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["CrashTest.csproj", "CrashTest/"]
RUN dotnet restore "CrashTest\CrashTest.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "CrashTest.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CrashTest.csproj" -c Release --self-contained --runtime win10-x64 -o /app/publish

FROM base AS final
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
WORKDIR /app
COPY --from=publish /app/publish .
COPY ./setup_crash_dump.ps1 c:/
RUN c:/setup_crash_dump.ps1 -ExeName CrashTest.exe
CMD ./CrashTest.exe $env:FLAGGS
