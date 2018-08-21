FROM r-base:3.5.1

RUN R -e 'update.packages(ask=FALSE, checkBuilt=TRUE)'

RUN apt-get update && apt-get install -y git libxml2-dev
RUN git clone https://github.com/masc/TextMining-Grouping.git

WORKDIR TextMining-Grouping
RUN Rscript installdeps.r

EXPOSE 8080
ENTRYPOINT ["Rscript", "main.r", "8080"]