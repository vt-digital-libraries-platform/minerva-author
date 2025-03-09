FROM ubuntu/nginx
LABEL authors="Lee Hunter <whunter@vt.edu>"
WORKDIR /home/ubuntu/minerva-author
EXPOSE 8000
RUN apt update && apt upgrade -y && apt install build-essential git python3-venv wget -y && rm -rf /var/lib/apt/lists/*
RUN mkdir -p ~/miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
RUN bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
RUN rm ~/miniconda3/miniconda.sh
RUN ~/miniconda3/bin/conda config --add channels conda-forge
# RUN git clone https://github.com/vt-digital-libraries-platform/minerva-author.git
# RUN git checkout main
# RUN git pull --rebase origin main
# RUN ~/miniconda3/bin/conda config --remove channels defaults
RUN bash ~/miniconda3/bin/activate 
# WORKDIR /home/ubuntu/minerva-author

COPY requirements.yml .
RUN ~/miniconda3/bin/conda env update -n base -f requirements.yml
# RUN ~/miniconda3/bin/conda update --all --solver=classic
# RUN ~/miniconda3/bin/conda init bash
COPY . .
RUN chmod +x /home/ubuntu/minerva-author/startup.sh
ENTRYPOINT  ["/home/ubuntu/minerva-author/startup.sh"]


# gunicorn-23.0.0


# COPY . .
# CMD ["/usr/local/iiif/createiiif.sh"]

