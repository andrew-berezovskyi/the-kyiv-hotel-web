# The Hotel Kyiv — ASP.NET Core MVC Demo

A hotel showcase website built with ASP.NET Core MVC. Its home page presents the hotel concept, experiences, payment visuals, and a desktop app section. This is a presentation site: the search field, booking, and payment flows are not connected to server logic or a database.

## Tech stack

- C# and ASP.NET Core MVC on .NET 8
- Razor views and static assets in `wwwroot/`
- A multi-stage Dockerfile

## Run locally

Install the .NET 8 SDK, then run from the repository root:

```bash
dotnet restore HotelWebsite.csproj
dotnet run --project HotelWebsite.csproj
```

Open the local URL printed by `dotnet run`. To compile without starting the site, use `dotnet build HotelWebsite.csproj`.

## Project layout

- `Controllers/HomeController.cs` — home, privacy, and error actions.
- `Views/Home/` and `Views/Shared/` — page templates and shared layout.
- `wwwroot/` — CSS, JavaScript, images, and video assets.
- `Program.cs` — MVC services and routing.
- `Dockerfile` — .NET 8 container build.

The hotel and payment copy is demo content. This repository does not implement room inventory, payment processing, or a desktop app integration.
