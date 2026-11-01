$res = Get-Content C:\Users\IT\Documents\NIKAMORE\replacements.json -Raw | ConvertFrom-Json
$totalChunks = 0
foreach ($item in $res) {
    $totalChunks += $item.replacementChunks.Count
}
Write-Output "Total files: $($res.Count), Total chunks: $totalChunks"
