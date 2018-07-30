<?php

/**
 * @Md Shihab Ali <shihab15-4975@diu.edu.bd>
 */

require_once('Category.php');


class NaiveBayesClassifier
{

    public function __construct()
    {
    }

    /**
     * sentence is text(document) which will be classified as Sports, Finance, Politics or Religion
     * @return category- Sports/Finance/Religion/Politics
     */
    public function classify($sentence)
    {

        // extracting keywords from input text/sentence
        $keywordsArray = $this->tokenize($sentence);

        // classifying the category
        $category = $this->decide($keywordsArray);

        return $category;
    }

    /**
     * @sentence- text/document provided by user as training data
     * @category- category of sentence
     * this function will save sentence aka text/document in trainingSet table with given category
     * It will also update count of words (or insert new) in wordFrequency table
     */
    public function train($sentence, $category)
    {
        $sports = Category::$SPORTS;
        $finance = Category::$FINANCE;
        $religion = Category::$RELIGION;
        $politics = Category::$POLITICS;

        if ($category == $sports || $category == $finance || $category == $religion || $category == $politics) {

            //connecting to database
            require 'db_connect.php';

            // inserting sentence into trainingSet with given category
            $sql = mysqli_query($conn, "INSERT into trainingSet (document, category) values('$sentence', '$category')");

            // extracting keywords
            $keywordsArray = $this->tokenize($sentence);

            // updating wordFrequency table
            foreach ($keywordsArray as $word) {

                // if this word is already present with given category then update count else insert
                $sql = mysqli_query($conn, "SELECT count(*) as total FROM wordFrequency WHERE word = '$word' and category= '$category' ");
                $count = mysqli_fetch_assoc($sql);

                if ($count['total'] == 0) {
                    $sql = mysqli_query($conn, "INSERT into wordFrequency (word, category, count) values('$word', '$category', 1)");
                } else {
                    $sql = mysqli_query($conn, "UPDATE wordFrequency set count = count + 1 where word = '$word'");
                }
            }

            //closing connection
            $conn->close();

        } else {
            throw new Exception('Unknown category. Valid categories are: $ham, $spam');
        }
    }

    /**
     * this function takes a paragraph of text as input and returns an array of keywords.
     */

    private function tokenize($sentence)
    {
        $stopWords = array('A', 'an', 'the', 'that', 'their', 'there', 'it',
            'would', 'should', 'shall', 'will', 'into', 'unto', 'undo', 'in', 'of', 'to', 'from', 'for', 'by',
            'but', 'not', 'is', 'are', 'have', 'has', 'as', 'at', 'and', 'can', 'could');

        //removing all the characters which ar not letters, numbers or space
        $sentence = preg_replace("/[^a-zA-Z 0-9]+/", "", $sentence);

        //converting to lowercase
        $sentence = strtolower($sentence);

        //an empty array
        $keywordsArray = array();

        //splitting text into array of keywords
        //http://www.w3schools.com/php/func_string_strtok.asp
        $token = strtok($sentence, " ");
        while ($token !== false) {

            //excluding elements of length less than 3
            if (!(strlen($token) <= 2)) {

                //excluding elements which are present in stopWords array
                //http://www.w3schools.com/php/func_array_in_array.asp
                if (!(in_array($token, $stopWords))) {
                    array_push($keywordsArray, $token);
                }
            }
            $token = strtok(" ");
        }
        return $keywordsArray;
    }

