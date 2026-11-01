$content = Get-Content C:\Users\IT\Documents\NIKAMORE\tool_calls.txt
$chunkSize = 5
$chunkNum = 1
for ($i = 0; $i -lt $content.Count; $i += $chunkSize) {
    $batch = $content | Select-Object -Skip $i -First $chunkSize
    $batch | Out-File "C:\Users\IT\Documents\NIKAMORE\tool_calls_part$chunkNum.txt" -Encoding utf8
    $chunkNum++
}
