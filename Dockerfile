# Базовий образ для рантайму
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Render задає PORT, а ми кажемо Kestrel слухати саме його
ENV ASPNETCORE_URLS=http://0.0.0.0:${PORT}

# Для автодетекту Render-ом хоч якийсь порт «підсвітити»
EXPOSE 10000

# Образ для збірки
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Копіюємо csproj окремо – кеш кращий
COPY HotelWebsite.csproj ./
RUN dotnet restore

# Копіюємо решту коду
COPY . ./
RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false

# Фінальний образ
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "HotelWebsite.dll"]
