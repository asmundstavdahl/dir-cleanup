require "./dir_cleanup"

def check(tail, expected_tail)
    if tail != expected_tail
        fail tail, expected_tail
    end
end

def fail(tail, expected_tail)
    puts "<#{tail.class}>#{tail} != <#{expected_tail.class}>#{expected_tail}"
    exit 1
end

olds = [1,2,3]
news = [1,2,3,4,5]
expected_tail = [4,5]
tail = dir_cleanup olds, news
check tail, expected_tail

olds = [1,2,3]
news = [3,4,5]
expected_tail = [4,5]
tail = dir_cleanup olds, news
check tail, expected_tail

olds = [1,2,3,4,3,4,5,3]
news = [3,4,5]
expected_tail = [4,5]
tail = dir_cleanup olds, news
check tail, expected_tail

olds = [1,2]
news = [2,1,2,3,1,1,3,1]
expected_tail = [1,2,3,1,1,3,1]
tail = dir_cleanup olds, news
check tail, expected_tail

olds = [1,2]
news = [3,1,1,3,1]
expected_tail = [3,1,1,3,1]
tail = dir_cleanup olds, news
check tail, expected_tail

puts "OK"
