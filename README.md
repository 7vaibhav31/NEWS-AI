# NEWS-AI Project

This repository contains the code for a full-stack AI-powered news platform. 

## Recent Feature Additions & Fixes

**1. Database and Environment Fixes**
- Diagnosed and fixed database connection failures (`SQLSTATE[HY000] [2002]`). 
- Resolved an IPv6 binding issue with MariaDB on Windows by updating `my.ini` to include `bind-address=0.0.0.0`. This allowed PHP PDO to connect correctly over `127.0.0.1` (TCP) instead of named pipes.
- Updated the `.env` DB port correctly back to `3306` to align with the new persistent background MariaDB task.

**2. AI Image Generation Flexibility**
- Integrated **Pollinations.ai** as a free, instantly-working alternative for generating article cover images.
- Maintained **OpenAI (DALL-E)** integration securely so that any admin can switch to their own OpenAI API key from the Admin Dashboard with zero code changes.
- In `AiNewsSetting.php` and `AiNewsController.php`, the system securely encrypts and manages API keys. It handles partial settings updates without accidentally wiping the saved OpenAI API key.
- Fixed `AiNewsService.php` to correctly handle `image_provider` logic, seamlessly falling back to OpenAI if Pollinations isn't selected.

**3. Settings Dashboard UI Updates**
- Updated `settings.blade.php` to dynamically show/hide the DALL-E model dropdown based on the chosen image provider (Pollinations vs OpenAI).
- Clarified UI helper text so it's obvious that Pollinations does not require an API key, whereas DALL-E does.

**4. Local Testing Environment**
- Ensured that backend (Laravel `artisan serve` on port `8000`), frontend (PHP built-in server on port `3000`), and MariaDB all run correctly together.

---

### Setup Instructions
Please refer to the `LOCAL_TESTING_GUIDE.md` for specific instructions on running the servers locally.
