# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2024.

import sys, csv, re

codes = [{"code":"Gyu3200","system":"readv2"},{"code":"Gyu3300","system":"readv2"},{"code":"G343.00","system":"readv2"},{"code":"G34z.00","system":"readv2"},{"code":"G31y.00","system":"readv2"},{"code":"G3...13","system":"readv2"},{"code":"G3y..00","system":"readv2"},{"code":"G34..00","system":"readv2"},{"code":"8H2V.00","system":"readv2"},{"code":"G3...00","system":"readv2"},{"code":"G3z..00","system":"readv2"},{"code":"Gyu3.00","system":"readv2"},{"code":"G31..00","system":"readv2"},{"code":"G34y.00","system":"readv2"},{"code":"G31yz00","system":"readv2"},{"code":"G34yz00","system":"readv2"},{"code":"I255","system":"readv2"},{"code":"I258","system":"readv2"},{"code":"I259","system":"readv2"},{"code":"I25","system":"readv2"},{"code":"I24","system":"readv2"},{"code":"414","system":"readv2"},{"code":"411","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('coronary-heart-disease-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ischemic-coronary-heart-disease-chd---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ischemic-coronary-heart-disease-chd---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ischemic-coronary-heart-disease-chd---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
