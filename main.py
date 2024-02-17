import shioaji as sj
import pandas as pd 
import pickle
import argparse
import config


def get_data(stock,date):

    ## login 
    api = sj.Shioaji(simulation=True)
    accounts = api.login(api_key=config.API_KEY, secret_key=config.SECRET_KEY,contracts_cb=lambda security_type: print(f"{repr(security_type)} fetch done."))
    # print("Default Stock Account: {}".format(api.stock_account))
    # print("Default Future Account: {}".format(api.futopt_account))

    ## date 
    format_start = f"{date[:4]}-{date[4:6]}-{date[6:]}"
    format_end =  f"{date[:4]}-{date[4:6]}-{str(int(date[6:])+1)}"

    kbars = api.kbars(
        contract=api.Contracts.Stocks[stock], 
        start=format_start,
        end=format_end)
    kbars

    df = pd.DataFrame({**kbars})
    df = df[['ts','Open','High','Low','Close','Volume']]
    df.ts = pd.to_datetime(df.ts)
    df=df.set_index('ts')
    # print(df.head())

    with open(f'{date}_{stock}_round.pickle','wb') as file:
        pickle.dump(df, file)


    api.logout()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Fetch historical data and save as pickle file")
    parser.add_argument("--stock", type=str)
    parser.add_argument("--date", type=str)
    args = parser.parse_args()

    print('Colleting data------------------------')
    get_data(args.stock, args.date)
    print('Finish--------------------------------')