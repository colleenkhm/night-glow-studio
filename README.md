# night_glow_studio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dev notes

- **`SiteCardData.tags` vs. displayed tags**: hub cards (`_SiteCard` in
  `lib/site_hub_screen.dart`) have a fixed height, so they only render the
  first 3 tags (`card.tags.take(3)`) — a 4th tag would wrap the chip row
  and overflow/overlap the card. The full `tags` list still drives
  filtering on both the hub pages and the randomizer, so a site stays
  findable by tags beyond the first 3. `_ResultCard` in
  `lib/random_screen.dart` isn't height-constrained and shows all tags.
