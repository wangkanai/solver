#!/usr/bin/env pwsh

$ErrorActionPreference="Stop"

# Change to script directory
Set-Location $PSScriptRoot

Write-Host "=== Building Wangkanai.Solver ===" -ForegroundColor Green
Write-Host "Working Directory: $( Get-Location )" -ForegroundColor Cyan
Write-Host "Dotnet version:" -ForegroundColor Yellow
dotnet --version

Write-Host "Solution file exists: $( Test-Path 'solver.sln' )" -ForegroundColor Cyan

Write-Host "Cleaning solution..." -ForegroundColor Yellow
dotnet clean Solver.slnx

Write-Host "Restoring packages..." -ForegroundColor Yellow
dotnet restore Solver.slnx

Write-Host "Building solution..." -ForegroundColor Yellow
dotnet build Solver.slnx--configuration Release --no-restore

Write-Host "Running tests..." -ForegroundColor Yellow
dotnet test Solver.slnx --configuration Release --no-build --verbosity minimal

Write-Host "Creating packages..." -ForegroundColor Yellow
dotnet pack Solver.slnx --configuration Release --no-build --verbosity minimal

Write-Host "=== Build Complete ===" -ForegroundColor Green
