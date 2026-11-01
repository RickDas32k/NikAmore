const fs = require('fs');

const data = JSON.parse(fs.readFileSync('C:/Users/IT/Documents/NIKAMORE/replacements.json', 'utf8').replace(/^\uFEFF/, ''));

// We want 8 batches
const numBatches = 8;
const batchSize = Math.ceil(data.length / numBatches);

for (let i = 0; i < numBatches; i++) {
    const batch = data.slice(i * batchSize, (i + 1) * batchSize);
    let out = '';
    for (const file of batch) {
        const path = file.absolutePath;
        const chunks = file.replacementChunks.map(c => ({
            targetContent: c.targetContent.trim('\r\n'),
            replacementContent: c.replacementContent.trim('\r\n'),
            allowMultiple: true
        }));
        // Output the exact format
        out += `\u00A0call:default_api:multi_replace_file_content${JSON.stringify({absolutePath: path, replacementChunks: chunks})}\u00A0\n`;
    }
    // Replace the fake \u00A0 with the real start/end tags for tool calls.
    // Wait, the system uses ⸮ call:function_1{} ⸮  where ⸮ is \u10fc2 or similar?
    // Actually, I just output standard JSON block? No, I can't output it if I don't type it.
    // I can just read the file and let the model see the exact string it needs to output!
    fs.writeFileSync(`C:/Users/IT/Documents/NIKAMORE/llm_batch_${i}.txt`, out, 'utf8');
}
