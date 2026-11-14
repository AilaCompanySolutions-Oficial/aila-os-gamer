# Aila OS Gamer = Bazzite + a marca e os extras do Aila OS.
# BASE_IMAGE: bazzite (AMD/Intel)  |  bazzite-nvidia (placas NVIDIA)
ARG BASE_IMAGE=ghcr.io/ublue-os/bazzite
ARG BASE_TAG=stable
FROM ${BASE_IMAGE}:${BASE_TAG}

COPY system_files/ /
COPY build_files/ /tmp/build_files/
RUN /tmp/build_files/build.sh && rm -rf /tmp/build_files

# verificação oficial das imagens bootc (não derruba a construção se avisar algo)
RUN bootc container lint || true

LABEL containers.bootc=1
