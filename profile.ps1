# init oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/half-life.omp.json" | Invoke-Expression

# add MSVC environment variables
cmd.exe /c "call `"C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat`" && set > %temp%\vcvars.txt"
Get-Content "$env:temp\vcvars.txt" | Foreach-Object {
  if ($_ -match "^(.*?)=(.*)$") {
    Set-Content "env:\$($matches[1])" $matches[2]
  }
}


# set aliases
Set-Alias -Name v -Value nvim
# edit dotfiles
function vivi {
  Push-Location "~\dotfiles"
  nvim
  Pop-Location
}
function ws($a, $b) {
  cd "~\ws\$a\$b"
}

# clear prompt
clear
