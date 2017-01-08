echo "Recording your Speech (Ctrl+C to Transcribe)"
arecord -D plughw:1,0 -q -f cd -t wav -d 1 -r 16000 | flac - -f --best --sample-rate 16000 -s -o daveconroy.flac;

echo "Converting Speech to Text..."
wget -q -U "Mozilla/5.0" --post-file daveconroy.flac --header "Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium&key=AIzaSyA87UP0tfwjHg1ZeQUuHkCNwNF-vxi5gaY" | cut -d\" -f12  > stt.txt

echo "You Said:"
value=`cat stt.txt`
echo "$value"
