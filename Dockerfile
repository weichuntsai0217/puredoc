From weichuntsai/texlive-small:1.1.0

WORKDIR /
COPY ./ /puredoc

WORKDIR /puredoc
ENV HOME=/root
ENV TEXMFHOME=${HOME}/texmf
RUN chmod 755 ./install.sh; bash ./install.sh

WORKDIR /
RUN rm -rf /puredoc
COPY README.md /README-puredoc.md
RUN sed -i -r -e "s/alias ll='ls -alF'/alias ll='ls -alFh'/g" /root/.bashrc

