# Fairness Behind A Veil Of Ignorance

There are 3 top-level folders. One containing all code, one holds the final plots and one holds the result data that the scripts produce.

In the code folder there are 3 jupyter notebooks (.ipynb files). “Social_Welfare_for_IndividualFairness” contains the code corresponding to the classification experiments done in the paper “Fairness Behind a Veil of Ignorance: A Welfare Analysis for Automated Decision Making” (https://arxiv.org/pdf/1806.04959.pdf). “Social_Welfare_for_GrouplFairness” contains the same experiments done with a similar approach but for ensuring group fairness. It is explained in more detail in section 3 of my Bachelor Thesis which is included as a PDF. Lastly “DworkHeuristic” is a heuristic approach to optimize for the fairness constraints proposed by Dwork et. at. (https://arxiv.org/pdf/1104.3913.pdf). A detailed description of the heuristic can be found in section 4 of the Thesis.

The remaining Python scripts contain several helper functions.

All the Matlab scripts are for plotting. One first needs to run the code in the jupyter notebooks before running the plotting scripts.

Dependencies:
- python (tested with version 3.6.5)
- juypter notebook
- conda (to install other packages)
- cvx (version 0.4.11, install by running “conda install cvxpy=0.4.11”)
- scikit-learn  (“conda install scikit-learn ”, tested with version 0.19.1)
- numpy (“conda install numpy”, tested with version 1.14.5)
