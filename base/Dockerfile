FROM --platform=linux/x86_64 python:3.9-buster

# 設定工作目錄為 /app
WORKDIR /app

# 將本地目錄內的程式碼複製到容器的 /app 目錄中
COPY . /app

# g++ for newest version of pandas 
# if you want to use pandas without g++ use pandas==1.2.4 instead
RUN pip install shioaji-1.2.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl
RUN pip install --no-cache-dir pandas