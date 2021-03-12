# Nodejs
export VERSION=v10.16.0
export DISTRO=linux-x64

if [ -d /usr/local/lib/nodejs/node-"${VERSION}"-"${DISTRO}"/bin ]; then
export PATH=/usr/local/lib/nodejs/node-"${VERSION}"-"${DISTRO}"/bin:"${PATH}"
fi
