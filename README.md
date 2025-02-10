# service_status.sh

Lo script `service_status.sh` ha lo scopo di eseguire controlli periodici sui servizi esposti, sia in locale che su Internet, per verificarne il corretto funzionamento. In caso di disservizio, viene generato un file di log e, successivamente, avviato automaticamente uno script per l'invio di una segnalazione via email.

## Requisiti

- **Server Linux**: è necessario almeno un server Linux dove configurare l'esecuzione periodica dello script tramite `crontab`.
- **Condivisione di risorse**: tutti i server coinvolti devono avere una condivisione di rete in comune (ad esempio, tramite NFS).
- **Invio email**: lo script utilizza una componente della suite SAS per l'invio delle email. In alternativa, è possibile configurare un server di posta. Trovi uno script di esempio per configurarlo nel file `sendmail_esempio.txt`.

## Note aggiuntive

- È necessario creare la struttura delle directory nel file system condiviso (ad esempio, in `nfs_share`) per organizzare correttamente gli script e i file generati, garantendo il corretto funzionamento dell'intero processo.
