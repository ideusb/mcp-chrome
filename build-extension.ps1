# Chrome MCP Extension Build Script
# Build script for Chrome extension

param(
    [switch]$zip,        # Also package as zip file
    [switch]$firefox,    # Build Firefox version
    [switch]$dev,        # Run in dev mode
    [switch]$help        # Show help
)

# Show help
if ($help) {
    Write-Host ""
    Write-Host "Chrome MCP Extension Build Script" -ForegroundColor Cyan
    Write-Host "=================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: .\build-extension.ps1 [options]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -zip      Build and package as zip file (for release)"
    Write-Host "  -firefox  Build Firefox version"
    Write-Host "  -dev      Run in development mode (hot reload)"
    Write-Host "  -help     Show this help message"
    Write-Host ""
    Write-Host "Examples:"
    Write-Host "  .\build-extension.ps1              # Build production version"
    Write-Host "  .\build-extension.ps1 -zip         # Build and package"
    Write-Host "  .\build-extension.ps1 -dev         # Development mode"
    Write-Host "  .\build-extension.ps1 -firefox     # Build Firefox version"
    Write-Host ""
    Write-Host "Output locations:"
    Write-Host "  Chrome: app/chrome-extension/.output/chrome-mv3"
    Write-Host "  Firefox: app/chrome-extension/.output/firefox-mv2"
    Write-Host "  Zip: app/chrome-extension/.output/*.zip"
    Write-Host ""
    exit 0
}

# Check if pnpm is installed
if (-not (Get-Command pnpm -ErrorAction SilentlyContinue)) {
    Write-Host "Error: pnpm not found. Please install pnpm first." -ForegroundColor Red
    Write-Host "Install command: npm install -g pnpm"
    exit 1
}

# Get project root directory
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Chrome MCP Extension Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Change to project root
Set-Location $projectRoot

# Step 1: Check dependencies
Write-Host "[1/3] Checking dependencies..." -ForegroundColor Yellow
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing dependencies..."
    pnpm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to install dependencies" -ForegroundColor Red
        exit 1
    }
}

# Step 2: Build shared package
Write-Host "[2/3] Building shared package (chrome-mcp-shared)..." -ForegroundColor Yellow
pnpm build:shared
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build shared package" -ForegroundColor Red
    exit 1
}
Write-Host "Shared package built successfully!" -ForegroundColor Green

# Step 3: Build/Run extension
if ($dev) {
    Write-Host "[3/3] Starting development mode..." -ForegroundColor Yellow
    if ($firefox) {
        pnpm --filter chrome-mcp-server dev:firefox
    } else {
        pnpm --filter chrome-mcp-server dev
    }
} elseif ($zip) {
    Write-Host "[3/3] Building and packaging extension..." -ForegroundColor Yellow
    if ($firefox) {
        pnpm --filter chrome-mcp-server zip:firefox
    } else {
        pnpm --filter chrome-mcp-server zip
    }
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to package extension" -ForegroundColor Red
        exit 1
    }
    Write-Host "Extension packaged successfully!" -ForegroundColor Green
} else {
    Write-Host "[3/3] Building extension..." -ForegroundColor Yellow
    if ($firefox) {
        pnpm --filter chrome-mcp-server build:firefox
    } else {
        pnpm --filter chrome-mcp-server build
    }
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to build extension" -ForegroundColor Red
        exit 1
    }
    Write-Host "Extension built successfully!" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Build completed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Show output location
$outputDir = Join-Path $projectRoot "app\chrome-extension\.output"
if ($firefox) {
    $extensionDir = Join-Path $outputDir "firefox-mv2"
} else {
    $extensionDir = Join-Path $outputDir "chrome-mv3"
}

if (Test-Path $extensionDir) {
    Write-Host "Extension output directory:" -ForegroundColor Yellow
    Write-Host "  $extensionDir" -ForegroundColor White
    Write-Host ""
    
    if (-not $dev) {
        Write-Host "How to load the extension:" -ForegroundColor Yellow
        Write-Host "  1. Open Chrome, navigate to chrome://extensions/" -ForegroundColor White
        Write-Host "  2. Enable Developer mode (top right)" -ForegroundColor White
        Write-Host "  3. Click Load unpacked" -ForegroundColor White
        Write-Host "  4. Select the output directory above" -ForegroundColor White
        Write-Host ""
    }
}

# If zip mode, show zip file location
if ($zip) {
    $zipFiles = Get-ChildItem -Path $outputDir -Filter "*.zip" -ErrorAction SilentlyContinue
    if ($zipFiles) {
        Write-Host "Zip files:" -ForegroundColor Yellow
        foreach ($file in $zipFiles) {
            Write-Host "  $($file.FullName)" -ForegroundColor White
        }
        Write-Host ""
    }
}
