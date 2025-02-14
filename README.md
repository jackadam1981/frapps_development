SITE_NAME

SITE_NAME

[jackadam1981/frapps_development: frapps开发环境](https://github.com/jackadam1981/frapps_development)

# erpnext 开发环境

## clone frapps-docker

git clone https://github.com/frappe/frapps-docker.git

## clone frapps-development

git clone jackadam1981/frapps_development: frapps开发环境

## edit traefik.yaml

修改traefik.yaml,主要是外部暴漏端口

修改traefik-config/rules.yml，主要是主机IP，这里使用rules，代理和本机无关的外部服务，既宿主机的IP。

## RUN build.sh

bash build.sh

## create site

after build.sh, auto into the devcontainer-frappe-1 container。

edit developmen/create_site.sh.The important thing is the SITE_NAME.Traefik needs this for forwarding.

run create_site.sh to create frapps site
