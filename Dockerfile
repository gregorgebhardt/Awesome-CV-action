FROM texlive/texlive

RUN \
    echo "===> Update repositories" && \
    apt-get update && \
    echo "===> Install jq and curl" && \
    apt-get install -y curl jq && \
    # echo "===> Install xzdec" && \
    # apt-get install -y xzdec && \
    echo "===> Clean up" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# RUN \
#     echo "===> Install additional texlive packages" && \
#     tlmgr init-usertree && \
#     tlmgr update --all && \
#     echo "=======> texlive-fonts-extra" && \
#     tlmgr install texlive-fonts-extra

COPY fonts /usr/local/share/fonts

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

