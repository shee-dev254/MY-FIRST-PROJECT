@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

REM Simple HTTP Server using PowerShell
REM This will serve the portfolio on http://localhost:8000

echo.
echo 🚀 Starting Portfolio Server...
echo.

powershell -NoProfile -Command ^
"$port = 8000; $folder = pwd; $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:' + $port + '/'); $listener.Start(); Write-Host 'Portfolio server running on http://localhost:8000' -ForegroundColor Green; Write-Host 'Press Ctrl+C to stop' -ForegroundColor Yellow; while ($listener.IsListening) { $context = $listener.GetContext(); $request = $context.Request; $response = $context.Response; $localPath = $request.Url.LocalPath; if ($localPath -eq '/') { $localPath = '/index.html' }; $filePath = [System.IO.Path]::Combine($folder, $localPath.TrimStart('/').Replace('/', '\')); if ([System.IO.File]::Exists($filePath)) { $file = Get-Item $filePath; $content = [System.IO.File]::ReadAllBytes($file.FullName); $ext = $file.Extension; $contentType = 'text/plain'; if ($ext -eq '.json') { $contentType = 'application/json' } elseif ($ext -eq '.js') { $contentType = 'application/javascript' } elseif ($ext -eq '.css') { $contentType = 'text/css' } elseif ($ext -eq '.html') { $contentType = 'text/html' } elseif ($ext -match '\.(jpg|jpeg|png|gif)') { $contentType = 'image/' + $ext.Substring(1) }; $response.ContentType = $contentType; $response.OutputStream.Write($content, 0, $content.Length) } else { $response.StatusCode = 404 }; $response.Close() }"

pause
