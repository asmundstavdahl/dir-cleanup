# dir-cleanup
Recursively remove empty directories

## Usage

```sh
mkdir -p t/1/11
mkdir -p t/1/12
mkdir -p t/2/21

touch    t/1/11/f

dir-cleanup t
find t
# t/1
# t/1/11
# t/1/11/f
```

## Installation

```sh
shards build
cp bin/dir-cleanup /usr/bin/
```
