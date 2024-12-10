import argparse
import json
from datetime import date
from eth_abi import encode
from pathlib import Path
from dotenv import dotenv_values 
from datetime import datetime

_dir  = dotenv_values(".env")
dir = Path(_dir["DEPLOYMENT_OUT_DIR"])
file = Path(_dir["DEPLOYMENT_OUT_DIR"] + _dir["DIAMOND_DEPLOYMENT_OUT_FILE"])
version = "2.2.2"

def set_latest_deployed_facet(args):
    record = {}
    facet = None
    result = 'false'
    date  = args.timestamp
    newDeployDate = datetime.now().strftime("%Y-%m-%dT%H:%M:%S")

    file = Path(_dir["DEPLOYMENT_OUT_DIR"] + "/" + args.chain_id + "/" + version + "/" + date + "/diamond/" +  _dir["DIAMOND_DEPLOYMENT_OUT_FILE"])
    newDirs = Path(_dir["DEPLOYMENT_OUT_DIR"] + "/" + args.chain_id + "/" + version + "/" + newDeployDate + "/diamond/")
    newDirs.mkdir(parents=True, exist_ok=True)
    newFile = Path(_dir["DEPLOYMENT_OUT_DIR"] + "/" + args.chain_id + "/" + version + "/" + newDeployDate + "/diamond/" +  _dir["DIAMOND_DEPLOYMENT_OUT_FILE"])
    newFile.touch(exist_ok=True)

    with open(file, 'r') as openfile:
        record = json.load(openfile)

    sorted_records = sorted([date_string for date_string in record[args.chain_id][args.diamond].keys()], reverse=True)
    for deployment in sorted_records:
        if(args.facet in record[args.chain_id][args.diamond][deployment].keys()):
            record[args.chain_id][args.diamond][deployment][args.facet] = args.facet_address 
            with open(newFile, 'w') as f:
                json.dump(record, f, indent=2)
            result = 'true'
            break

    return result

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("diamond", type=str)
    parser.add_argument("facet", type=str)
    parser.add_argument("facet_address", type=str)
    parser.add_argument("chain_id", type=str)
    parser.add_argument("timestamp", type=str)
    return parser.parse_args()


def main():
    args = parse_args()
    result = set_latest_deployed_facet(args)
    if(not result):
        print("Not Found")
        return
    

if __name__ == "__main__":
    main()
