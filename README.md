# 🎂 ANBUMANI Birthday Website

A premium cinematic birthday experience built with **React + Vite + Framer Motion**.

---

## 🚀 Getting Started

```bash
npm install
npm run dev
```

Open [http://localhost:5173](http://localhost:5173)

---

## 📸 Adding Real Photos

Replace these placeholder files in `public/images/`:

| File | Used In |
|------|---------|
| `memory-1.jpg` | Gallery + Timeline slot 1 |
| `memory-2.jpg` | Gallery + Timeline slot 2 |
| `memory-3.jpg` | Gallery + Timeline slot 3 |
| `memory-4.jpg` | Gallery + Timeline slot 4 |
| `memory-5.jpg` | Gallery + Timeline slot 5 |
| `memory-6.jpg` | Gallery slot 6 |
| `featured.jpg` | Full-screen featured section |

> **Tip:** Portrait images (3:4) look best for memory-1, 3, 5. Landscape (4:3) for 2, 4, 6.

---

## 🎵 Adding Birthday Music

1. Place your MP3 file at: `public/audio/birthday-music.mp3`
2. The Music button will automatically work.
3. If no file exists — the site works perfectly without it.

---

## ✏️ Customizing Content

All messages, titles, and text are in **one file**:

```
src/data/memories.js
```

Edit `siteContent` to update:
- Personal message paragraphs
- Balloon pop messages
- Featured quote
- Final surprise text

Edit `memories[]` and `timelineMoments[]` to update:
- Memory card titles, descriptions, years
- Timeline entries

---

## 🏗️ Component Architecture

```
src/
├── components/
│   ├── LoadingScreen.jsx     — ANBUMANI loading + gold progress bar
│   ├── CustomCursor.jsx      — Gold dot + ring cursor (desktop only)
│   ├── ScrollProgress.jsx    — Top line + section counter
│   ├── MusicButton.jsx       — Music toggle with animated bars
│   ├── ParticleField.jsx     — Canvas gold particles (lightweight)
│   ├── Intro.jsx             — Cinematic opening + "Begin Journey" CTA
│   ├── GiftReveal.jsx        — CSS gift box + lid opening animation
│   ├── NameReveal.jsx        — Letter-by-letter reveal + magnetic hover
│   ├── Balloon.jsx           — Reusable balloon with pop interaction
│   ├── BalloonField.jsx      — Multi-balloon scene with confetti
│   ├── MemoryCard.jsx        — Rotated photo card with gold corners
│   ├── MemoryGallery.jsx     — Editorial asymmetric photo grid
│   ├── MemoryTimeline.jsx    — Horizontal scroll timeline (vertical on mobile)
│   ├── BirthdayMessage.jsx   — "Dear AnbuMani" letter section
│   ├── FeaturedMoment.jsx    — Full-bleed photo + parallax name overlay
│   ├── Celebration.jsx       — HAPPY / BIRTHDAY / ANBUMANI stagger + confetti
│   ├── BirthdayCake.jsx      — CSS cake + interactive candles
│   └── FinalSurprise.jsx     — Fireworks + final message + replay
├── data/
│   └── memories.js           — All content (edit here)
├── hooks/
│   └── useMousePosition.js   — Mouse tracking hook
├── utils/
│   └── animations.js         — Shared Framer Motion variants
└── styles/
    └── global.css            — Design tokens + global styles
```

---

## 🎨 Design Tokens

All colors, fonts, spacing in `src/styles/global.css`:

```css
--ivory: #FAF8F2
--champagne: #F7E7CE
--gold: #C9A84C
--gold-light: #E2C06A
--blush: #F2D6D0
--sage: #B5C4B1
--font-display: 'Playfair Display'
--font-script: 'Great Vibes'
--font-body: 'Inter'
```

---

## 📱 Responsive Breakpoints

| Breakpoint | Layout |
|------------|--------|
| 320–480px | Mobile — simplified, vertical timeline |
| 481–768px | Tablet — reduced spacing |
| 769–1280px | Desktop — full layout |
| 1281px+ | Large — cinematic scale |

---

## ✨ Feature Highlights

- **Loading Screen** — Letter-by-letter ANBUMANI reveal + gold progress bar
- **Cinematic Intro** — 3-phase phased text reveal + star field + particles
- **Gift Box** — Pure CSS gift box with lid-open animation + confetti burst
- **Name Reveal** — Step-by-step letter build + gold shimmer + magnetic mouse
- **Balloon Field** — 11 balloons, pop-to-message interaction with confetti
- **Memory Gallery** — Editorial rotated photo cards with blur-to-focus reveal
- **Timeline** — Scroll-driven animated gold line, horizontal on desktop
- **Personal Message** — Elegant letter layout with line-by-line reveal
- **Featured Moment** — Parallax full-bleed photo with name overlay
- **Celebration** — Staggered word reveal + confetti rain
- **Birthday Cake** — 5 interactive candles with flickering flames + smoke
- **Final Surprise** — Firework particles + phased cinematic message reveal
- **Custom Cursor** — Gold dot + spring ring, reacts to hover states
- **Music Toggle** — Graceful, no-autoplay, works without audio file
- **Scroll Progress** — Animated top line + section counter
