# Text Mining and Self Organising Map Examples for AI/VISUAL Container Demo

This R script contains a set of text and data mining algorithms.

```
Options:
	-p INTEGER, --port=INTEGER
		bind to port [default = 8080]

	--shownodename
		display node name in title (helpful to distiguish app running in different docker containers) [default = FALSE]

	-s INTEGER, --somdim=INTEGER
		som dimension [default = 35]

	-i INTEGER, --somiterations=INTEGER
		som iterations [default = 100]

	-h, --help
		Show this help message and exit
```

## Text Mining

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

## Self Organizing Map (SOM)

* [Kohonen networks](https://en.wikipedia.org/wiki/Self-organizing_map)

Visualisation of [Wine Data](https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009)