    /**
     * This function takes an array of words as input and return category Sports, Finance or Religion after
     * applying Naive Bayes Classifier
     *
     * Naive Bayes Classifier Algorithm -
     *
     *   Reference:
     *   http://stackoverflow.com/questions/9996327/using-a-naive-bayes-classifier-to-classify-tweets-some-problems
     *   https://github.com/ttezel/bayes/blob/master/lib/naive_bayes.js
     */
    private function decide($keywordsArray)
    {
        $sports = Category::$SPORTS;
        $finance = Category::$FINANCE;
        $religion = Category::$RELIGION;
        $politics = Category::$POLITICS;

        // by default assuming category to be sports
        $category = $sports;

        // making connection to database
        require 'db_connect.php';

        $sql = mysqli_query($conn, "SELECT count(*) as total FROM trainingSet WHERE  category = '$sports' ");
        $sportsCount = mysqli_fetch_assoc($sql);
        $sportsCount = $sportsCount['total'];

        $sql = mysqli_query($conn, "SELECT count(*) as total FROM trainingSet WHERE  category = '$finance' ");
        $financeCount = mysqli_fetch_assoc($sql);
        $financeCount = $financeCount['total'];

        $sql = mysqli_query($conn, "SELECT count(*) as total FROM trainingSet WHERE  category = '$religion' ");
        $religionCount = mysqli_fetch_assoc($sql);
        $religionCount = $religionCount['total'];

        $sql = mysqli_query($conn, "SELECT count(*) as total FROM trainingSet WHERE  category = '$politics' ");
        $politicsCount = mysqli_fetch_assoc($sql);
        $politicsCount = $politicsCount['total'];

        $sql = mysqli_query($conn, "SELECT count(*) as total FROM trainingSet ");
        $totalCount = mysqli_fetch_assoc($sql);
        $totalCount = $totalCount['total'];



        //p(Sports)
        $pSports = $sportsCount / $totalCount; // (no of documents classified as sports / total no of documents)

        //p(Finance)
        $pFinance = $financeCount / $totalCount; // (no of documents classified as Finance / total no of documents)

        //p(Religion)
        $pReligion = $religionCount / $totalCount; // (no of documents classified as Religion / total no of documents)

        //p(Politics)
        $pPolitics = $politicsCount / $totalCount; // (no of documents classified as Politics / total no of documents)

        //echo $pSports." "$pFinance." ".$pReligion." ".$pPolitics;

        // no of distinct words (used for laplace smoothing)
        $sql = mysqli_query($conn, "SELECT count(*) as total FROM wordFrequency ");
        $distinctWords = mysqli_fetch_assoc($sql);
        $distinctWords = $distinctWords['total'];

        $bodyTextIsSports = log($pSports);
        foreach ($keywordsArray as $word) {
            $sql = mysqli_query($conn, "SELECT count as total FROM wordFrequency where word = '$word' and category = '$sports' ");
            $wordCount = mysqli_fetch_assoc($sql);
            $wordCount = $wordCount['total'];
            $bodyTextIsSports += log(($wordCount + 1) / ($sportsCount + $distinctWords));
        }

        $bodyTextIsFinance = log($pFinance);
        foreach ($keywordsArray as $word) {
            $sql = mysqli_query($conn, "SELECT count as total FROM wordFrequency where word = '$word' and category = '$finance' ");
            $wordCount = mysqli_fetch_assoc($sql);
            $wordCount = $wordCount['total'];
            $bodyTextIsFinance += log(($wordCount + 1) / ($financeCount + $distinctWords));
        }


        $bodyTextIsReligion = log($pReligion);
        foreach ($keywordsArray as $word) {
            $sql = mysqli_query($conn, "SELECT count as total FROM wordFrequency where word = '$word' and category = '$religion' ");
            $wordCount = mysqli_fetch_assoc($sql);
            $wordCount = $wordCount['total'];
            $bodyTextIsReligion += log(($wordCount + 1) / ($religionCount + $distinctWords));
        }


        $bodyTextIsPolitics = log($pPolitics);
        foreach ($keywordsArray as $word) {
            $sql = mysqli_query($conn, "SELECT count as total FROM wordFrequency where word = '$word' and category = '$politics' ");
            $wordCount = mysqli_fetch_assoc($sql);
            $wordCount = $wordCount['total'];
            $bodyTextIsPolitics += log(($wordCount + 1) / ($politicsCount + $distinctWords));
        }

        if ($bodyTextIsSports >= $bodyTextIsFinance && $bodyTextIsSports >= $bodyTextIsReligion && $bodyTextIsSports >= $bodyTextIsPolitics) {
            $category = $sports;
        }
        elseif ($bodyTextIsFinance >= $bodyTextIsSports && $bodyTextIsFinance >= $bodyTextIsReligion && $bodyTextIsFinance >= $bodyTextIsPolitics) {
            $category = $finance;
        }
        elseif ($bodyTextIsReligion >= $bodyTextIsSports && $bodyTextIsReligion >= $bodyTextIsFinance  && $bodyTextIsReligion >= $bodyTextIsPolitics){
            $category = $religion;
        }

        else {
            $category = $politics;
        }

        $conn->close();

        return $category;
    }
}

?>
