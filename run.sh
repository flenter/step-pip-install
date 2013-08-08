cd $WERCKER_SOURCE_DIR

if [ -f "requirements.txt" ]
then
    debug "install pip-accell and use it to install packages from requirements.txt"
    sudo pip install pip-accel
    sudo pip-accel install --download-cache=$WERCKER_SOURCE_DIR -r requirements.txt 

    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    fail 'no requirements.txt found in directory'
fi
