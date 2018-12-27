From weichuntsai/texlive-small:1.0

WORKDIR /
COPY ./ /puredoc

WORKDIR /puredoc
ENV HOME=/root
ENV TEXMFHOME=${HOME}/texmf
RUN chmod 755 ./install.sh; bash ./install.sh

WORKDIR /
RUN rm -rf /puredoc
COPY README.md /README-puredoc.md
