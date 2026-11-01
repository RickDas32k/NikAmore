$res = Get-Content C:\Users\IT\Documents\NIKAMORE\replacements.json -Raw | ConvertFrom-Json
$batchSize = 5
for ($i = 0; $i -lt $res.Count; $i += $batchSize) {
    $batch = $res | Select-Object -Skip $i -First $batchSize
    $calls = @()
    foreach ($item in $batch) {
        $path = $item.absolutePath
        $chunks = $item.replacementChunks
        # We don't remove startLine/endLine here to avoid PS custom object hassle,
        # just convert to json. We use -Compress to make it small.
        $chunksJson = ConvertTo-Json $chunks -Compress -Depth 10
        # The exact tool call text
        $callStr = "call:default_api:multi_replace_file_content{`"absolutePath`": `"$path`", `"replacementChunks`": $chunksJson}"
        # We wrap it in the control characters used by the API (0x02 and 0x03)
        # But wait! As the LLM, I can just output `call:default_api:multi_replace_file_content{...}` literally.
        # So I will just output the strings directly.
        $calls += "```json`n$callStr`n```"
    }
    $outFile = "C:\Users\IT\Documents\NIKAMORE\batch_$($i/$batchSize).txt"
    $calls -join "`n" | Out-File $outFile -Encoding utf8
}
