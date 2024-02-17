# First Stage: Build Stage
FROM --platform=linux/amd64 python:3.9-slim-buster AS builder

WORKDIR /build

COPY requirements.txt .

# Install build dependencies and pip packages
RUN apt-get install -y --no-install-recommends \
        g++ \
    && pip install --no-cache-dir --prefix=/install -r requirements.txt

# Second Stage: Final Stage
FROM --platform=linux/x86_64 python:3.9-slim-buster

# 設定工作目錄為 /app
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=builder /install /usr/local

# Copy application code
COPY . .

# Define the command to run your application
CMD ["python", "main.py"]
