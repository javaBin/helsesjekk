function check_curl_status() {
    url=$1
    system=$2
    status=$(curl -s -o details/${system}.log -w "%{http_code}" $url)

    if [[ $status -gt 1 && $status -lt 399 ]]; then
        echo "$system is up (status $status)"
    else
        echo "$system is down (status $status)"
        exit 1
    fi
}
