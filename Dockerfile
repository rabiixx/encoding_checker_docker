FROM ubuntu

WORKDIR /root/encoding_checker

ADD . /root/encoding_checker

ENV PROJECT_NAME NucleoDuro
ENV INCLUDE_PATH /NucleoDuro/NucleoDuro/NucleoDuro/wwwroot
ENV EXCLUDE_PATH /NucleoDuro/NucleoDuro/NucleoDuro/Models
ENV INCLUDE_EXT cs js
ENV EXCLUDE_EXT pdf png sln

CMD ./script.sh