cd $WERCKER_SOURCE_DIR

if [ -f "requirements.txt" ]
then
    debug "pip install -r requirements.txt"
    pip install --no-install --use-mirrors -I --download=$WERCKER_CACHE_DIR -r requirements.txt
    sudo pip install --find-links=file://$WERCKER_CACHE_DIR --no-index --index-url=file:///dev/null <package name>

    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    fail 'no requirements.txt found in directory'
fi
