cd $WERCKER_SOURCE_DIR

if [ -f "requirements.txt" ]
then
    debug "pip install -r requirements.txt"
    PIP_DOWNLOAD_CACHE=$WERCKER_CACHE_DIR
    sudo pip install -r requirements.txt

    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    fail 'no requirements.txt found in directory'
fi
