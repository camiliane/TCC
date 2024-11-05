library("CEMiTool")

pathways <- "ReactomePathways.gmt"
network <- "BioGrid-2IndependentExp.txt"
counts <- "Counts/ "

directory <- " "


pathways <- read_gmt(pathways)
network <- read.delim(network)
counts <- read.table(counts, sep='\t', header=TRUE)


cem <- cemitool(counts, gmt = pathways, interactions = network, filter = FALSE,
                apply_vst = TRUE, verbose = TRUE, cor_method = "spearman",
                filter_pval = 0.01, force_beta = TRUE)

generate_report(cem, directory=directory, output_format="html_document", force=TRUE)
write_files(cem, directory=directory, force=TRUE)
save_plots(cem, "all", directory=directory, force=TRUE)


