# OKX "Cheer Your Nation Live" — Creator Review Portal

Interactive client review portal for the OKX World Cup 2026 influencer campaign. 24 creators across 8 MENA markets with persistent review system backed by Supabase.

## Quick Start

### 1. Supabase (database)

1. Go to [supabase.com/dashboard](https://supabase.com/dashboard) → **New Project** → name it `okx-review`
2. Open **SQL Editor** → paste the contents of `supabase-migration.sql` → **Run**
3. Go to **Settings → API** → copy:
   - **Project URL**: `https://xxxxx.supabase.co`
   - **Anon Key**: `eyJhbGciOiJIUzI1NiIs...`

4. Edit `public/index.html` — find these lines and replace with your values:
```js
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

### 2. Deploy (pick one)

#### Netlify (recommended)
1. Push this repo to GitHub
2. Go to [app.netlify.com](https://app.netlify.com) → **Add new site** → **Import from Git** → select this repo
3. Deploy settings are auto-detected from `netlify.toml`
4. Done — every git push auto-deploys

#### Vercel
1. Push this repo to GitHub  
2. Go to [vercel.com/new](https://vercel.com/new) → **Import** → select this repo
3. Deploy settings are auto-detected from `vercel.json`
4. Done — every git push auto-deploys

## How It Works

| Action | What happens |
|--------|-------------|
| Client opens URL | Loads existing reviews from Supabase |
| Client clicks ✅/❌/💬 | Auto-saves to Supabase (1.2s debounce) |
| Client adds notes | Auto-saves |
| Client clicks 🚀 Submit | Saves with timestamp, agency panel appears |
| Agency checks dashboard | See selections in Supabase Table Editor |

## Check Client Submission

```bash
curl "https://YOUR_URL.supabase.co/rest/v1/okx_reviews?campaign=eq.okx-wc2026&select=*" \
  -H "apikey: YOUR_ANON_KEY"
```

If `submitted_at` is not null → client has submitted their selections.

## Structure

```
├── public/
│   └── index.html          ← Full strategy deck + review portal
├── netlify.toml             ← Netlify config
├── vercel.json              ← Vercel config
├── supabase-migration.sql   ← Database setup
└── README.md
```
