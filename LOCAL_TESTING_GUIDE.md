# Local Testing Guide for AI Cover Image Feature

Follow these steps to set up the project locally on your machine (using XAMPP or Laragon) so you can test the AI Image Generation feature and see its effect directly on the frontend website.

---

## Step 1: Database Setup
1. Start your local server control panel (like **XAMPP** or **Laragon**) and make sure **Apache** and **MySQL** are running.
2. Open **phpMyAdmin** in your browser (usually `http://localhost/phpmyadmin`).
3. Create a new database named `u948859228_news` (collation: `utf8mb4_unicode_ci`).
4. Click on the database name, go to the **Import** tab, select the file **`u948859228_news.sql`** (from the project root directory), and click **Import/Go**.

---

## Step 2: Environment Configuration (.env)
Open the file [news/.env](file:///d:/intern_project/news/.env) in your editor and check the database credentials:
* If you are using standard **XAMPP** defaults, update lines 12–17 to look like this:
  ```env
  DB_CONNECTION=mysql
  DB_HOST=127.0.0.1
  DB_PORT=3306
  DB_DATABASE=u948859228_news
  DB_USERNAME=root
  DB_PASSWORD=
  ```
  *(Leave `DB_PASSWORD` blank if you haven't set a MySQL password).*

---

## Step 3: Initialize the Backend Application
Open your terminal/command prompt, navigate to the `news/` directory, and run the following setup commands:

1. **Install dependencies**:
   ```bash
   composer install
   ```
2. **Run database migrations** (this will add the new AI image configuration columns we created):
   ```bash
   php artisan migrate
   ```
3. **Link the public storage folder** (so the browser can load the generated images):
   ```bash
   php artisan storage:link
   ```

---

## Step 4: Run the Backend & Frontend Servers

We have configured everything so they work together locally. Run these commands:

### A. Run Backend Laravel Server
In the `news` directory, run:
```bash
php artisan serve
```
* This runs the Backend & Admin Panel at: **`http://127.0.0.1:8000`**

### B. Run Frontend Website Server
We updated the frontend static files so they fetch from your local backend API (`http://localhost:8000/api/`) instead of the remote production server.
In the `newsnow` directory, serve the static website on port 3000:
```bash
php -S 127.0.0.1:3000
```
* This runs the Frontend website at: **`http://127.0.0.1:3000`**

---

## Step 5: Test the Feature and See the Effect
1. Open **`http://127.0.0.1:8000/admin`** in your browser.
2. Login credentials:
   - **Email**: `admin@gmail.com`
   - **Password**: `admin123`
3. Go to **News Management** -> **AI News Engine Settings** (or settings page).
4. Update the settings:
   - **Active Provider**: Select **Google Gemini**.
   - **Gemini API Key**: Paste your API Key: `YOUR_API_KEY_HERE`
   - **Enable AI Image Generation**: Turn the switch **ON**.
   - **Image Generator Provider**: Select **Free AI (Pollinations.ai)**.
5. Click **Save Settings**.
6. Run the manual trigger generator or command:
   ```bash
   php artisan ai-news:generate
   ```
7. Check the frontend at **`http://127.0.0.1:3000`**. You should see the newly generated articles populated with their AI-generated cover images directly on the site!
