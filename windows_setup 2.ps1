# BOTB Judges Edition - Windows setup script
# JEGEBEJEE: PowerShell be ew sheweye bika:
#   powershell -ExecutionPolicy Bypass -File windows_setup.ps1
#
# Am enscripte tenha armere resmiye (winget) demezrinet.
# Hich weyshe neheni, hich credential, hich download i nakanawed.

$ProgressPreference = "SilentlyContinue"
Write-Host "=== BOTB Judges Edition - Windows setup ===" -ForegroundColor Cyan

# 0. Hesibberkrdni winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Warning "winget nade. Le Microsoft Store: 'App Installer' demezre we duwabare kardabe."
    exit 1
}

function Install-Tool {
    param($Id, $Name, $Check)
    try {
        if (& $Check) { Write-Host "[OK] $Name: pe heshto darre" -ForegroundColor Green; return }
        Write-Host "Demezrenin: $Name ..."
        winget install --id $Id -e --accept-source-agreements --accept-package-agreements | Out-Null
        Write-Host "[OK] $Name: demezra" -ForegroundColor Green
    } catch {
        Write-Warning "$Name: demezran nest. Desti le Microsoft Store / website i resmi demezre."
    }
}

# 1. Git (bo karbari repo)
Install-Tool -Id "Git.Git" -Name "Git" -Check {
    Get-Command git -ErrorAction SilentlyContinue
}

# 2. Node.js LTS (bo agent i CLI weger: Gemini CLI, Aider)
Install-Tool -Id "OpenJS.NodeJS.LTS" -Name "Node.js LTS" -Check {
    Get-Command node -ErrorAction SilentlyContinue
}

# 3. Apple Devices (drayveri USB bo iPhone - Microsoft Store)
Install-Tool -Id "9NFH3W1G02NG" -Name "Apple Devices" -Check {
    Get-AppxPackage -Name "AppleDevices*" -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "=== Hangawekani dwe ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "A. Drustkrdni IPA (le GitHub - macOS runner):"
Write-Host "   1.Repo i GitHub drust be (public)"
Write-Host "   2.Foldere ios/JudgesEdition + build/github_actions_workflow.yml barkle"
Write-Host "     (nawi workflow: .github/workflows/build.yml)"
Write-Host "   3.Actions -> Run workflow -> Artifacts -> IPA dagre"
Write-Host ""
Write-Host "B. Emza u damezrandn (le Windows):"
Write-Host "   1.sideloadly.io -> Sideloadly demezre"
Write-Host "   2.iPhone be kabul dabsre -> Sideloadly -> IPA + Apple ID i khoy -> Start"
Write-Host "   3.iPhone: Settings > VPN & Device Management > Trust"
Write-Host ""
Write-Host "C. Agent i CLI (eger dewet):" 
Write-Host "   Gemini CLI (bekhorrayi):  npm install -g @google/gemini-cli ; gemini"
Write-Host "   Aider:                    pip install aider-chat ; aider"
Write-Host ""
Write-Host "!!! HERGIZ RDP password yan IP i mashinake bo kesek nene, her wexa AI yan keseik ishawet !!!"
Write-Host ""
Read-Host "Tawaw. Be Enter dagre bo daxstun"
