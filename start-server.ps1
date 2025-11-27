# Simple HTTP Server for Windows PowerShell
# Run this to start serving the portfolio on http://localhost:8000

$port = 8000
$folder = Get-Location
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")

try {
    $listener.Start()
    Write-Host "🚀 Portfolio server running on http://localhost:$port" -ForegroundColor Green
    Write-Host "📁 Serving from: $folder" -ForegroundColor Cyan
    Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
    Write-Host ""

    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $localPath = $request.Url.LocalPath
        if ($localPath -eq "/") { $localPath = "/index.html" }
        
        $filePath = Join-Path $folder $localPath.TrimStart("/").Replace("/", "\")
        
        if (Test-Path $filePath -PathType Leaf) {
            $file = Get-Item $filePath
            $content = [System.IO.File]::ReadAllBytes($file.FullName)
            $response.ContentType = if ($file.Extension -eq ".json") { "application/json" } `
                                    elseif ($file.Extension -eq ".js") { "application/javascript" } `
                                    elseif ($file.Extension -eq ".css") { "text/css" } `
                                    elseif ($file.Extension -eq ".html") { "text/html" } `
                                    else { "text/plain" }
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $response.StatusCode = 404
            $response.StatusDescription = "Not Found"
        }
        $response.Close()
    }
} catch {
    Write-Host "Error: $_" -ForegroundColor Red
} finally {
    $listener.Close()
}
