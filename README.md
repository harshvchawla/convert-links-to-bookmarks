This bash script (use cygwin if u have windows) converts a list of links in a txt file into a bookmarks.html file that can be then imported into any browser.
The script converts www.url.com/suffixText or www.url.com into format <DT><A HREF="www.url.com">title</A> (where title=suffixText or url if suffixText is empty)
The output file is wrapped in <DL> tags too.

Notes:
- running cmd dos2unix inputfile is better if u want to see the outputFile formatted with each url in just one line
- similarly running cmd unix2dos outputfile is better if u want to see the outputFile formatted when viewed using notepad

Usage:
./convertLinksToBookmarks.sh <input file containing list of links>