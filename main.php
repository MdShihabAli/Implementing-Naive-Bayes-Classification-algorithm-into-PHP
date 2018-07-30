<?php

require_once('NaiveBayesClassifier.php');

$classifier = new NaiveBayesClassifier();

$sports = Category::$SPORTS;
$finance = Category::$FINANCE;
$religion = Category::$RELIGION;
$politics = Category::$POLITICS;


$classifier->train('Sport in Bangladesh is a popular form of entertainment as well as an essential part of Bangladeshi culture', $sports);
$classifier->train('Sport can play a role in improving the lives of not only individuals but whole communities', $sports);

$classifier->train('Financial risk protection and equity are major components of universal health coverage which is defined as ensuring access to health services for all citizens without any undue financial burden', $finance);

$classifier->train('Secularism is established in Bangladesh and freedom of religion is guaranteed by constitution', $religion);
$classifier->train('Bangladesh religious minorities have been facing attacks since the 2014 national election', $religion);

$classifier->train('The politics regarding the bargaining of the students for their sports games interest with the university authority is called student politics', $politics);
$classifier->train('A key risk related to the violence in Bangladesh from a rating perspective is that at some stage safety issues could deter foreigners from doing business there', $politics);


$category = $classifier->classify('The issues of religion politics became interconnected in Bangladesh ');
echo $category;
echo " ";

$category = $classifier->classify('This article argues that the interconnection of religion and politics in the context of Bangladesh is linked with the modes of governance ');
echo $category;
echo " ";

$category = $classifier->classify('Religious minorities are subject of threats in bangladesh in several cases of political issues');
echo $category;
echo " ";

$category = $classifier->classify('In other words it is a problem of politics not religion ');
echo $category;
echo " ";

$category = $classifier->classify('The people of Bengal want freedom of religion they do not want any interference in religious matters ');
echo $category;
echo " ";

$category = $classifier->classify('Religion can not be used for political ends');
echo $category;

?>