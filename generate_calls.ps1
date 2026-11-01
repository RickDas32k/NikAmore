$res = Get-Content C:\Users\IT\Documents\NIKAMORE\replacements.json -Raw | ConvertFrom-Json
$output = ""
foreach ($fileItem in $res) {
    $path = $fileItem.absolutePath
    $chunksJson = $fileItem.replacementChunks | ConvertTo-Json -Compress
    $output += "call:default_api:multi_replace_file_content{`"absolutePath`": `"$path`", `"replacementChunks`": $chunksJson} `n"
}
[System.IO.File]::WriteAllText('C:\Users\IT\Documents\NIKAMORE\tool_calls.txt', $output, [System.Text.Encoding]::UTF8)
