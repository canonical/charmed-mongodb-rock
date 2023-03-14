# Charmed MongoDB ROCK
This repository contains the packaging metadata for creating a ROCK of Charmed MongoDB built from [Charmed MongoDB Snap](https://snapcraft.io/charmed-mongodb). For more information on ROCKs, visit the [Rockcraft Github](https://github.com/canonical/rockcraft). 

## Building the ROCK
The steps outlined below are based on the assumption that you are building the ROCK with the latest LTS of Ubuntu. If you are using another version of Ubuntu or another operating system, the process may be different.

### Clone Repository
```bash
git clone https://github.com/canonical/charmed-mongodb-rock.git
cd charmed-mongodb-rock
```
### Installing Prerequisites
```bash
sudo snap install rockcraft --edge --classic
sudo snap install docker
sudo snap install lxd
sudo snap install skopeo --edge --devmode
```
### Configuring Prerequisites
```bash
sudo usermod -aG docker $USER 
sudo lxd init --auto
```
*_NOTE:_* You will need to open a new shell for the group change to take effect (i.e. `su - $USER`)
### Packing and Running the ROCK
```bash
rockcraft pack
sudo skopeo --insecure-policy copy oci-archive:charmed-mongodb*.rock docker-daemon:<username>/charmed-mongodb:<tag>
docker run --rm -it <username>/charmed-mongodb:<tag>
```

## License
The Charmed MongoDB ROCK is free software, distributed under the Apache
Software License, version 2.0. See
[LICENSE](https://github.com/canonical/charmed-mongodb-rock/blob/5-edge/LICENSE)
for more information.

## Trademark Notice
MongoDB is a trademark or registered trademark of MongoDB, Inc.
Percona is a trademark or registered trademark of Percona LLC.
Other trademarks are property of their respective owners.
