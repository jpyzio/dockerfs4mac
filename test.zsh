docker-compose build

clear

docker volume rm docker4mac_nfs_app docker4mac_nfs_composer_cache ; docker network docker4mac_bind ; rm -Rf app/vendor composer_cache && mkdir composer_cache
SECONDS=0; docker-compose run --rm nfs install > /dev/null; echo "\x1B[36mcomposer install - nfs - w/o cache @ mac - ${SECONDS} sec\x1B[39m"

docker volume rm docker4mac_nfs_app docker4mac_nfs_composer_cache; docker network docker4mac_bind ; rm -Rf app/vendor
SECONDS=0; docker-compose run --rm nfs install > /dev/null; echo "\x1B[36mcomposer install - nfs - with cache @ mac - ${SECONDS} sec\x1B[39m"

docker volume rm docker4mac_nfs_app docker4mac_nfs_composer_cache ;docker network docker4mac_bind; rm -Rf app/vendor composer_cache && mkdir composer_cache
SECONDS=0; docker-compose run --rm bind install > /dev/null; echo "\x1B[36mcomposer install - bind - w/o cache @ mac - ${SECONDS} sec\x1B[39m"

docker volume rm docker4mac_nfs_app docker4mac_nfs_composer_cache ; docker network docker4mac_bind ; rm -Rf app/vendor
SECONDS=0; docker-compose run --rm bind install > /dev/null; echo "\x1B[36mcomposer install - bind - with cache @ mac - ${SECONDS} sec\x1B[39m"

docker volume rm docker4mac_nfs_app docker4mac_nfs_composer_cache; docker network docker4mac_bind


