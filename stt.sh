echo "Recording your Speech (Ctrl+C to Transcribe)"
arecord -D plughw:1,0 -q -f cd -t wav -d 5 -r 16000 | flac - -f --best --sample-rate 16000 -s -o daveconroy.flac;

echo "Converting Speech to Text..."
wget -q -U "Mozilla/5.0" --post-file daveconroy.flac --header "Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium&key=AIzaSyAzKBBOYHbWIrKVy2cvri2uQKwF1on9Nwc" | cut -d\" -f12  > stt.txt

echo "You Said:"
value=`cat stt.txt`
echo "$value"
