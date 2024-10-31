# Week 10:
## OpenRefine Part 1: Worksheet
OpenRefine is a data-cleaning tool that can help significantly with the process of cleaning inputs.

OpenRefine is a Java program that runs on your machine that uses your web browser as a graphical interface, and regularly saves so we can pick up where we left off at any point.

Data cleaning steps often need repeating with multiple files. It is important to know what you did to your data. This makes it possible for you to repeat these steps again with similarly structured data. OpenRefine is perfect for speeding up repetitive tasks by replaying previous actions on multiple datasets.
Additionally, journals, granting agencies, and other institutions are requiring documentation of the steps you took when working with your data. With OpenRefine, you can capture all actions applied to your raw data and share them with your publication as supplemental material.

The version we will use in this lab is 3.8.4. It is an open source program that is free. Download the linux version from the [downloads page of openrefine](https://openrefine.org/download).

### Setting up OpenRefine
You can unzip the program using `tar -xvzf openrefine-linux-3.8.4.tar.gz -C ~/`
This places the program into ~/openrefine-3.8.4. You can change the directory it is installed, but DO NOT place it in your github repo!

Then, to run it, we can `cd` into the installed directory, and run the `./refine` script!
It will open a browser window to handle the UI for openrefine!

![The openrefine start](/lab10/images/openrefine-ui.png "An example of the openrefine start.")

### Importing Data
OpenRefine supports a bunch of different file types!
* CSV files (Woo!)
* Text files
* Fixed-width columns
* JSON
* XML
* Excel's XLS/XLSX (Eww)
* And more!

To make a new project, let's first go to Create Project -> This Computer -> Choose Files,
and select Portal\_rodents\_19772002\_simplified.csv

![The upload button location for openrefine](/lab10/images/openrefine-upload.png "Where the upload button is.")

Select **next**.

1. Take a screenshot of the resulting page and place it in the lab10 folder (not in images!) as "data.png" or "data.jpg".

On this screen, you can see a preview of your data. You can do things like check for obvious errors. For instance, if I have a csv with the wrong delimiters, the preview might look strange! If I need to, we can change the delimiter using the settings on the **bottom** of the page. Click the "columns are separated by tabs", and see how the preview changes.

For now, don't touch any other settings! Also, double check that the "Trim Leading & trailing whitespace from strings" box is unchecked for an example later!

2. Inside of the text file __questions.md__, answer Question 1. Make sure the delimiter is set back to commas after this step!

3. Finally, click "Create Project>>" on the top right!

Note: OpenRefine does not modify your original dataset, so we can safely modify things if we need to, and we will retain a backup!

### Exploring Data

Facets are one of the most useful features of OpenRefine. Data faceting is a process of exploring data by applying multiple filters to investigate its composition. It also allows you to identify a subset of data that you wish to change in bulk.

A `facet` groups all the like values that appear in a column, and allows you to filter the data by those values. It also allows you to edit values across many records at the same time.

1. Scroll over the `scientificName` column

2. Click the down arrow next to it, and choose `Facet > Text facet`

3. In the left panel, you should see a box containing each unique value in the column, including how many times each value occurs in the column!

4. In __questions.md__, answer question 2 and 3

You might have noticed when answering question 3 that year was treated as _text_.
Let's convert it to numbers, because we might have accidental non-number values, and this is a good way to detect them.

1. Create a `numeric facet` in the "yr" column. It will start empty. Then, in the main spreadsheet, click the down arrow for that *column*, click `Edit cells > Common transforms... > To number`.

2. Let's also convert `recordID` and `period` columns to numerical values. Then, use the pulldown menu to make a new facet with `recordID`, and select a `Scatterplot facet`

3. Take a screenshot of the screen and save it in the lab10 directory as "scatterplot.png"

4. Click the scatterplot between `recordID` and `yr` to select this for the facet.

**You have completed the lab10 worksheet. Stage all files in the directory with git add, commit them, then push them to your data1201 repository**

## OpenRefine Part 2: Weekly Assignment

### Transforming Data
#### Splitting Columns
If coming to this later, you can open a new instance of OpenRefine, go to `Open Project`, and open an autosave. 

We can split data from one column into multiple if the parts are separated by a common separater (such as a comma or a space).

1. Let's split `scientificName` into two columns: Genus and Species

2. Click the down arrow next to `scientificName, and choose Edit Column > Split into several columns
	1. In the pop-up, in Separator, replace the comma with a space (the box will look empty when you're done)
	2. IMPORTANT: Uncheck the box that says `Remove this Column`

3. Click OK. You should then get some new columns: scientificName 1, scientificName 2, scientificName 3... and so on.
	1. Answer Question 4 in __questions.md__.
	2. Take a screenshot of your columns and call it "scientificNamesSplit.png" or "scientificaNamesSplit.jpg"

4. Try going into the `coordinates` column, and split the values to get a latitude and longitude column (do not delete the original column!)

5. Take a screenshot and call it "coordinates.png" or "coordinates.jpg"

6. We can also undo/redo actions. On the left side of the screen, we have the ability to undo changes logged there by clicking on the step to undo until.
	1. Undo up until before `scientificName` was split.

7. Let's repair the issue with scientificName by trimming whitespaces. `Edit Cells > Common Transformations > Trim leading and trailing whitespace`
	1. Notice Undo/Redo has been changed so we can no longer redo.

8. Repeat the step of splitting scientificName after trimming whitespace.

9. We can rename columns using `Edit column > rename` on a column.
	1. Rename `scientificName 1` to genus
	2. Rename `scientificName 2` to species.

#### Combining Columns
1. We can also combine columns to create new ones. In `yr`, click `Edit Column > Join Columns...`
	1. In the window that shows up, select `yr`, mo`, and `dy`
	2. Have the separater be a hyphen `-`.
	3. Select "write result in new column and name it "date"
		- You can change the order of the columns by dragging them on the left side of the window. 

![Setting up the combine in OpenRefine](/lab10/images/openrefine-date.png "The combine function in OpenRefine.")

2. Once the new column is created, convert it to a date format using `Edit Cells > Common Transforms > To date`

3. Create a new facet using the new `date` column, and making a `Timeline facet`.

4. Take a picture of the screen with the timeline facet, and place it in the lab10 folder (not in images!) as "timeline.png" or "timeline.jpg".

#### Data Clustering
Clustering allows you to find groups of entries that are not identical but are sufficiently similar that they may be alternative representations of the same thing (term or data value). For example, the two strings New York and new york are very likely to refer to the same concept and just have a capitalization differences. Likewise, Björk and Bjork probably refer to the same person. These kinds of variations occur a lot in scientific data. Clustering gives us a tool to resolve them.

The dataset has several near-identical entries in scientificName. For example, there are two misspellings of Ammospermophilus harrisii:
- Ammospermophilis harrisi
- Ammospermophilus harrisi

1. If you removed it, reinstate the `scientificName` text facet (you can also remove all the other facets to gain some space). In the `scientificName` text facet box - click the Cluster button.

2. In the resulting pop-up window, you can change the `Method` and the `Keying` Function. Try different combinations to see what different mergers of values are suggested.

3. If you select the `key collision method` and the `metaphone3` keying function. It should identify one cluster:

![Clustering Window in OpenRefine](/lab10/images/openrefine-date.png "The Clustering Window in OpenRefine")

4. Note that the `New Cell Value` column displays the new name that will replace the value in all the cells in the group. For now, leave it as `Ammospermophilus harrisii`.

5. Tick the `Merge?` checkbox beside each group, then click `Merge selected & Close` to apply the corrections to the dataset and close the window.

6. Open a text facet for `scientificName` and take a picture of the new summary of the column. It should have 10 options. Save it in the lab10 folder (not in images!) as "clustered.png" or "clustered.jpg".

**You have completed the lab10 post-lab assignment. Stage all files in the directory with git add, commit them, then push them to your github data1201 repository**

__*Don't delete these materials as we plan to continue OpenRefine next week!*__
