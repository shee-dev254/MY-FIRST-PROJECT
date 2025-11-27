# Evan — Personal Portfolio

This is a single-page, responsive portfolio built with HTML, Bootstrap 5, AOS (Animate On Scroll), and a small amount of custom CSS/JS.

## Files
- `index.html` — main portfolio site
- `css/style.css` — custom styles and animations
- `js/main.js` — interactions (smooth scroll, filter, contact handler)
- `data/projects.json` — project data (CMS-friendly)
- `admin.html` — admin panel to manage projects and profile photo
- `js/admin.js` — admin logic

## ⚠️ Important: Must Run on HTTP Server

**You MUST serve this via HTTP (not file://) for projects to load.** This is a security restriction in modern browsers.

### Option 1: Using VS Code (Easiest)
1. Install the **"Live Server"** extension (by Ritwick Dey)
2. Right-click `index.html` → "Open with Live Server"
3. Browser opens automatically on http://localhost:5500

### Option 2: Using Node.js
```bash
# From the PORTFOLIO folder:
node server.js
# Then open http://localhost:8000
```

### Option 3: Using Python 3
```bash
python -m http.server 8000
# Then open http://localhost:8000
```

### Option 4: Using PHP
```bash
php -S localhost:8000
# Then open http://localhost:8000
```

## Admin Panel
- Go to `http://localhost:8000/admin.html` (replace 8000 with your port)
- Upload profile photo
- Add/edit/delete projects
- Changes save to browser storage and appear on the portfolio after refresh

## Features
- ✅ Responsive design (mobile, tablet, desktop)
- ✅ Smooth scroll animations (AOS)
- ✅ Dynamic project loading from JSON
- ✅ Project modals with image galleries
- ✅ Portfolio filtering (All/Web/Design/Content)
- ✅ Admin CRUD for projects
- ✅ Profile photo uploader
- ✅ Contact form
- ✅ Testimonials section

## Next Steps
- Replace contact form `mailto:` with real backend (Formspree, Netlify, etc.)
- Customize hero text and About section with your info
- Deploy to GitHub Pages, Netlify, Vercel, or any static host

