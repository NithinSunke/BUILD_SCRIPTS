.  /tmp/BUILD_SCRIPTS/config/os_install_env.sh

echo "******************************************************************************"
echo "Set Hostname." `date`
echo "******************************************************************************"
sudo hostnamectl set-hostname ${HOSTNAME}.${DOMAIN_NAME}
sudo hostname  ${HOSTNAME}.${DOMAIN_NAME}
sudo cat > /etc/hostname <<EOF
${HOSTNAME}.${DOMAIN_NAME}
EOF
