FROM --platform=linux/x86_64 python:3.9-slim-buster

# 設定工作目錄為 /app
WORKDIR /app

# 將本地目錄內的程式碼複製到容器的 /app 目錄中
COPY . /app

# gcc for newest version of pandas 
# if you want to use pandas without gcc use pandas==1.2.4 instead
RUN apt-get update && \
    apt-get install -y gcc && \
    pip3 install --no-cache-dir -r requirements.txt

# 定義容器運行時的預設命令
CMD [ "python", "main.py" ]