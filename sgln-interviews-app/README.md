# NGL Interview Tool — Railway Deployment

## Files in this folder
- `index.html` — the full app (single file)
- `Dockerfile` — tells Railway how to build and serve it
- `railway-nginx.conf` — nginx config (Railway injects $PORT automatically)

## Deploy to Railway (step by step)

### Step 1 — Push to GitHub
1. Create a new repo on github.com (e.g. `ngl-interview-tool`)
2. Upload all files in this folder to the repo root
3. Commit

### Step 2 — Deploy on Railway
1. Go to railway.app and sign in
2. Click **New Project** → **Deploy from GitHub repo**
3. Select your `ngl-interview-tool` repo
4. Railway auto-detects the Dockerfile — no extra config needed
5. Click **Deploy**

### Step 3 — Get your URL
1. Once deployed, go to **Settings** → **Networking**
2. Click **Generate Domain**
3. Share the URL with your team

## Notes
- Data is stored in each browser's localStorage — each team member's responses
  are saved locally on their device, not on a server.
- To collect all responses, each interviewer uses **Export CSV** after their
  interviews and shares the CSV file with the project lead (Johnson).
- No login or database required — the tool is intentionally lightweight.

## Team interviewers
- Johnson → GetGo interns (SG)
- Chin Hwee → ST interns (SG)
- Glen → US interns
- Hong Zhuang → Polytechnic contacts (SG)
- Jamie Tan → University contacts (SG)
