### Implementing Naive Bayes Classification algorithm into PHP to classify given text as Sports, Finance, Religion or Politics. This application uses MySql as database.

**How to install the project-?**
>Import naivebayes.sql database file then execute main.php.

**What I implement in my project:**

         Training data will be available. These data are divided into four categories. 
         There will be some sentences and the categories will be mentioned at the end of each sentence. 
         There will be some stopwords. 
         It has also given unknown data to find out each unknown data sentence which category 
         before that the  stopwords have to be removed. 

**Naive Bayes classifier From   [Wikipedia:](https://en.wikipedia.org/wiki/Naive_Bayes_classifier).**
```
    P(A | B) = P(B | A) * P(A) / P(B) where A and B are events and P(B) != 0.
    P(A | B) is a conditional probability: the likelihood of event A occurring given that B is true.
    P(B | A) is also a conditional probability: the likelihood of event B occurring given that A is true.
    P(A) and P(B) are the probabilities of observing A and B independently of each other, 
    this is known as the marginal probability.
```
**In our Implementation one example:**
```
    	 *  p(sports/bodyText) = p(sports) * p(bodyText/sports) / p(bodyText);
    	 *   p(bodyText) is constant so it can be committed
    	 *   p(sports) = no of documents (sentence) belonging to category sports/ total no of documents (sentence)
    	 *   p(bodyText/sports) = p(word1/sports) * p(word2/sports) * .... p(word/sports)
    	 *   Laplace smoothing for such cases is usually given by (c+1)/(N+V), 
    	 *   where V is the vocabulary size (total no of different words)
    	 *   p(word/sports) = no of times word occur in sports / no of all words in sports.
```
