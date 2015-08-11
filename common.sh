function check_curl_status() {
    system=$1
    url=$2
    status=$(curl -L -s -o "details/${system}.log" -w "%{http_code}" "${url}")

    echo "Status code: $status"
    
    if [[ $status -lt 1 || $status -gt 299 ]]; then
        exit 1
    fi
}
