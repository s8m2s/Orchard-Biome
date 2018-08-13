#!/bin/bash

USER_NAME=developer

files=(/workspace/*) && DIR=${files[-1]}
USER_ID=$(stat -c "%u" ${DIR})

echo "Using ${USER_ID} from owner of dir ${DIR}"

id "${USER_NAME?}" >/dev/null 2>&1

if [[ $? -ne 0 ]]; then
	echo Creating user ${USER_NAME} with UID ${USER_ID}
	useradd --uid ${USER_ID} --create-home --shell /bin/bash --groups root,sudo ${USER_NAME}
	cp -a /root/. /home/${USER_NAME}/
	chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/
fi

# su ${USER_NAME}
