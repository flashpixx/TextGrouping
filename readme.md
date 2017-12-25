# Text Mining - Grouping

This R script contains a set of text and data mining algorithms:

* [Normalized Compression Distance](https://en.wikipedia.org/wiki/Normalized_compression_distance)
* [Multidimensional Scaling](https://en.wikipedia.org/wiki/Multidimensional_scaling)
* [Spectral Clustering](https://en.wikipedia.org/wiki/Spectral_clustering)

For input a text or text file can be used with the following definition

```
<label1>: <any text>
<label2>: <any text>
...
```

A working Shiny application can be run from [https://flashpixx.shinyapps.io/TextMining-Grouping/](https://flashpixx.shinyapps.io/TextMining-Grouping/) or manually started wih the command ```source("main.r")```. The application does the following steps:

1. cleaning input text, stopword reduction, remove punctation and numbers
2. runs the normalized compression distance to analyse similarity of the text input
3. build a graph based on the values of the normalized compression distance
4. runs a spectral clustering to create groups of elements
5. runs the multidimensional scaling to create a 2D plot of the similarity of the text with the labels

 
