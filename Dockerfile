
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS builder

COPY . .

WORKDIR /src/aspnetcore2

RUN dotnet restore

RUN dotnet publish aspnetcore2/aspnetcore2.csproj -c Release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine

COPY --from=builder /app .

ENTRYPOINT ["dotnet", "aspnetcore2.dll"]