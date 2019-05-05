#!/bin/bash
mongo ${MONGO_INITDB_DATABASE} \
      --host localhost \
      --port 27017 \
      -u ${MONGO_INITDB_ROOT_USERNAME} \
      -p ${MONGO_INITDB_ROOT_PASSWORD} \
      --authenticationDatabase admin \
      --eval "
        db.createUser(
            {
                user: '${MONGO_INITDB_DATABASE_USERNAME}',
                pwd: '${MONGO_INITDB_DATABASE_PASSWORD}',
                roles: [
                    {
                        role: 'readWrite',
                        db: '${MONGO_INITDB_DATABASE}'
                    }
                ]
            }
        );
      "
