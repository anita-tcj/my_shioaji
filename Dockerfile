# First Stage: Build Stage
FROM --platform=linux/amd64 python:3.9-slim-buster AS builder

WORKDIR /build

COPY requirements.txt .

# Install build dependencies and pip packages
RUN apt-get install -y --no-install-recommends \
        g++ \
    && pip install --no-cache-dir --prefix=/install -r requirements.txt

# g++ for newest version of pandas 
# if you want to use pandas without g++ use pandas==1.2.4 instead
RUN pip install shioaji-1.2.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl
RUN pip install --no-cache-dir pandas

# Copy application code
COPY . .

# Define the command to run your application
CMD ["python", "main.py"]
