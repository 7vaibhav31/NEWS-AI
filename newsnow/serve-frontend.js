const fs = require('fs');
const path = require('path');
const http = require('http');
const url = require('url');

// Parse port from command line arguments or default to 3000
const args = process.argv.slice(2);
let port = 3000;
for (const arg of args) {
    if (arg.startsWith('--port=')) {
        port = parseInt(arg.split('=')[1], 10);
    }
}

const PUBLIC_DIR = __dirname;

const mimeTypes = {
    '.html': 'text/html; charset=utf-8',
    '.css': 'text/css; charset=utf-8',
    '.js': 'application/javascript; charset=utf-8',
    '.json': 'application/json; charset=utf-8',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.ico': 'image/x-icon',
    '.xml': 'application/xml; charset=utf-8',
    '.woff': 'font/woff',
    '.woff2': 'font/woff2',
    '.ttf': 'font/ttf',
    '.otf': 'font/otf',
    '.eot': 'application/vnd.ms-fontobject'
};

// Check if a directory is valid and search for dynamic paths
function resolveDynamicPath(root, segments) {
    let currentDir = root;
    for (let i = 0; i < segments.length; i++) {
        const seg = segments[i];
        if (!fs.existsSync(currentDir) || !fs.statSync(currentDir).isDirectory()) {
            return null;
        }

        const items = fs.readdirSync(currentDir, { withFileTypes: true });

        // Try exact match first (could be a directory or file)
        let matched = items.find(item => item.name.toLowerCase() === seg.toLowerCase());
        
        // If not found, look for standard dynamic placeholders in folders
        if (!matched) {
            matched = items.find(item => item.isDirectory() && (item.name === '[slug]' || item.name === '[feedid]' || item.name === '[langCode]'));
        }

        // If still not found, and it's the last segment, check for file matches with extensions
        if (!matched && i === segments.length - 1) {
            matched = items.find(item => item.isFile() && (
                item.name.toLowerCase() === (seg + '.html').toLowerCase() || 
                item.name === '[slug].html' || 
                item.name === '[feedid].html' || 
                item.name === '[cateSlug].html' || 
                item.name === '[subCateSlug].html'
            ));
            if (matched) {
                return path.join(currentDir, matched.name);
            }
        }

        if (!matched) {
            return null;
        }

        currentDir = path.join(currentDir, matched.name);
        
        // If it's the last segment
        if (i === segments.length - 1) {
            if (fs.statSync(currentDir).isFile()) {
                return currentDir;
            } else {
                const indexPath = path.join(currentDir, 'index.html');
                if (fs.existsSync(indexPath)) {
                    return indexPath;
                }
            }
        }
    }
    return null;
}

const server = http.createServer((req, res) => {
    // Enable CORS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') {
        res.writeHead(200);
        res.end();
        return;
    }

    const parsedUrl = url.parse(req.url);
    let pathname = decodeURIComponent(parsedUrl.pathname);

    // Prevent directory traversal
    const safePath = path.normalize(pathname).replace(/^(\.\.[\/\\])+/, '');
    let filePath = path.join(PUBLIC_DIR, safePath);

    // 1. Direct file check
    if (fs.existsSync(filePath) && fs.statSync(filePath).isFile()) {
        serveFile(filePath, res);
        return;
    }

    // 2. Directory check (serve index.html inside it)
    if (fs.existsSync(filePath) && fs.statSync(filePath).isDirectory()) {
        const indexPath = path.join(filePath, 'index.html');
        if (fs.existsSync(indexPath)) {
            serveFile(indexPath, res);
            return;
        }
    }

    // 3. Clean up segments for routing checks
    const segments = pathname.split('/').filter(Boolean);

    if (segments.length > 0) {
        // Check if first segment is a language prefix (2 to 5 chars, e.g. en, es, hi)
        // and doesn't conflict with main static folders like _next
        const isLang = /^[a-zA-Z\-]{2,5}$/.test(segments[0]) && segments[0].toLowerCase() !== '_next';
        if (isLang) {
            segments[0] = '[langCode]';
        }

        const resolved = resolveDynamicPath(PUBLIC_DIR, segments);
        if (resolved) {
            serveFile(resolved, res);
            return;
        }
    }

    // 4. Fallback to 404.html
    const fallback404 = path.join(PUBLIC_DIR, '404.html');
    if (fs.existsSync(fallback404)) {
        res.writeHead(404, { 'Content-Type': 'text/html; charset=utf-8' });
        fs.createReadStream(fallback404).pipe(res);
    } else {
        res.writeHead(404, { 'Content-Type': 'text/plain' });
        res.end('404 Not Found');
    }
});

function serveFile(filePath, res) {
    const ext = path.extname(filePath).toLowerCase();
    const contentType = mimeTypes[ext] || 'application/octet-stream';
    res.writeHead(200, { 'Content-Type': contentType });
    fs.createReadStream(filePath).pipe(res);
}

server.listen(port, () => {
    console.log(`Frontend static server running at http://localhost:${port}/`);
});
