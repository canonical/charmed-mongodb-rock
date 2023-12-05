#!/bin/bash -x
# Copyright 2023 Canonical Ltd.
# See LICENSE file for licensing details.

NAME=$(yq '.name' rockcraft.yaml)
APP_VERSION=$(yq '.version' rockcraft.yaml)
VERSION=$(yq '(.version|split("-"))[0]' rockcraft.yaml)
BASE=$(yq '(.base|split("@"))[1]' rockcraft.yaml)
TAG=${VERSION}-${BASE}_edge
REGISTRY_NAMESPACE=ghcr.io/canonical

cat ${NAME}_${APP_VERSION}_amd64.rock | docker import - ${REGISTRY_NAMESPACE}/${NAME}:${TAG}
docker save ${REGISTRY_NAMESPACE}/${NAME}:${TAG} -o ${NAME}_${TAG}_amd64.rock
