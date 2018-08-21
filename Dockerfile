FROM r-base:3.5.1
ENV SHINY_PORT = 8080

RUN apt-get update && apt-get install -y git libxml2-dev
RUN git clone https://github.com/masc/TextMining-Grouping.git

WORKDIR TextMining-Grouping
RUN Rscript installdeps.r

EXPOSE $SHINY_PORT
ENTRYPOINT ["Rscript", "main.r", $SHINY_PORT]