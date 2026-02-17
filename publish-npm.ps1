# H88 MCP Bridge - npm 发布脚本
# 用法: .\publish-npm.ps1 [-dryRun] [-skipBuild] [-help]

param(
    [switch]$dryRun,      # 模拟发布（不实际上传）
    [switch]$skipBuild,   # 跳过构建步骤
    [switch]$help         # 显示帮助
)

$ErrorActionPreference = "Stop"

if ($help) {
    Write-Host ""
    Write-Host "H88 MCP Bridge - npm Publish Script" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: .\publish-npm.ps1 [options]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -dryRun      Dry-run publish (does not actually upload)"
    Write-Host "  -skipBuild   Skip building (use existing dist/)"
    Write-Host "  -help        Show this help message"
    Write-Host ""
    Write-Host "Prerequisites:"
    Write-Host "  1. npm login   (run once to authenticate)"
    Write-Host "  2. Node.js >= 20"
    Write-Host ""
    Write-Host "Example:"
    Write-Host "  .\publish-npm.ps1 -dryRun    # Test first"
    Write-Host "  .\publish-npm.ps1             # Actual publish"
    Write-Host ""
    exit 0
}

$ROOT_DIR = $PSScriptRoot
$NATIVE_SERVER_DIR = Join-Path $ROOT_DIR "app\native-server"
$SHARED_DIR = Join-Path $ROOT_DIR "packages\shared"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  H88 MCP Bridge - npm Publish" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# npm official registry (not mirrors)
$NPM_REGISTRY = "https://registry.npmjs.org"

# Step 0: Check npm login
Write-Host "[0/4] Checking npm authentication..." -ForegroundColor Yellow
Write-Host "  Registry: $NPM_REGISTRY" -ForegroundColor Gray
try {
    $npmUser = npm whoami --registry $NPM_REGISTRY 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "You are not logged in to npm!" -ForegroundColor Red
        Write-Host "Please run: npm login --registry $NPM_REGISTRY" -ForegroundColor Yellow
        exit 1
    }
    Write-Host "  Logged in as: $npmUser" -ForegroundColor Green
} catch {
    Write-Host "npm whoami failed. Please run: npm login --registry $NPM_REGISTRY" -ForegroundColor Red
    exit 1
}

# Step 1: Build shared package
if (-not $skipBuild) {
    Write-Host "[1/4] Building shared package..." -ForegroundColor Yellow
    Push-Location $SHARED_DIR
    try {
        pnpm build
        if ($LASTEXITCODE -ne 0) { throw "Shared package build failed" }
        Write-Host "  Shared package built." -ForegroundColor Green
    } finally {
        Pop-Location
    }
} else {
    Write-Host "[1/4] Skipping shared build (--skipBuild)" -ForegroundColor Gray
}

# Step 2: Build native-server
if (-not $skipBuild) {
    Write-Host "[2/4] Building native-server..." -ForegroundColor Yellow
    Push-Location $NATIVE_SERVER_DIR
    try {
        pnpm build
        if ($LASTEXITCODE -ne 0) { throw "Native server build failed" }
        Write-Host "  Native server built." -ForegroundColor Green
    } finally {
        Pop-Location
    }
} else {
    Write-Host "[2/4] Skipping native-server build (--skipBuild)" -ForegroundColor Gray
}

# Step 3: Verify dist
Write-Host "[3/4] Verifying dist output..." -ForegroundColor Yellow
$distDir = Join-Path $NATIVE_SERVER_DIR "dist"
$requiredFiles = @("index.js", "cli.js", "run_host.bat", "run_host.sh", "mcp\mcp-server-stdio.js", "scripts\postinstall.js")

foreach ($f in $requiredFiles) {
    $fp = Join-Path $distDir $f
    if (-not (Test-Path $fp)) {
        Write-Host "  MISSING: dist\$f" -ForegroundColor Red
        Write-Host "  Build may have failed. Run without -skipBuild." -ForegroundColor Red
        exit 1
    }
}
Write-Host "  All required dist files present." -ForegroundColor Green

# Read version from package.json
$pkgJson = Get-Content (Join-Path $NATIVE_SERVER_DIR "package.json") | ConvertFrom-Json
$version = $pkgJson.version
$name = $pkgJson.name
Write-Host "  Package: $name@$version" -ForegroundColor Cyan

# Step 4: Publish
Write-Host "[4/4] Publishing to npm..." -ForegroundColor Yellow
Push-Location $NATIVE_SERVER_DIR
try {
    if ($dryRun) {
        Write-Host "  (DRY RUN - not actually publishing)" -ForegroundColor Yellow
        npm publish --dry-run --registry $NPM_REGISTRY 2>&1
    } else {
        npm publish --access public --registry $NPM_REGISTRY 2>&1
    }
    if ($LASTEXITCODE -ne 0) {
        throw "npm publish failed"
    }
} finally {
    Pop-Location
}

Write-Host ""
if ($dryRun) {
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "  Dry run complete!" -ForegroundColor Yellow
    Write-Host "  Run without -dryRun to actually publish" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow
} else {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  Published $name@$version" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Users can now install with:" -ForegroundColor Cyan
    Write-Host "  npm install -g $name" -ForegroundColor White
    Write-Host ""
    Write-Host "Then register:" -ForegroundColor Cyan
    Write-Host "  $name register --browser all" -ForegroundColor White  
    Write-Host ""
}
