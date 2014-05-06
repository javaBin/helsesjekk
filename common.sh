function check_curl_status() {
    url=$1
    system=$2
    status=$(curl -s -o /dev/null -w "%{http_code}" $url)

    if [ $status -gt 399 ]; then
        echo "$system answered with status $status"
        exit 1
    else
        echo "$system is up"
    fi
}
