# AI News Engine — Drop-in Module for News v3.2.1 Admin Panel

A native add-on for your existing Laravel admin panel. It generates fresh news
articles using a swappable AI provider (OpenAI / Gemini / Claude) and writes them
straight into your existing `tbl_news` table — same columns the built-in News form
uses. Runs on a schedule (cron) for hands-off auto-publishing, with a manual
"Generate Now" button and a generation log.

This module is **new, original code**. It does not modify the vendor's core files —
you only *add* files and paste a few small snippets. Vendor updates stay safe.

---

## What's inside

```
app/Models/AiNewsSetting.php            # config row + encrypted API keys
app/Models/AiNewsLog.php                # generation history
app/Services/AiNews/
   Contracts/AiProvider.php             # provider interface (the swap point)
   Providers/OpenAiProvider.php
   Providers/GeminiProvider.php
   Providers/ClaudeProvider.php
   AiProviderFactory.php                # picks the driver from settings
   AiNewsService.php                    # builds prompts, parses, saves news
app/Http/Controllers/AiNewsController.php
app/Console/Commands/GenerateAiNews.php # `php artisan ai-news:generate`
database/migrations/                    # 2 tables
resources/views/ai_news/                # settings + logs screens
snippets/                               # things you paste in (routes, sidebar, cron, SQL)
```

---

## Install (5 steps)

All paths are relative to your admin panel root: `Admin_Panel_PHP_Code_3.2.1/code/`

**1. Copy files in.** Merge the `app/`, `database/`, and `resources/` folders from
this module into the matching folders of your admin panel. Nothing gets overwritten —
these are all new files.

**2. Create the tables.**
- If you have CLI access: `php artisan migrate`
- If you're on shared hosting with no CLI: open phpMyAdmin → your news DB → **SQL**
  tab → paste the contents of `snippets/manual-tables.sql` → **Go**.

**3. Register routes.** Open `routes/web.php`. At the top with the other
`use` imports, add:
```php
use App\Http\Controllers\AiNewsController;
```
Then paste the four routes from `snippets/routes-web.php` **inside** the existing
authenticated `Route::group([...])` block (the same one that has the `news`
resource route).

**4. Add the sidebar link.** Open `resources/views/layouts/sidebar.blade.php`,
find the existing News `<li>` item, and paste the block from
`snippets/sidebar.blade.php` right after it.

**5. Schedule the cron.** Open `app/Console/Kernel.php` and add a schedule line
inside `schedule()` (see `snippets/kernel-schedule.php` for options), then add the
single system cron entry shown in that same file. The command also registers
automatically because Laravel auto-discovers commands in `app/Console/Commands/`.

Clear caches once: `php artisan optimize:clear` (or visit `/clear` — the panel
exposes that route).

---

## Configure & use

Open the admin panel → **News Management → AI News Engine**.

1. Pick your **provider** and paste its **API key** (keys are stored AES-encrypted;
   blank = keep existing).
2. Set **Default Language** and **Default Category** (required — that's where
   articles land).
3. Choose **Source mode**:
   - **Seed topics** — one topic/keyword per line; the AI writes an original article
     for each.
   - **RSS feeds** — paste feed URLs; the AI reads each headline/summary and writes
     an **original rewrite** (it is instructed never to copy source text verbatim,
     which keeps you clean for AdSense/originality).
4. Set **articles per run**, word range, and editorial tone.
5. **Auto-publish** ON = articles go live (status = active). OFF = saved as drafts
   for you to review first.
6. Hit **Save**, then **Generate Now** to test. Check **View Logs** for results.

Once the cron is set, it runs unattended on your chosen cadence.

---

## Switching providers later

Just change the **Active Provider** dropdown and save. The `AiProviderFactory` is the
only switch point; adding a new provider later = one new class implementing
`AiProvider` + one line in the factory.

---

## Notes / safeguards

- API keys are encrypted at rest using your app's `APP_KEY`. Keep `APP_KEY` backed up.
- Generated HTML is sanitized (only `<p> <h2> <h3> <ul> <li> <strong> <em> <a>` etc.)
  to block script injection from a model response.
- Slugs auto-deduplicate (`-2`, `-3`) so runs never collide.
- RSS items already turned into articles are skipped (tracked in the log table).
- The model is instructed not to fabricate quotes/stats — but AI can still err.
  For a news brand, **"Draft → review"** mode is the safer default until you trust
  the output. Flip to full auto-publish once you're comfortable.

---

## Next steps (separate from this module)

- Branding: wire your AdelSocial logo + company details via the panel's Settings.
- Fonts/design retheme on the Next.js front-end.
- AdSense readiness: `ads.txt`, policy pages, ad-unit placement, Core Web Vitals.

Tell me your final hosting choice and I'll tailor the cron + deployment steps.
