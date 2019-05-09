library(igraph)
library(dplyr)

####
#books network
####
edges <- read.csv("data/books_edges.tsv", sep="\t", stringsAsFactors = F)
edges <- edges%>%select(SourceLanguageCode, TargetLanguageCode, Coocurrences)
colnames(edges) <- c("from","to","weight")
g <- graph_from_data_frame(edges)
# add edge weight
E(g)$weight <- edges$weight

#initial plot
plot(g, layout = layout.davidson.harel,vertex.size=2, vertex_label_dist = 1.5)

####
#twitter network
####
edges <- read.csv("data/twitter_gln_links_with_over_expression.tsv", sep = "\t", stringsAsFactors = F)
edges <- edges%>%select(Source, Target, Common.Users)
colnames(edges)<- c("from","to","weight")
g <- graph_from_data_frame(edges, directed = FALSE)
E(g)$weight <- edges$weight
#reomve duplicate edges
g <- simplify(g)

#initial plot
plot(g, layout = layout.davidson.harel,vertex.size=2, vertex_label_dist = 1.5)

####
#wikipedsia network
####
edges <- read.csv("data/wikipedia_edges.tsv", sep = "\t", stringsAsFactors = F)
edges <- edges%>%select(SourceLanguageCode, TargetLanguageCode, Coocurrences)
colnames(edges)<- c("from","to","weight")
g <- graph_from_data_frame(edges, directed = FALSE)
E(g)$weight <- edges$weight

#reomve duplicate edges
g <- simplify(g)

#initial plot
plot(g, layout = layout.davidson.harel,vertex.size=2, vertex_label_dist = 1.5)

