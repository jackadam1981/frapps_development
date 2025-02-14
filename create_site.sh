#!/bin/bash

SITE_NAME="fedora.jackadam.top"
VERSION="version-15"

rm -rf frappe-bench
bench init --skip-redis-config-generation --frappe-branch $VERSION frappe-bench
# bench init --skip-redis-config-generation --frappe-branch version-15 frappe-bench
cd frappe-bench
bench set-config -g db_host mariadb
bench set-config -g redis_cache redis://redis-cache:6379
bench set-config -g redis_queue redis://redis-queue:6379
bench set-config -g redis_socketio redis://redis-queue:6379
# bench new-site --mariadb-user-host-login-scope=% fedora.jackadam.top


bench new-site --db-root-password 123 --admin-password admin --mariadb-user-host-login-scope=% $SITE_NAME
bench --site $SITE_NAME set-config developer_mode 1
bench --site $SITE_NAME clear-cache
bench get-app --branch $VERSION erpnext
bench --site $SITE_NAME install-app erpnext

# 增加中国小企业会计准测
cp ../../china_account/cn_saas_chart_of_accounts.json apps/erpnext/erpnext/accounts/doctype/account/chart_of_accounts/verified/

# bench start