cd $WERCKER_SOURCE_DIR

if [ -f "requirements.txt" ]
then
    debug "pip install with download cache"
    sudo pip install --download-cache=$WERCKER_CACHE_DIR -r requirements.txt 

    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    fail 'no requirements.txt found in directory'
fi
