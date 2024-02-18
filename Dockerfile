FROM shioaji_doc:base

# 設定工作目錄為 /app
WORKDIR /app

# 將本地目錄內的程式碼複製到容器的 /app 目錄中
ADD main.py /app
ADD run_python.sh /app

# 定義容器運行時的預設命令
CMD ["sh", "run_python.sh"]
