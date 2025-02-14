# erpnext 开发环境

## clone frapps-docker

git clone https://github.com/frappe/frapps-docker.git

## clone frapps-development

git clone https://git.jackadam.top/erpnext_development.git

## edit traefik.yaml

修改traefik.yaml,主要是外部暴漏端口

修改traefik-config/rules.yml，主要是主机IP，这里使用rules，代理和本机无关的外部服务，既宿主机的IP。
