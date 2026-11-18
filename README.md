# Fly Fishing Quest

A game-style fly fishing web app for Washington, built for an MIS final project with Claude Code.

Explore five waters (Sol Duc, Puget Sound, Yakima, Spokane, Grande Ronde) to clear the fog on the map, log catches with a photo, species, length, conditions and fly, earn XP and badges, and unlock each river's shared catch feed.

## Game rules

| Event | XP |
|---|---|
| Explore a new water (GPS within 15 miles, or manual check-in) | +50 |
| Catch 20 inches or under | +25 |
| Catch over 20 and under 30 inches (stacking "20+ inches" badge) | +200 |
| Catch 30 inches or more (stacking "30+ inches" badge) | +300 |
| First catch of a species (species badge) | +100 |

Bonuses stack. A new level every 500 XP. A river's feed stays hidden until you explore it and post a catch there yourself.

Species: steelhead, coho salmon, chinook salmon, cutthroat trout, rainbow trout, brown trout, brook trout.

## How it's built

- One file, `index.html`: plain HTML, CSS and JavaScript with no build step.
- Hosted on GitHub Pages.
- Shared posts live in a Supabase table (`supabase.sql`), read and written through Supabase's REST API.
- Each player's XP, badges and explored rivers are saved in the browser (`localStorage`).
- GPS uses the browser Geolocation API, which needs `https` (GitHub Pages provides it).

## Turning on the shared feed

1. Create a free project at https://supabase.com.
2. Open **SQL Editor**, paste the contents of `supabase.sql`, and click **Run**.
3. Open **Project Settings > API** and copy the **Project URL** and the **anon public** key.
4. Paste both into the `CONFIG` block near the top of the script in `index.html` and push.

Without those two values the app runs in device-only mode: everything works, but posts stay on that phone.

## Known limits (class project scope)

- Anyone with the link can post; there are no accounts or moderation.
- A catch is "certified" by the angler choosing a species.
- Progress is tied to one browser; clearing site data resets it.
