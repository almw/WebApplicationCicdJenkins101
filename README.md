# WebApplicationCicdJenkins101

````sh
dotnet dev-certs https --trust

dotnet restore "./WebApplicationCicdJenkins101.csproj"

dotnet build "WebApplicationCicdJenkins101.csproj" -c Release -o /app/build

dotnet publish "WebApplicationCicdJenkins101.csproj" -c Release -o /app/publish

dotnet watch

````
