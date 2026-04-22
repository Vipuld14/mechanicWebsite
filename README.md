# Willy's Mobile Mechanic Website

A full-featured website with service listings, online booking, and a password-protected admin dashboard.

---

## 📁 File Structure

```
willys-mechanic/
├── index.html              ← Homepage / Services page
├── pages/
│   ├── book.html           ← Customer booking page
│   └── admin.html          ← Admin dashboard (password protected)
├── css/
│   └── style.css           ← All styles
├── js/
│   └── config.js           ← YOUR SUPABASE KEYS GO HERE
└── supabase-setup.sql      ← Run this once in Supabase
```

---

## 🚀 Setup Instructions

### Step 1 — Create a Supabase Project (Free)

1. Go to **https://supabase.com** and sign up for free
2. Click **New Project** → give it a name like "willys-mechanic"
3. Set a database password (save it somewhere safe)
4. Wait for it to provision (~1 minute)

### Step 2 — Run the Database Setup

1. In your Supabase project, click **SQL Editor** in the left sidebar
2. Open the file `supabase-setup.sql` from this folder
3. Paste the entire contents into the editor
4. Click **Run** → you should see "Success"

### Step 3 — Get Your API Keys

1. In Supabase, go to **Project Settings → API**
2. Copy:
   - **Project URL** (looks like `https://abc123.supabase.co`)
   - **anon public** key (long string starting with `eyJ...`)

### Step 4 — Add Keys to the Site

Open `js/config.js` and replace the placeholder values:

```js
const SUPABASE_URL = 'https://YOUR-PROJECT.supabase.co';
const SUPABASE_ANON_KEY = 'eyJ...your-anon-key...';
const ADMIN_PASSWORD = 'willys2024';  // ← Change this!
```

> **Important**: Also update the admin password in your Supabase SQL Editor:
> ```sql
> UPDATE admin_settings SET value = 'your-new-password' WHERE key = 'admin_password';
> ```

---

## 🌐 Deploy to GitHub Pages

1. Create a free account at **https://github.com**
2. Click **New Repository** → name it `willys-mechanic` → Public → Create
3. Upload all the files (drag & drop in the GitHub interface, or use Git)
4. Go to **Settings → Pages**
5. Under "Source", select **main branch** → **/ (root)** → Save
6. Your site will be live at: `https://YOUR-USERNAME.github.io/willys-mechanic/`

### To update the site later:
Just edit files and push/upload again to GitHub. Changes go live in ~1 minute.

---

## 🔧 Admin Access

Visit: `https://your-site.com/pages/admin.html`

Default password: `willys2024` ← **Change this before going live!**

### What you can do in the Admin:
- **Click any future date** on the calendar to set what time slots are available that day
- **Toggle times on/off** (green = available, red dot = already booked by customer)
- **View all upcoming appointments** with customer name, vehicle, service, phone number, and address
- **Cancel appointments** with one click
- **Stats** show today's count, this week's count, and total upcoming

---

## 📞 Updating Your Phone Number

Search the files for `(555) 000-0000` and replace with your real number. It appears in:
- `index.html` (phone bar + footer)
- `pages/book.html` (footer)

---

## 📧 Email in the footer

Search for `willy@willysmobilemechanic.com` in `index.html` and update to your real email.

---

## 🔒 Security Note

This site uses Supabase's free tier with Row Level Security (RLS) enabled. The admin
page is protected by a password stored in `config.js`. For higher security in the future,
consider upgrading to use Supabase Auth with a real login system.
