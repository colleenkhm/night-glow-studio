# night_glow_studio

A toolkit for creatives, a portal for explorers, and an arcade for acheivers. Inspired by many late nights in high school and college. Built in Flutter by Colleen Murray

## Dev notes

- **`SiteCardData.tags` vs. displayed tags**: hub cards (`_SiteCard` in
  `lib/site_hub_screen.dart`) have a fixed height, so they only render the
  first 3 tags (`card.tags.take(3)`) — a 4th tag would wrap the chip row
  and overflow/overlap the card. The full `tags` list still drives
  filtering on both the hub pages and the randomizer, so a site stays
  findable by tags beyond the first 3. `_ResultCard` in
  `lib/random_screen.dart` isn't height-constrained and shows all tags.
