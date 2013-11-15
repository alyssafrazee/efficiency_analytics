## plot/summaries of efficiency data for example jobs

dat = read.table("times.txt", header=TRUE)

png("time_hist.png")
hist(dat$walltime, xlab="time (hours)", 
	main="distribution of wallclock times", 
	col="purple3",
	breaks=30)
dev.off()

summary(dat$walltime)
var(dat$walltime)

boxplot(dat$walltime~dat$node, col="gray", main="wallclock time by node")
# variability doesn't seem to be explained by node

png("syswalltime.png")
plot(dat$walltime, dat$systime, 
	xlab="wallclock time (hours)", 
	ylab="system time (minutes)", 
	pch=19, col="purple3",
	main="wallclock vs. system time")
dev.off()

cor(dat$walltime, dat$systime) #0.597

hist(dat$systime, xlab="system time (minutes)",
	main="distribution of system times",
	col="dodgerblue",
	breaks=30)

boxplot(dat$systime~dat$node, col="gray", main="system time by node")

png("memory.png")
hist(dat$memory, xlab="max memory usage (gigabytes)",
	main="distribution of memory usage",
	col="dodgerblue", breaks=30)
dev.off()

summary(dat$memory)

boxplot(dat$memory~dat$node, col="gray", main="memory usage by node")

png("memtime.png")
plot(dat$walltime, dat$memory, 
	xlab="memory usage (gigabytes)", ylab="wallclock time (hours)",
	pch=19, col="navy", main="memory use vs. time")
dev.off()

cor(dat$walltime, dat$memory) #0.6

plot(dat$memory, dat$systime, 
	xlab="memory usage", ylab="system time",
	pch=19, col="navy")

## by request: plot/regress input size vs. efficiency
baminfo = read.table("bams.txt", header=FALSE)
names(baminfo) = c('permissions','x','owner','group','size','month','day','year','filename')
sample_id = sapply(dat$jobid, function(x) substr(x,1,5))
bam_id = sapply(baminfo$filename, function(x) substr(x, 13, 17))
sizes = as.character(baminfo$size[match(sample_id, bam_id)])
sizeingigs = sapply(sizes, function(x){
	num = as.numeric(substr(x,1,nchar(x)-1))
	num = ifelse(substr(x,nchar(x),nchar(x)) == "M", num/1024, num)
	num
}, USE.NAMES=FALSE)

png('inputsize.png', width=700, height=350)
par(mfrow=c(1,2))
plot(sizeingigs, dat$walltime, 
	xlab="input size (gigabytes)", ylab="wallclock time (hours)",
	pch=19, col="purple3", main="input size vs. wallclock time")
plot(sizeingigs, dat$memory,
	xlab="input size (gigabytes)", ylab="memory usage (gigabytes)",
	pch=19, col="dodgerblue", main="input size vs. memory use")
dev.off()

cor(sizeingigs, dat$walltime) #0.80
cor(sizeingigs, dat$memory) #0.29












