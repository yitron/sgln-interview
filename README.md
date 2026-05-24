# NGL Interview Tool — Railway Deployment

## Files
- `index.html` — full app (single file, all JS inline)
- `Dockerfile` — build instructions for Railway
- `entrypoint.sh` — injects env vars into HTML at startup
- `railway-nginx.conf` — nginx config (Railway injects $PORT automatically)

---

## Step 1 — Get a Google OAuth Client ID (5 min)

1. Go to https://console.cloud.google.com
2. Create a new project (e.g. "NGL Interview Tool")
3. In the left menu: **APIs & Services** → **OAuth consent screen**
   - User type: **External**
   - App name: NGL Interview Tool
   - Support email: hongzhuang.lim@gmail.com
   - Save and continue through the rest (defaults are fine)
4. Go to **APIs & Services** → **Credentials**
5. Click **+ Create Credentials** → **OAuth 2.0 Client ID**
   - Application type: **Web application**
   - Name: NGL Interview Tool
   - Authorised JavaScript origins:
     - `http://localhost` (for testing)
     - `https://YOUR-APP.up.railway.app` ← add this after Railway gives you a domain
   - Click **Create**
6. Copy the **Client ID** (looks like `123456789-abc.apps.googleusercontent.com`)

---

## Step 2 — Push to GitHub

1. Create a new repo on github.com, e.g. `ngl-interview-tool`
2. Upload all files in this folder to the repo root
3. Commit

---

## Step 3 — Deploy on Railway

1. Go to railway.app → sign in
2. **New Project** → **Deploy from GitHub repo** → select `ngl-interview-tool`
3. Railway detects the Dockerfile automatically
4. Before deploying, go to **Variables** tab and add:
   - Key: `GOOGLE_CLIENT_ID`
   - Value: *(paste your Client ID from Step 1)*
5. Click **Deploy**

---

## Step 4 — Add your Railway domain to Google OAuth

1. Once deployed, go to Railway → **Settings** → **Networking** → **Generate Domain**
2. Copy your domain (e.g. `ngl-interview-tool.up.railway.app`)
3. Go back to Google Cloud Console → Credentials → your OAuth Client ID → Edit
4. Under **Authorised JavaScript origins**, add `https://ngl-interview-tool.up.railway.app`
5. Save

Your app is now live and protected. Only hongzhuang.lim@gmail.com can access the dashboard.

---

## How data works

- Responses are stored in each **browser's localStorage**
- The dashboard is locked behind Google OAuth (only hongzhuang.lim@gmail.com)
- Each interviewer runs interviews on their own device; use **Export CSV** to collect and merge

## Team interviewers
| Interviewer | Pool |
|---|---|
| Johnson | GetGo interns (SG) |
| Chin Hwee | ST interns (SG) |
| Glen | US interns |
| Hong Zhuang | Polytechnic contacts (SG) |
| Jamie Tan | University contacts (SG) |
