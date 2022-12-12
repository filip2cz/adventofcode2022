$emptyLines = (Get-Content ./input.txt) | Where-Object {$_.Trim() -eq ""} | Measure-Object | Select-Object -ExpandProperty Count
$pocetSkritku = $emptyLines + 1

$arraySkretu = New-Object int[] $pocetSkritku

$totalLines = (Get-Content ./input.txt).Length
$currentSkret = 0
$currentSkretHodnota = 0

$i = 0
while ($i -lt $totalLines){
    $currentData = Get-Content ./input.txt | Select-Object -Index $i
    if ($currentData -ne ""){
        $currentSkretHodnota = $currentSkretHodnota + $currentData
        Write-Output $currentSkretHodnota
    }
    else {
        $arraySkretu[$currentSkret] = $currentSkretHodnota

        Write-Output ""
        #next skret
        $currentSkret++
        $currentSkretHodnota = 0
        $arraySkretu[$currentSkret] = 0
    }
    $i++
}

Write-Output ""

$i = 0
while ($i -lt $pocetSkritku){
    Write-Output $arraySkretu[$i]
    $i++
}