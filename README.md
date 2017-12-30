# CSV Playground

Convienient and fast ways to parse CSV files in various programming languages.

## Python

```
python3  -m venv ~/.venv/csv-playground
```

```
pip install progressbar2 psutil
```

```
python reader.py [optional file name]
```

## Ruby

```
gem install ruby-progressbar
```

```
ruby reader.rb
```

## Generate Dummy Data

```
gem install faker
```

Generate a CSV file with 1 milion records:

```
ruby generator.rb 1000000
```

The file will have the following columns:

* name, e.g. Ava Lesch	
* email, e.g. nellie.pollich@moore.net	
* title, e.g. Principal Functionality Designer	
* image, e.g. https://robohash.org/faciliscorruptisimilique.png?size=300x300&set=set1	
* phone, e.g. (536) 688-4097	
* imei, e.g. 018292903140690	
* color, e.g. purple	
* company, e.g. Lemke LLC	
* date, e.g. 2013-10-02	
* ip, e.g. 43.114.193.207	
* url, e.g. http://schummkoch.net/vinnie_ratke	
* state, e.g. Rhode Island	
* country, e.g. Andorra	
* lat, e.g. 46.67984738286131	
* long, e.g. -159.3262343750659	
* card, e.g. 1234-2121-1221-1211