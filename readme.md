# Text Mining - Grouping

This R script contains a set of text and data mining algorithms:

* [Normalized Compression Distance](https://en.wikipedia.org/wiki/Normalized_compression_distance)
* [Multidimensional Scaling](https://en.wikipedia.org/wiki/Multidimensional_scaling)
* [Spectral Clustering](https://en.wikipedia.org/wiki/Spectral_clustering)

For input a text file can be used with the following definition

```
<label1>: <any text>
<label2>: <any text>
...
```

The main script can be load with ```source("main.r")``` and the function ```build.neighbourhood( "inputfile.txt" )``` can be run immediatly. The optional argument ```stopwordlanguage``` ist set to ``èn``` bei default. The script does the following steps:

1. cleaning input text, stopword reduction, remove punctation and numbers
2. runs the normalized compression distance to analyse similarity of the text input
3. build a graph based on the values of the normalized compression distance
4. runs a spectral clustering to create groups of elements
5. runs the multidimensional scaling to create a 2D plot of the similarity of the text with the labels

For exporting the plot the command ```common.pdf("outputfilename")``` can be used

 
