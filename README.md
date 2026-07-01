# Cruiser Demo Video — Marketing Assets

Version history for the CRUISER LTE speed-test demo clip and everything built from it.

**Live landing page:** https://cruiser-demo.pages.dev (Cloudflare Pages)

## Context

Two people demo the CRUISER LTE speed-test app: one has weak Wi-Fi, the other shows them the app, walks through sharing the download link, and confirms the connection speed. Casual, unscripted, mixed Afrikaans/English audio.

## Files

- [`cruiser-demo.mp4`](./cruiser-demo.mp4) — the raw WhatsApp clip
- [`cruiser-demo-captions-en.srt`](./cruiser-demo-captions-en.srt) — word-for-word English translation via Whisper (Afrikaans → English). **Flagged as inaccurate/not usable** — kept for reference only, not used in any published asset.
- [`cruiser-story-captions.ass`](./cruiser-story-captions.ass) — the actual captions used for publishing: short story-context English overlays (not literal translation), styled white-on-dark-strip, bottom-center, sized for mobile.
- [`burn_captions.sh`](./burn_captions.sh) — ffmpeg script that burns `cruiser-story-captions.ass` onto `cruiser-demo.mp4`.
- [`cruiser-demo-captioned.mp4`](./cruiser-demo-captioned.mp4) — output of the burn-in script (full quality).
- [`cruiser-demo-web.mp4`](./cruiser-demo-web.mp4) — same captioned video, recompressed for web/mobile delivery (~10.5MB vs ~26MB).
- [`poster.jpg`](./poster.jpg) — poster frame extracted from the captioned video.
- [`landing-page/`](./landing-page) — the site deployed to Cloudflare Pages: `index.html`, plus its own copies of `cruiser-demo.mp4` (the web-optimized captioned video) and `poster.jpg`.

## Landing page (`landing-page/`)

Mobile-first page wrapping the captioned demo video:
- Auto-plays muted, tap video to unmute
- Fixed floating "TEST YOUR SPEED — FREE" CTA button (pulse-glow animation) linking to https://cruiser-sa.gerhardcttx.workers.dev
- Afrikaans heading ("Is jou WiFi regtig so swak?") + subheading above the video
- "Used by farmers, lodges, and reserves across South Africa" + WhatsApp pre-filled share button below the video
- Dark theme, no navbar/footer/cookie banner
- Meta Pixel is stubbed out (commented placeholder in `<head>`) — no Pixel ID exists yet on business.cttx.co.za; the `trackEvent()` JS function already calls `fbq('track', 'CruiserCTA')` automatically once a pixel is added

Deployed via `wrangler pages deploy landing-page --project-name=cruiser-demo`.

## Proposed social caption (for reference, not yet attached to any clip)

```
🚀 *CRUISER Speed Test — FULL THROTTLE on LTE*

📥 Download: *84.5 Mbps*
📤 Upload: *85.2 Mbps*
📶 Ping: 63ms | Jitter: 12ms

Nice one! My line is cruising. Can yours beat it? 😎
Test it free 👉 https://cruiser-sa.gerhardcttx.workers.dev

#CruiserSpeed #FullThrottle
```
