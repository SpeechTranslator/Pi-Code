arecord -D plughw:2,0 -f cd -t wav -d 10 -r 16000 | \
flac - -f --best --sample-rate 16000 -o out.flac; \
wget -O - -o /dev/null --post-file out.flac --header="Content-Type: audio/x-flac; rate=16000" \
"http://www.google.com/speech-api/v2/recognize?lang=en-us&key=AIzaSyAzKBBOYHbWIrKVy2cvri2uQKwF1on9Nwc&output=json" | \
sed -e 's/[{}]/''/g'
