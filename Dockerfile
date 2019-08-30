FROM ubuntu:18.04

RUN apt-get --yes -qq update \
 && apt-get --yes -qq upgrade \
 && apt-get --yes -qq install \
                      bzip2 \
                      curl \
                      git \
                      python3-dev \
                      python3-pip \
                      virtualenv \
                      wget \
                      zlib1g-dev \
                      nodejs       \
                      npm      \
      && apt-get --yes update  \                
      && apt-get --yes install -y openjdk-8-jdk \
      && apt-get --yes clean \
      && apt-get --yes -qq clean \
      && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade awscli --user

RUN echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc 
RUN /bin/bash -c "source ~/.bashrc"

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN wget https://github.com/spagnuolocarmine/FLY-language/releases/download/ALPHA-1.1/fly-standalone.jar

CMD [ "/bin/bash" ]