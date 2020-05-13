
N = 10^3
x = runif(N)
x1 = x[-N]
x2 = x[-1]
par(mfrow=c(1, 3), mar=c(1, 1, 1, 1))  #一页多图
hist(x, prob=T, col=gray(0.3), main="unifor on [0, 1]")  #直方图
curve(dunif(x, 0, 1), add=T, col="red")  #添加均匀分布密度函数线
plot(x1, x2, col="red")  #散点图
acf(x)  #自相关关系图

par(mar=c(4, 4, 2, 0))
x = rnorm(100)
hist(x, prob=T, main="normal mu=0, sigma=1")  #`prob=T`时画的密度函数，即histogram的总面积是1；否则画频率图，纵坐标是频数，也就是出现的次数
curve(dnorm(x), add=T, col="red")  #dnorm用于生成正态分布密度函数


par(mar=c(4, 4, 2, 0))
x = rexp(100, 1/10)
hist(x, prob=T, main="均值为10的指数分布随机数", col="gray(0.9)")
curve(dexp(x, 1/10), add=T, col="red")  #dnexp用于指数分布密度函数


N = 10^4
U = runif(N)
x = -log(U)
y = rexp(N)
par(mfrow=c(1, 2)) 
hist(x, freq=F, main="Exp from Uniform")
curve(dexp(x, 1), add=T, col="red")
hist(y, freq=F, main="Exp from R")
curve(dexp(x, 1), add=T, col="red")

par(mfrow=c(1, 3)); p = 0.25
for (n in c(10, 20, 50)) {
  x = rbinom(100, n, p)
  hist(x, prob=T, main=paste0("n = ", n))
  points(0:n, dbinom(0:n, n, p), type="h", lwd=3)
}

par(mar=c(4, 4, 2, 1))

install.packages("MASS"); library(MASS)
set.seed(1000)
(sigma = matrix(c(10, 3, 3, 2), 2))
x = mvrnorm(n=500, rep(1, 2), sigma)
head(x, n=3)
colMeans(x)
var(x)
plot(x, main="t分布 by MASS")


install.packages("mvtnorm"); library("mvtnorm")
set.seed(1000)
(sigma = matrix(c(10, 3, 3, 2), 2))
x = rmvnorm(n=500, mean=c(1, 2), sigma)
head(x)
colMeans(x)
var(x)
plot(x, main="t分布by mvtnorm")


library("mvtnorm")
par(mar=c(4, 4, 2, 1))
(mean = rep(0, 5))  #均值向量
(lower = rep(-1, 5))  #下限
(upper = rep(3, 5))  #上限
(corr = diag(5))  #相关系数矩阵
(corr[lower.tri(corr)] = 0.5)
(corr[upper.tri(corr)] = 0.5)
(prob = pmvnorm(lower, upper, mean, corr))
attr(prob, "error")  #打印绝对误差和估值
attr(prob, "msg")  #打印状态信息

# 正态分布累积概率密度函数的例子
par(mar=c(2, 4, 2, 4))
set.seed(1)
(X<-seq(-5, 5, length.out=100))
(y<-pnorm(x, 0, 1))
plot(x, y, col="red", xlim=c(-5, 5), ylim=c(0, 1), type="l", xaxs="i", yaxs="i", ylab='density', xlab='', main="The Normal Cumulative Distribution")

lines(x, pnorm(x, 0, 0.5), col="green")
lines(x, pnorm(x, 0, 2), col="blue")
lines(x, pnorm(x, -2, 1), col="orange")

legend("bottomright", legend=paste("m=", c(0, 0, 0, -2), "sd=", c(1, 0.5, 2, 1)), lwd=1, col=c("red", "green", "blue", "orange"))

