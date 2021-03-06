library(ggplot2)
library(reshape)

args <- commandArgs(TRUE)
minX <- as.integer(args[1])
maxX <- as.integer(args[2])

source(paste(Sys.getenv('R_SCRIPTS_PATH'), 'annotation.r', sep='/'))
df3 <- load_annotations()

if(file.exists("writebytes.txt")){
	df <- read.table("writebytes.txt", header = TRUE, check.names = FALSE, na.strings = "?")
	num_columns <- ncol(df) - 1
	df <- mean_max_min(num_columns, df)
	df$type <- 'Process'
	
	if(file.exists("writebytes_node.txt")){
		df2 <- read.table("writebytes_node.txt", header = TRUE, check.names = FALSE, na.strings = "?")
		df2 <- mean_max_min(num_columns, df2)
		df2$type <- 'Node'
		
		df <- rbind(df, df2)
	}
	
	p <- ggplot(df) + theme_bw()
	p <- add_annotations(p, df, df3)
	if (num_columns <= 1000){
		p <- p + geom_line(alpha = 0.8, aes(time, value, group=variable, colour=variable))
	} else {
		p <- p + geom_line(aes(time, mean), colour = '2')
		p <- p + geom_ribbon(alpha = 0.3, aes(time, mean, ymin=min, ymax=max, linetype=NA))
		p <- p + geom_ribbon(alpha = 0.3, aes(time, ymin=Q1, ymax=Q3, linetype=NA))
	}
	p <- p + facet_grid(type ~ ., scales = "free_y")
	p <- p + theme(legend.position = "none")
	p <- p + labs(x = "\nTime into experiment (Seconds)", y = "Disk write speed (KiBytes/s)\n")
	if(length(args) > 0){
		p <- p + xlim(minX, maxX)
	}
	p
	
	ggsave(file="writebytes.png", width=12, height=6, dpi=100)
}

if(file.exists("writebytes_sum.txt")){
	df <- read.table("writebytes_sum.txt", header = TRUE, check.names = FALSE, na.strings = "?")
	num_columns <- ncol(df) - 1
	df <- mean_max_min(num_columns, df)
	df$type <- 'Process'

	if(file.exists("writebytes_sum_node.txt")){
		df2 <- read.table("writebytes_sum_node.txt", header = TRUE, check.names = FALSE, na.strings = "?")
		df2 <- mean_max_min(num_columns, df2)
		df2$type <- 'Node'

		df <- rbind(df, df2)
	}

	p <- ggplot(df) + theme_bw()
	p <- add_annotations(p, df, df3)
	if (num_columns <= 1000){
		p <- p + geom_line(alpha = 0.8, aes(time, value, group=variable, colour=variable))
	} else {
		p <- p + geom_line(aes(time, mean), colour = '2')
		p <- p + geom_ribbon(alpha = 0.3, aes(time, mean, ymin=min, ymax=max, linetype=NA))
		p <- p + geom_ribbon(alpha = 0.3, aes(time, ymin=Q1, ymax=Q3, linetype=NA))
	}
	p <- p + facet_grid(type ~ ., scales = "free_y")
	p <- p + theme(legend.position = "none")
	p <- p + labs(x = "\nTime into experiment (Seconds)", y = "Total disk write (KiBytes/s)\n")
	if(length(args) > 0){
		p <- p + xlim(minX, maxX)
	}
	p

	ggsave(file="writebytes_sum.png", width=12, height=6, dpi=100)
}

if(file.exists("wchars.txt")){
	df <- read.table("wchars.txt", header = TRUE, check.names = FALSE, na.strings = "?")
	num_columns <- ncol(df) - 1
	df <- mean_max_min(num_columns, df)
	df$type <- 'Process'
	
	if(file.exists("wchars_node.txt")){
		df2 <- read.table("wchars_node.txt", header = TRUE, check.names = FALSE, na.strings = "?")
		df2 <- mean_max_min(num_columns, df2)
		df2$type <- 'Node'
		
		df <- rbind(df, df2)
	}
	
	p <- ggplot(df) + theme_bw()
	p <- add_annotations(p, df, df3)
	if (num_columns <= 1000){
		p <- p + geom_line(alpha = 0.8, aes(time, value, group=variable, colour=variable))
	} else {
		p <- p + geom_line(aes(time, mean), colour = '2')
		p <- p + geom_ribbon(alpha = 0.3, aes(time, mean, ymin=min, ymax=max, linetype=NA))
		p <- p + geom_ribbon(alpha = 0.3, aes(time, ymin=Q1, ymax=Q3, linetype=NA))
	}
	p <- p + facet_grid(type ~ ., scales = "free_y")
	p <- p + theme(legend.position = "none")
	p <- p + labs(x = "\nTime into experiment (Seconds)", y = "WChar per process (KiBytes/s)\n")
	if(length(args) > 0){
		p <- p + xlim(minX, maxX)
	}
	p
	
	ggsave(file="wchars.png", width=12, height=6, dpi=100)
}

if(file.exists("wchars_sum.txt")){
	df <- read.table("wchars_sum.txt", header = TRUE, check.names = FALSE, na.strings = "?")
	num_columns <- ncol(df) - 1
	df <- mean_max_min(num_columns, df)
	df$type <- 'Process'

	if(file.exists("wchars_sum_node.txt")){
		df2 <- read.table("wchars_sum_node.txt", header = TRUE, check.names = FALSE, na.strings = "?")
		df2 <- mean_max_min(num_columns, df2)
		df2$type <- 'Node'

		df <- rbind(df, df2)
	}

	p <- ggplot(df) + theme_bw()
	p <- add_annotations(p, df, df3)
	if (num_columns <= 1000){
		p <- p + geom_line(alpha = 0.8, aes(time, value, group=variable, colour=variable))
	} else {
		p <- p + geom_line(aes(time, mean), colour = '2')
		p <- p + geom_ribbon(alpha = 0.3, aes(time, mean, ymin=min, ymax=max, linetype=NA))
		p <- p + geom_ribbon(alpha = 0.3, aes(time, ymin=Q1, ymax=Q3, linetype=NA))
	}
	p <- p + facet_grid(type ~ ., scales = "free_y")
	p <- p + theme(legend.position = "none")
	p <- p + labs(x = "\nTime into experiment (Seconds)", y = "WChar (KiBytes/s)\n")
	if(length(args) > 0){
		p <- p + xlim(minX, maxX)
	}
	p

	ggsave(file="wchars_sum.png", width=12, height=6, dpi=100)
}