#!/bin/bash

source $HOME/.bash_profile

data=$(date +%Y%m%d%H)
PathMon="/nfs_share/output_monitoring/"
PathMet="/sas/software/"

cd $PathMon

if [ service_status_* ] ; then
    $PathMet/SASFoundation/9.4/sasexe/sas -sysin $PathHome/invio_mail_service_status.sas -log /nfs_share/output_monitoring/logs/invio_mail_service_status_$data.log

        mv $PathMon/service_status_* $PathMon/service_status/
else
        echo "service_status_* non trovato, invio non effettuato"
fi
