FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    g++ \
    make \
    cmake \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Clone the HIDEAGEM repository with submodules
RUN git clone --recurse-submodules https://github.com/CYBERGEM777/HIDEAGEM /HIDEAGEM

WORKDIR /HIDEAGEM

# Build HIDEAGEM and install requirements for the python cli
RUN make
RUN pip3 install -r requirements.txt

# Entry point to run HIDEAGEM
ENTRYPOINT ["python3", "HIDEAGEM.py"]