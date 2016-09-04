FROM multiarch/debian-debootstrap:armhf-jessie
ADD sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y dh-make build-essential devscripts fakeroot
RUN apt-get install -y devio linux-base
VOLUME /src
WORKDIR /src
CMD sh -c 'dpkg-buildpackage -us -uc -b && mv ../*.deb .'
