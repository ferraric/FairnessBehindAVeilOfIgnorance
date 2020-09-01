import numpy as np
from cvxpy import *


def distance(x1, x2, d_max):
    """
    returns the euclidean distance between two points x1 and x2

    Inputs:
    d_max: maximum distance between any two data points in dataset

    """
    return np.linalg.norm(x1-x2)/d_max


def violated_pairs(y_pred, X_data, delta, d_max):
    """
    returns a list of index pairs for which the constraints are violated

    Inputs:
    y_pred: a vector of predicted outputs
    X_data: the data points from whcih y_pred was predicted
    delta: amount by which we allow violation of the constraints
    d_max: maximum distance between any two data points in dataset

    """
    pair_list = []
    n = y_pred.shape[0]
    assert(X_data.shape[0] == n)
    for i in range(n):
        for j in range(i+1, n):
            if np.absolute(y_pred[i] - y_pred[j]) \
               > (delta + distance(X_data[i, :], X_data[j, :], d_max)):
                pair_list.append((i, j))
    return pair_list


def num_Dwork_violation(y_pred, X_data, delta, d_max):
    """
    returns the number of violated constraints

    Inputs:
    y_pred: a vector of predicted outputs
    X_data: the data points from whcih y_pred was predicted
    delta: amount by which we allow violation of the constraints
    d_max: maximum distance between any two data points in dataset

    """
    count = 0
    n = y_pred.shape[0]
    assert(X_data.shape[0] == n)
    for i in range(n):
        for j in range(i+1, n):
            if np.absolute(y_pred[i] - y_pred[j]) \
               > delta + distance(X_data[i, :], X_data[j, :], d_max):
                count += 1
    return count


def avg_Dwork_violation(y_pred, X_data, delta, d_max):
    """
    returns the average amount by which the constraints are violated

    Inputs:
    y_pred: a vector of predicted outputs
    X_data: the data points from whcih y_pred was predicted
    delta: amount by which we allow violation of the constraints
    d_max: maximum distance between any two data points in dataset

    """

    violation_sum = 0
    n = y_pred.shape[0]
    assert(X_data.shape[0] == n)
    for i in range(n):
        for j in range(i+1, n):
            violation_sum += np.maximum(0, np.absolute(y_pred[i] - y_pred[j]) -
                                        delta - distance(X_data[i, :],
                                                         X_data[j, :],
                                                         d_max))
    return 2*violation_sum/(n*(n-1))


def ge2(y_pred, y_actual):
    """
    returns the generalized entropy
    (https://people.mpi-sws.org/~tspeicher/papers/inequality_indices.pdf)
    for alpha = 2

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels

    """
    benefit = (0.25 * np.multiply((y_actual + 1), (y_pred + 1)) +
               0.125 * np.multiply((1 - y_actual), (y_pred + 5)))
    mu = np.average(benefit)
    return 0.5 * np.average(np.power(benefit/mu, 2)) - 0.5


def atk(y_pred, y_actual, alpha):
    """
    returns the Atkinson's Index

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels
    alpha: parameter for the Atkinson's Index
    """

    n = y_pred.shape[0]
    benefit = (0.25 * np.multiply((y_actual + 1), (y_pred + 1)) +
               0.125 * np.multiply((1 - y_actual), (y_pred + 5)))
    mu = np.average(benefit)
    if alpha == 0:
        return 1 - (np.prod(np.power(benefit, (1/n))))/mu
    elif alpha < 1:
        return 1 - (np.average(np.power(benefit, alpha))**(1/alpha))/mu
    else:
        print('Dont use this function with alpha > 1')
        return 0

def avg_utility2(y_pred, y_actual, alpha):
    """
    returns the average utility of the predictions assiciated with y_pred
    for the actual labels in y_actual. This is the cvx compatible version.

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels
    alpha: parameter to the utility function

    """
    n = y_actual.shape[0]
    benefit = 2 + (0.25 * mul_elemwise((y_actual + 1), (y_pred + 1)) +
               0.125 * mul_elemwise((1 - y_actual), (y_pred + 5)))

    s = sum_entries(np.sign(alpha)* power(benefit, alpha))
    return s/n

def eval_util2(y_pred, y_actual, alpha):
    """
    returns the average utility of the predictions assiciated with y_pred
    for the actual labels in y_actual. This version cannot be used as input
    to the cvx solver, use this in all other cases though.

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels
    alpha: parameter to the utility function

    """

    n = y_actual.shape[0]
    benefit = 2 + (0.25 * np.multiply((y_actual + 1), (y_pred + 1)) +
               0.125 * np.multiply((1 - y_actual), (y_pred + 5)))

    s = sum(np.sign(alpha) * np.power(benefit, alpha))
    return s/n


def avg_utility(y_pred, y_actual, alpha):
    """
    returns the average utility of the predictions assiciated with y_pred
    for the actual labels in y_actual. This is the cvx compatible version.

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels
    alpha: parameter to the utility function

    """
    n = y_actual.shape[0]
    benefit = (0.25 * mul_elemwise((y_actual + 1), (y_pred + 1)) +
               0.125 * mul_elemwise((1 - y_actual), (y_pred + 5)))

    s = sum_entries(np.sign(alpha)* power(benefit, alpha))
    return s/n


def eval_util(y_pred, y_actual, alpha):
    """
    returns the average utility of the predictions assiciated with y_pred
    for the actual labels in y_actual. This version cannot be used as input
    to the cvx solver, use this in all other cases though.

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels
    alpha: parameter to the utility function

    """

    n = y_actual.shape[0]
    benefit = (0.25 * np.multiply((y_actual + 1), (y_pred + 1)) +
               0.125 * np.multiply((1 - y_actual), (y_pred + 5)))

    s = sum(np.sign(alpha) * np.power(benefit, alpha))
    return s/n


def avg_benefit(y_pred, y_actual):
    """
    returns the average benefit of the predictions assiciated with y_pred
    for the actual labels in y_actual. This is the cvx compatible version.

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels

    """
    n = y_actual.shape[0]
    benefit = (0.25 * mul_elemwise((y_actual + 1), (y_pred + 1)) +
               0.125 * mul_elemwise((1 - y_actual), (y_pred + 5)))
    return sum_entries(benefit)/n


def eval_benefit(y_pred, y_actual):
    """
    returns the average benefit of the predictions assiciated with y_pred
    for the actual labels in y_actual. This version cannot be used as input
    to the cvx solver, use this in all other cases though.

    Inputs:
    y_pred: vector of predicted outputs
    y_actual: vector of actual labels

    """
    n = y_actual.shape[0]
    benefit = (0.25 * np.multiply((y_actual + 1), (y_pred + 1)) +
               0.125 * np.multiply((1 - y_actual), (y_pred + 5)))
    return np.sum(benefit)/n

def min_benefit(y_pred, y_actual):
    #assert(y_pred.shape[0] == y.shape[0])
    n = y_actual.shape[0]
    benefit = (0.25 * mul_elemwise((y_actual + 1), (y_pred + 1)) +
               0.125 * mul_elemwise((1 - y_actual), (y_pred + 5)))
    s = min_entries(benefit)
    return s

def eval_min_benefit(y_pred, y_actual):
    n = y_actual.shape[0]
    benefit = (0.25 * np.multiply((y_actual + 1), (y_pred + 1)) +
               0.125 * np.multiply((1 - y_actual), (y_pred + 5)))
    s = min(benefit)
    return s
