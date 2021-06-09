#!/bin/bash

# create index.html file header
echo -e "<!DOCTYPE html>
<html>
<head>
	<title> Shareuitor </title>
	<link rel=\"stylesheet\" href=\"style.css\"/>
	<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">
	<link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap\" rel=\"stylesheet\"> 
</head>

<body>
	<h1>Serverutzu shareuitor</h1>
	<div id=\"gallery\">
" > index.html

for f in *JPG
do
	echo -e "		<a href=\"$f\"><img src=\"$f\"/></a>" >> index.html
done

echo -e "	</div>\n</body>\n</html>" >> index.html

# create style.css file
echo -e "body{
	background-color: #121212;
	color: #AAAAAA;
	padding: 1em;
}

h1{
	background-color: #232323;
	//margin: 1em;
	padding: 1em;
	font-family: 'Montserrat', sans-serif;
	text-align: center;
	border-radius: 20px;
}

#gallery{
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	row-gap: .25em;
	column-gap: .25em;
}

a{
	margin:0;
	padding:0;
}
img{
	border-radius: .5em;
	width:100%;
	aspect-ratio: 1/1;
	object-fit: cover;
}" > style.css

python3 -m http.server 27015
