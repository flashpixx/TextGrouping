# Text Mining - Grouping

This R script contains a set of text and data mining algorithms:

* [Normalized Compression Distance](https://en.wikipedia.org/wiki/Normalized_compression_distance)
* [Multidimensional Scaling](https://en.wikipedia.org/wiki/Multidimensional_scaling)
* [Affinity Propagation](https://en.wikipedia.org/wiki/Affinity_propagation)

For input a text or text file can be used with the following definition

```
<label1>: <any text>
<label2>: <any text>
...
```

A working [Shiny application](https://flashpixx.shinyapps.io/TextMining-Grouping/) can run online within a browser or manually started wih the command ```source("main.r")```. The application does the following steps:

1. cleaning input text, stopword reduction, remove punctation and numbers
2. runs the normalized compression distance to analyse dissimilarity of the text input
3. runs the multidimensional scaling to create a 2D projection of the dissimilarity data
4. runs affinity propagation of 2D projection to build groups of data

 
