import json
import sys
import argparse

def reorder_json(filename):
    # Define the desired order based on TransactionsBatch.json
    desired_order = [
        "version",
        "chainId",
        "createdAt",
        "meta",
        "transactions"
    ]

    # Read the current JSON file
    with open(filename, 'r') as f:
        data = json.load(f)

    # Create a new ordered dictionary
    ordered_data = {key: data[key] for key in desired_order if key in data}

    # Write the reordered JSON back to file
    with open(filename, 'w') as f:
        json.dump(ordered_data, f, indent=2)

def main():
    parser = argparse.ArgumentParser(description='Reorder JSON file fields')
    parser.add_argument('filename', help='Path to the JSON file to reorder')
    args = parser.parse_args()

    reorder_json(args.filename)

if __name__ == "__main__":
    main()