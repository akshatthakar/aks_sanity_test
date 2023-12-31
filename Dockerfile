FROM python:3.8.14-slim-bullseye

USER root

RUN apt-get update

RUN apt-get update && apt-get install -y \
curl

RUN   apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y gnupg2

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y google-chrome-stable
ENV DISPLAY=:99

ENV PATH="/usr/lib/chromium/:${PATH}"

RUN apt-get install -y --no-install-recommends jq 

WORKDIR /opt/src

# PYODBC DEPENDENCES
RUN apt-get install -y tdsodbc unixodbc-dev
##RUN apt install unixodbc-bin -y
RUN apt-get clean -y
ADD odbcinst.ini /etc/odbcinst.ini

# UPGRADE pip3
RUN pip3 install --upgrade pip

# DEPENDECES FOR DOWNLOAD ODBC DRIVER
RUN apt-get install apt-transport-https 
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update

# INSTALL ODBC DRIVER
RUN ACCEPT_EULA=Y apt-get install msodbcsql17 --assume-yes

# CONFIGURE ENV FOR /bin/bash TO USE MSODBCSQL17
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile 
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc 

RUN apt-get update && apt-get install -y libmagic-dev

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .

ENTRYPOINT ["sh","entrypoint.sh"]