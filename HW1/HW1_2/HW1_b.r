library(NMF)
library(Matrix)
library(pixmap)

mtr <- readMM('bbc.mtx')

print('dim(mtr) :'); dim(mtr)

nmfSeed()
nmfSeed("random")

aout <- nmf(as.matrix(mtr), 5,"lee",.options='v3')

fit(aout)
approxA <- fitted(aout)
dim(approxA)
print(paste('rank approxA',rankMatrix(approxA)));
print(paste('Frobenius norm of (A-approxA)', norm(A-approxA, "F")))

summary(aout,target=mtr)
w <- basis(aout)
dim(w)
h <- coef(aout)
dim(h)

approxA <- pmin(approxA,10)
mtrnew <- mtr
