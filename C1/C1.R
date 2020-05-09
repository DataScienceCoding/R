f1 <- function() f2()
f2 <- function() f3()
f3 <- function() f4()
f4 <- function() bug()

f1()
traceback()

browser_test = function(){
  for (i in 1:3) {
    browser()
  }
}

browser_test()

fn = function() {
  n = 0
  for (i in 1:4) {
    n = n + i
    print(n)
  }
  return(n)
}

debug(fn)
fn()
isdebugged(fn) # TRUE
undebug(fn)
isdebugged(fn) # FALSE

# debugonce(fn)
# fn()


# 第2章-第4题(P37) 
rep(seq(0, 4), each=5) + rep(seq(1, 5), 5)

# 第2章-第5题(P37) 
compare <- function(n) {
  ls <- list(a=sum(rep(1, n) / seq(1, n)), b=log(n) + 0.6)
  ls$c[1] <- ls$a[1] > ls$b[1]
  return(ls)
}

compare(500)
compare(1000)
compare(2000)
compare(4000)
compare(8000)

# 数据类型
(z <- c(10, 3.14, "R", "Java", 'Go', TRUE, T, FALSE, F, NA))
is.na(z)
is.numeric(z[1])
as.numeric(z[2])
z = c(1:10, NA)
sum(z)
sum(z, na.rm=T)
na.omit(z)
attr(,"na.action")
attr(,"class")

paste('Sys.Date():', Sys.Date(), 'Sys.time():', Sys.time(), 'date():', date())
t0 = as.Date("2018-05-07")
t1 = Sys.Date()
paste(
  't1-t0: ', t1-t0,
  'as.POSIXct(t1) - as.POSIXct(t0):', as.POSIXct(t1) - as.POSIXct(t0),
  'as.POSIXlt(t1) - as.POSIXlt(t0):', as.POSIXlt(t1) - as.POSIXlt(t0),
  "difftime(as.POSIXct(t1), t0, units='hours'):",  difftime(as.POSIXct(t1), t0, units='hours')
)
format(as.Date(t1),format="%Y-%m-%d")
typeof(strptime(t1, "%Y-%m-%d"))
class(strptime(t1, "%Y-%m-%d"))
unclass(as.POSIXct(t1))

# 向量
x = c(1,3,5); y=c(2,4,6)
paste('x*y:', paste(x*y, collapse=','), 'x^y:', paste(x^y, collapse=','), 
  'y%/%x:', paste(y%/%x, collapse=','), 'y%%x:', paste(y%%x, collapse=',')
)
crossprod(x, y) # x与y的内积(%*%)
tcrossprod(x, y) # x与y的外积(%o%)

y = append(y, c(8, 10))
x+y
a = seq(0, 4, by=1)
x = rep(a, each=5)
b = seq(1, 5, by=1)
y = rep(b, 5)
x+y
paste('length(x): ', length(x), ', mode(x): ', mode(x), 'prod(x): ', prod(x), 'range(x): ', paste(range(x), collapse='~'))
paste(
  '列出x中的偶数: ', paste(x[x%%2==0], collapse=','),
  '去掉x中的偶数: ', paste(x[-which(x%%2==0)], collapse=',')
)

# 矩阵
(x = matrix(1:12, nrow=4, ncol=3, byrow=T))
(y = t(x))

x%*%y

paste(
  'dim(x):', paste(dim(x), collapse=','),
  'nrow(x):', nrow(x),
  'rowSums(x):', paste(rowSums(x), collapse=','),
  'rowMeans(x):', paste(rowMeans(x), collapse=',')
)
(x = matrix(rnorm(16), 4, 4))
diag(x)
diag(3)
solve(x)
det(x)

#数组
(x = array(1:24, c(3, 4, 2, 2), list(c('行1', '行2', '行3'), c('列1', '列2', '列3', '列4'), c('A', 'B'), c('C', 'D'))))
paste(
  'x[2, 3, 1, 2]:', x['行2', '列3', 'A', 'D'],
  'x[2, 3, 2, 2]:', x[2, 3, 2, 2],
  'dim(x):', paste(dim(x), collapse=',')
)

#因子、列表与数据框
(x = list(name=c('小明', '小林', '小颖', '小马', '小华'), gender=c('男', '女', '女',  '男', '男'), grade=c(89, 48, 68, 59, 99)))
(x = as.data.frame(matrix(unlist(x), nrow=5, byrow=F), stringsAsFactors=F))
Sys.getlocale(category="LC_ALL")
Sys.setlocale(category="LC_ALL",locale="chinese")
colnames(x) <- c('name', 'gender', 'grade')
print(x)

paste(x$gender original class:', class(x$gender))
x$gender = factor(x$gender)
paste('x$gender new class:', class(x$gender), 
    'levels(x$gender):', paste(levels(x$gender), collapse=','))
subset(x, select=c(name, grade))

passed = x[x$grade>=60,]
passed[order(passed$grade, decreasing=T),]

