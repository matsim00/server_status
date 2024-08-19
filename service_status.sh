#!/bin/bash

PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/TUO_UTENTE/

data=$(date +%Y%m%d%H)

URL=("https://servizioesposto1" "https://servizioesposto2" "https://servizioesposto3")
OUTPUT_FILE="/nfs_share/service_status_"$data".txt"
invio_mail="/nfs_share/invio_mail_service_status.sh"


for url in "${URL[@]}"; do
	response=$(curl -XGET -v -k "%{http_code}" $url)
	
        if [ $response -ne 200 ]; then
           
		echo "$data: Il servizio $url non è raggiungibile" >> $OUTPUT_FILE 
	fi
    done

if [ -f $OUTPUT_FILE ]; then
    # se trova il file invia la mail
    $invio_mail
else
    echo "file service_status non trovato."
fi

# schedulare da crontab ogni 5 minuti
