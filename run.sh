cd $WERCKER_SOURCE_DIR

if [ -f "requirements.txt" ]
then
    debug "install pip-accell and use it to install packages from requirements.txt"
    ls -la $WERCKER_CACHE_DIR
    sudo pip install --download-cache=$WERCKER_CACHE_DIR pip --upgrade
    sudo pip install --download-cache=$WERCKER_CACHE_DIR setuptools --upgrade
    sudo pip install --download-cache=$WERCKER_CACHE_DIR wheel
    sudo pip freeze
    sudo pip install --download-cache=$WERCKER_CACHE_DIR --use-wheel -r requirements.txt 

    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    fail 'no requirements.txt found in directory'
fi
