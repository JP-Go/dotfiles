if ! [[ $1 ]]; then
  echo "[ERROR] Missing argument <entry>"
  echo "usage: get_pass <entry>"
  exit 1
fi

output=$(rbw get "$1" 2>/dev/stdout)
error=$?
if [[ $error -gt 0 ]]; then
  error_msg=$(echo $output | cut -d: -f2-3) 
  echo "[ERROR] $error_msg"
  exit 1
fi
echo "Grabbed password for $1"
echo $output | xclip -sel c
