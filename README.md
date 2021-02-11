# dockerfs4mac

## Setup NFS for Dockers
 * `echo "/System/Volumes/Data -alldirs -mapall=$(id -u):$(id -g) localhost" | sudo tee -a /etc/exports` #**IMPORTANT: remove the escape signs if added when copying** # allow sharing any directories in the Home directory
 * `echo "/Users -alldirs -mapall=$(id -u):$(id -g) localhost" | sudo tee -a /etc/exports` #**IMPORTANT: remove the escape signs if added when copying** # allow sharing any directories in the Home directory for old macOS
 * `echo "nfs.server.mount.require_resv_port = 0" | sudo tee -a /etc/nfs.conf` # tell the NFS daemon to allow connections from any port
 * `sudo nfsd restart`

## Run on your Mac:
 * `./test.zsh`

## Good news:
 * NFS writes files with system user privileges, independent of the user inside the container #chownMyUser #chmod777

## Bad news:
 * Occasionally containers won't boot - delete NFS volume: `docker volume rm name_of_volume`

## Stats
|Composer w/o cache        |Bind @ Ubuntu|NFS @ Mac  |Bind @ Mac|Performance increase|
|:-------------------------|:-----------:|:---------:|:--------:|-------------------:|
|ThinkPad L490 i5 @ Ubuntu |70 sec       |           |          |                    |
|MacBook Pro 16 i7 11.1    |             |**92 sec** |117 sec   |21.36%              |
|MacBook Pro 13 i5 10.15.7 |             |**74 sec** |119 sec   |37.81%
|MacBook Pro 13 i5 11.2.1  |             |**102 sec**|190 sec   |46.31%


|Composer with cache       |Bind @ Ubuntu|NFS @ Mac  |Bind @ Mac|Performance increase|
|:-------------------------|:-----------:|:---------:|:--------:|-------------------:|
|ThinkPad L490 i5 @ Ubuntu |2 sec        |           |          |                    |
|MacBook Pro 16 i7 11.1    |             |**14 sec** |35 sec    |60.00%              |
|MacBook Pro 13 i5 10.15.7 |             |**23 sec** |71 sec    |67.60%              |
|MacBook Pro 13 i5 11.2.1  |             |**25 sec** |118 sec   |78.81%              |
