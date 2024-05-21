import csv


def is_float(string):
    try:
        float(string)
        return True
    except ValueError:
        return False


# Open the CSV file and read it into an array
with open("./data/romeo_data.csv", "r") as f:
    reader = csv.reader(f)
    array = list(reader)

# Perform an operation on the array (multiply each element by 2)
new_array = [row[:-1] + [14 - float(row[-1])] for row in array if is_float(row[-1])]

# Save the new array into a new CSV file
with open("output.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(new_array)
