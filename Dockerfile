FROM --platform=linux/x86_64 python:3.9

# 設定工作目錄為 /app
WORKDIR /app

# 將本地目錄內的程式碼複製到容器的 /app 目錄中
COPY . /app

RUN pip3 install -r requirements.txt


# 定義容器運行時的預設命令
CMD [ "python", "main.py" ]

