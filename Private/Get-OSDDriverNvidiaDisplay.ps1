function Get-OSDDriverNvidiaDisplay {
    [CmdletBinding()]
    Param ()

    $ModuleNvidiaDisplay = @()
    $ModuleNvidiaDisplay = Get-ChildItem "$($MyInvocation.MyCommand.Module.ModuleBase)\GetOSDDriver\NvidiaDisplay" *.drvpack -Recurse | Select-Object FullName

    $NvidiaDisplay = @()
    $NvidiaDisplay = foreach ($item in $ModuleNvidiaDisplay) {
        Get-Content $item.FullName | ConvertFrom-Json
    }
    $NvidiaDisplay = $NvidiaDisplay | Sort-Object -Property LastUpdate -Descending
    Return $NvidiaDisplay
}