#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["WebApplicationCicdJenkins101.csproj", ""]
RUN dotnet restore "./WebApplicationCicdJenkins101.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "WebApplicationCicdJenkins101.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebApplicationCicdJenkins101.csproj"  -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApplicationCicdJenkins101.dll"]
# docker build . -t dsk260/webappcicdjenkins101
# docker compose up
# docker run -d -p 8080:80 dsk260/webappcicdjenkins101