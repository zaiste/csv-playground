import os
import sys
import csv
import time
import functools
import progressbar
import psutil

csv_path = sys.argv[1] if len(sys.argv) > 1 else 'data.csv' 

examples = []

def example(fn):
    @functools.wraps(fn)
    def wrapped():
        try:
            print('Running: {}'.format(fn.__name__))

            start = time.time()

            fn()

            end = time.time()
            print('{:.2f}'.format(end - start))

            process = psutil.Process(os.getpid())
            print('{:.2f} MB\n'.format(process.memory_info().rss / 1024 / 1024))
        except KeyboardInterrupt:
            print('Skipping...')

    examples.append(wrapped)
    return wrapped

@example
def basic():
    with open(csv_path, newline='') as f:
        reader = csv.reader(f)
        for row in reader:
            pass

@example
def with_progressbar():
    num_lines = sum(1 for line in open(csv_path))

    with progressbar.ProgressBar(max_value=num_lines) as bar:
        with open(csv_path, newline='') as f:
            reader = csv.reader(f)
            for row in bar(reader):
                pass

@example
def with_headers():
    with open(csv_path, newline='') as f:
        reader = csv.DictReader(f)
        for row in reader:
            pass


#import resource
#rint('{:.2f} MB'.format(resource.getrusage(resource.RUSAGE_SELF).ru_maxrss / 1024 / 1024))

for example in examples:
    example()