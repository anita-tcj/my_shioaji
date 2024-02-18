1. 請在config 檔案中，輸入 shioaji 帳號的 api key 及 secret key
2. 下指令 python main.py --stock 2330 --date 20240103

<!-- ## build image
docker build -t shioaji_doc . -->

## First Build
```sh
cd base
sh build.sh
cd ..
sh build.sh
```

### scripts
- for cleanup all containers `sh cleanup.sh`
- for quick build `sh build.sh`
- for run `sh run.sh`
- for connect `sh connect.sh`
- for build run and connect `sh lazy.sh`

## run container
docker run -v /local_path/data shioaji_doc --stock 2330 --date 20240215
- replace 'local_path' to your own path
- stock 格式 ： 股票代號 ex: 2330
- date 格式： 八位數（年月日） ex : 20240216
