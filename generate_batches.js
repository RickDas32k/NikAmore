const fs = require('fs');
const data = JSON.parse(fs.readFileSync('C:/Users/IT/Documents/NIKAMORE/replacements.json', 'utf8').replace(/^\uFEFF/, ''));

// We want 4 batches
const numBatches = 4;
const batchSize = Math.ceil(data.length / numBatches);

for (let i = 0; i < numBatches; i++) {
    const batch = data.slice(i * batchSize, (i + 1) * batchSize);

    // Create the tool calls string
    let out = '';
    for (const file of batch) {
        const path = file.absolutePath;
        const chunks = file.replacementChunks.map(c => ({
            targetContent: c.targetContent,
            replacementContent: c.replacementContent,
            allowMultiple: true
        }));
        // We will output EXACTLY the JSON argument object for each file
        out += JSON.stringify({
            absolutePath: path,
            replacementChunks: chunks
        }) + '\n=======\n';
    }
    fs.writeFileSync(`C:/Users/IT/Documents/NIKAMORE/batch_${i}.txt`, out, 'utf8');
}
