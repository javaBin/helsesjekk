function check_curl_status() {
    url=$1
    status=$(curl -s -o details/${system}.log -w "%{http_code}" $url)

    echo "Status code $status"
    
    if [[ $status -lt 1 || $status -gt 399 ]]; then
        exit 1
    fi
}
