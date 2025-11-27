const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 8000;
const FOLDER = __dirname;

const server = http.createServer((req, res) => {
  let filePath = path.join(FOLDER, req.url === '/' ? 'index.html' : req.url);
  
  fs.readFile(filePath, (err, content) => {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/html' });
      res.end('<h1>404 - File Not Found</h1>');
    } else {
      const ext = path.extname(filePath);
      let contentType = 'text/html';
      if (ext === '.json') contentType = 'application/json';
      else if (ext === '.js') contentType = 'application/javascript';
      else if (ext === '.css') contentType = 'text/css';
      else if (['.jpg', '.jpeg', '.png', '.gif'].includes(ext)) contentType = 'image/' + ext.slice(1);

      res.writeHead(200, { 'Content-Type': contentType });
      res.end(content);
    }
  });
});

server.listen(PORT, () => {
  console.log(`🚀 Portfolio server running on http://localhost:${PORT}`);
  console.log(`📁 Serving from: ${FOLDER}`);
  console.log(`Press Ctrl+C to stop`);
});
