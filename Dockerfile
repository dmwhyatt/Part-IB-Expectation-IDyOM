# FROM ghcr.io/astral-sh/uv:python3.13-bookworm

# COPY requirements.txt .

# RUN uv venv
# RUN uv pip install -r requirements.txt

# COPY . .

# RUN uv pip install -e .

FROM python:3.12.11-bookworm

WORKDIR /workspace

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install jupyter

COPY src/melody_features /workspace/src/melody_features

WORKDIR /workspace/src/melody_features
RUN pip install -e .
RUN chmod +x install_idyom.sh
RUN ./install_idyom.sh

WORKDIR /workspace
COPY . .
RUN pip install -e .
