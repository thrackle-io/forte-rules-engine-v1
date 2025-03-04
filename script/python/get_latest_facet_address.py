import argparse
import json
from datetime import date
from eth_abi import encode
from pathlib import Path
from dotenv import dotenv_values 
from datetime import datetime

_dir  = dotenv_values(".env")
dir = Path(_dir["DEPLOYMENT_OUT_DIR"])
version = "2.4.0"

def get_latest_deployed_facet(args):
    record = {}
    facet = None
    diamond = None
    date  = args.timestamp

    file = Path(_dir["DEPLOYMENT_OUT_DIR"] + "/" + args.chain_id + "/" + version + "/" + date + "/diamond/" +  _dir["DIAMOND_DEPLOYMENT_OUT_FILE"])

    with open(file, 'r') as openfile:
        record = json.load(openfile)

    sorted_records = sorted([date_string for date_string in record[args.chain_id][args.diamond].keys()], reverse=True)
    for deployment in sorted_records:
        if(args.facet in record[args.chain_id][args.diamond][deployment.split("T")[0]].keys()):
            facet = record[args.chain_id][args.diamond][deployment.split("T")[0]][args.facet]
            break
    for deployment in sorted_records:
        if("RuleProcessorDiamond" in record[args.chain_id][args.diamond][deployment.split("T")[0]].keys()):
            diamond = record[args.chain_id][args.diamond][deployment.split("T")[0]]["RuleProcessorDiamond"]
            break

    return (facet, diamond)

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("diamond", type=str)
    parser.add_argument("facet", type=str)
    parser.add_argument("chain_id", type=str)
    parser.add_argument("timestamp", type=str)
    return parser.parse_args()


def main():
    args = parse_args()
    (facet,diamond) = get_latest_deployed_facet(args)
    if(not facet or not diamond):
        print("Not Found")
        return
    enc = encode(["address[2]"], [[facet, diamond]])
    print("0x" + enc.hex(), end="")

if __name__ == "__main__":
    main()
