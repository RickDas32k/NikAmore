$results = @()
$targets = @('app/src/main/res', 'sharedUi/src/commonMain/composeResources', 'tv/src/main/res', 'wearos/src/main/res')
$project_dir = 'C:/Users/IT/Documents/NIKAMORE/NikAmore'

foreach ($t in $targets) {
    $base = Join-Path $project_dir $t
    if (Test-Path $base) {
        $files = Get-ChildItem -Path $base -Filter 'strings.xml' -Recurse
        foreach ($file in $files) {
            $lines = Get-Content $file.FullName -Encoding UTF8
            $chunks = @()
            for ($i = 0; $i -lt $lines.Count; $i++) {
                $line = $lines[$i]
                if ($line -match 'NikAmp' -or $line -match 'BitChord') {
                    $start_idx = $line.IndexOf('>')
                    $end_idx = $line.LastIndexOf('<')
                    if ($start_idx -ge 0 -and $end_idx -ge 0 -and $start_idx -lt $end_idx) {
                        $text_content = $line.Substring($start_idx + 1, $end_idx - $start_idx - 1)
                        if ($text_content -match 'NikAmp' -or $text_content -match 'BitChord') {
                            $new_text = $text_content -replace 'NikAmp', 'NikAmore' -replace 'BitChord', 'NikAmore'
                            $target_content = "$line"
                            $replacement_content = $line.Substring(0, $start_idx + 1) + $new_text + $line.Substring($end_idx)

                            $chunk = [ordered]@{
                                startLine = $i + 1
                                endLine = $i + 1
                                targetContent = $target_content
                                replacementContent = $replacement_content
                                allowMultiple = $false
                            }
                            $chunks += $chunk
                        }
                    }
                }
            }
            if ($chunks.Count -gt 0) {
                $item = [ordered]@{
                    absolutePath = $file.FullName.Replace('\', '/')
                    replacementChunks = $chunks
                }
                $results += $item
            }
        }
    }
}
$jsonString = ConvertTo-Json -InputObject $results -Depth 10 -Compress
[System.IO.File]::WriteAllText('C:\Users\IT\Documents\NIKAMORE\replacements.json', $jsonString, [System.Text.Encoding]::UTF8)
