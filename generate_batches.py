import json

with open('C:/Users/IT/Documents/NIKAMORE/replacements.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

for i in range(0, len(data), 5):
    batch = data[i:i+5]
    calls = []
    for item in batch:
        path = item['absolutePath']
        chunks = item['replacementChunks']
        for chunk in chunks:
            # remove line limits to reduce payload if we just use exact targetContent
            if 'startLine' in chunk:
                del chunk['startLine']
            if 'endLine' in chunk:
                del chunk['endLine']
        chunks_str = json.dumps(chunks, ensure_ascii=False)
        call_str = f'call:default_api:multi_replace_file_content{{"absolutePath": "{path}", "replacementChunks": {chunks_str}}}'
        calls.append(call_str)

    with open(f'C:/Users/IT/Documents/NIKAMORE/batch_{i//5}.txt', 'w', encoding='utf-8') as f_out:
        f_out.write(''.join(f'\\x02{c}\\x03' for c in calls))
