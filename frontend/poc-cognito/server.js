const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
  // Set the content type to HTML
  res.setHeader('Content-Type', 'text/html');
  
  // Check if the requested URL is for the homepage, and serve index.html
  if (req.url === '/' || req.url === '/index.html') {
    const filePath = path.join(__dirname, 'index.html');
    
    // Read the file and send it as the response
    fs.readFile(filePath, (err, content) => {
      if (err) {
        res.writeHead(500);
        res.end(`Error loading index.html: ${err}`);
        return;
      }
      
      res.writeHead(200);
      res.end(content);
    });
  }
  // Check if the requested URL is for another page, and serve that page
  else if (req.url === '/about.html') {
    const filePath = path.join(__dirname, 'public', 'about.html');
    
    // Read the file and send it as the response
    fs.readFile(filePath, (err, content) => {
      if (err) {
        res.writeHead(500);
        res.end(`Error loading about.html: ${err}`);
        return;
      }
      
      res.writeHead(200);
      res.end(content);
    });
  }
  // Return a 404 error for any other requests
  else {
    res.writeHead(404);
    res.end('Page not found');
  }
});

server.listen(3000, () => {
  console.log('Server running at http://localhost:3000/');
});
