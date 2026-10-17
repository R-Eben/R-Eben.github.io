# Converts the full-resolution astro PNGs into web images for the site:
#   - <name>.jpg        full resolution, 8-bit JPEG (quality 90) for the lightbox
#   - <name>-thumb.jpg  800 px square thumbnail for the gallery grid
#
# Run from the site folder:
#   powershell -ExecutionPolicy Bypass -File tools\make-astro-images.ps1
#
# Needs ImageMagick 7 (the `magick` command) on PATH.

param(
  [string]$Source = "C:\Astro\results",
  [string]$Dest   = (Join-Path $PSScriptRoot "..\assets\astrophotography")
)

# Crop = how much of the frame (in %, centered) the THUMBNAIL keeps, so small
# targets fill the grid tile. The full-size image is never cropped.
# Raise the number if a target is clipped; lower it to zoom in further.
$photos = @(
  @{ In = "M8_1.png";       Out = "m8-lagoon";          Crop = 85  },
  @{ In = "M16_3.png";      Out = "m16-eagle";          Crop = 50  },
  @{ In = "M17_4.png";      Out = "m17-omega";          Crop = 50  },
  @{ In = "M27_2.png";      Out = "m27-dumbbell";       Crop = 30  },
  @{ In = "M31_2.png";      Out = "m31-andromeda";      Crop = 100 },
  @{ In = "M42_4.png";      Out = "m42-orion";          Crop = 100 },
  @{ In = "M51_1.png";      Out = "m51-whirlpool";      Crop = 30  },
  @{ In = "NGC_6992_5.png"; Out = "ngc6992-eastern-veil"; Crop = 100 }
)

if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
  Write-Error "ImageMagick's 'magick' command wasn't found. Install it from imagemagick.org and reopen the terminal."
  exit 1
}

New-Item -ItemType Directory -Force -Path $Dest | Out-Null

foreach ($p in $photos) {
  $src = Join-Path $Source $p.In
  if (-not (Test-Path $src)) { Write-Warning "Skipping missing file: $src"; continue }

  $full  = Join-Path $Dest "$($p.Out).jpg"
  $thumb = Join-Path $Dest "$($p.Out)-thumb.jpg"
  $crop  = "$($p.Crop)%x$($p.Crop)%+0+0"

  Write-Host "Converting $($p.In)..."
  magick $src -depth 8 -sampling-factor 4:4:4 -quality 90 $full
  magick $src -gravity center -crop $crop +repage -resize 800x800 -depth 8 -quality 82 $thumb

  $mb = [math]::Round((Get-Item $full).Length / 1MB, 1)
  $kb = [math]::Round((Get-Item $thumb).Length / 1KB)
  Write-Host ("  {0}.jpg  {1} MB   |   thumb {2} KB" -f $p.Out, $mb, $kb)
}

Write-Host "Done. Images are in $((Resolve-Path $Dest).Path)"
