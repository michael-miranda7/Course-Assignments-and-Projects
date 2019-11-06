import random, time

from Term import *
from Clause import *


def randomAssignment(assignments):
    ''' Randomly assign True or False to each element in the list
    assignments.  '''
    for i in range(len(assignments)):
        if random.randint(1,2) == 1:
            assignments[i] = False
        else:
            assignments[i] = True

def hillClimb(clauses, guess):
    ''' Finds a new "guess" that is better than the input "guess".  Each possible
    "new guess" is made by flipping one variable in "guess" from True to False (or
    vice versa).
    Returns False if it can't find a better guess.  '''

    # assume the minimum is the current guess
    minValue = [(Clause.countTrue(clauses, guess), guess)]

    # if the current guess solves the problem, don't try any others
    if Clause.countTrue(clauses, guess) == len(clauses):
        return guess

    foundBetter = False
    for i in range(0, len(guess)):
        newGuess = guess.copy()

        # the next statement flips the True/False value at index i
        newGuess[i] = True if guess[i] == False else False
        count = Clause.countTrue(clauses, newGuess) # see how good the new guess is

        if count == len(clauses): # perfect.   No need to try anything else.
            return newGuess

        if count > minValue[0][0]: # better than the best so far
            minValue = [(count, newGuess)]
            foundBetter = True
        elif count == minValue[0][0] and foundBetter: # equal to the best so far
            minValue.append((count, newGuess))

    if not foundBetter:
        return False

    # pick one at random
    index = random.randint(0, len(minValue) - 1)
    return minValue[index][1]

def genetic(clauses,guess):
    pop = clauses
    genCount = 1
    generate = True
    while generate:
        newPop = []
        children = []
        newPop = sorted(pop, key = lambda x: Clause.countTrue(pop,guess))
        newPop = newPop[50:]
        for i in range(len(newPop)//2):
            if i == len(newPop)//2 - 1:
                c1t1 = newPop[i].terms[0]
                c2t1 = newPop[0].terms[0]
                c1t3 = newPop[0].terms[2]
                c2t3 = newPop[i].terms[2]
                if random.randint(1, 2) == 1:
                    c1t2 = newPop[i].terms[1]
                else:
                    c1t2 = newPop[0].terms[1]
                if random.randint(1, 2) == 1:
                    c2t2 = newPop[i].terms[1]
                else:
                    c2t2 = newPop[0].terms[1]
            else:
                c1t1 = newPop[i].terms[0]
                c2t1 = newPop[i+1].terms[0]
                c1t3 = newPop[i+1].terms[2]
                c2t3 = newPop[i].terms[2]
                if random.randint(1,2) == 1:
                    c1t2 = newPop[i].terms[1]
                else:
                    c1t2 = newPop[i+1].terms[1]
                if random.randint(1,2) == 1:
                    c2t2 = newPop[i].terms[1]
                else:
                    c2t2 = newPop[i+1].terms[1]
            c1 = Clause(c1t1,c1t2,c1t3)
            c2 = Clause(c2t1,c2t2,c2t3)
            children.append(c1)
            children.append(c2)
        # for i in range(len(children)):
        #     if random.randint(1,2) == 1:
        #         children[i] = children[i].terms.reverse()
        newPop = newPop + children
        newPop = sorted(newPop,key= lambda x: Clause.countTrue(newPop, guess))
        newPop = newPop[:99]
        
        for i in range(100):
            if Clause.allClausesTrue(newPop,guess) == True:
                generate = False
                print("Good Results")
                print(Clause.countTrue(newPop, guess))
                return newPop,genCount
        pop = newPop
        if genCount == 5:
            print("Sub Optimal" )
            print("# Correct :"+str(Clause.countTrue(newPop, guess)))
            return newPop,genCount
            break;
        genCount += 1



# let's play
#n = int(input('How many variables? '))
print("n\tgeneration count")

for n in range(100,1000,100):
    assignments = n*[True]
    randomAssignment(assignments)
    #print('Random assignments: ', assignments)

    m = 100 #int(input('How many random clauses?'))
    allClauses = []
    for i in range(m):
        allClauses.append(Clause.randomClauseThatIsSatisfiable(n, assignments))

    randomGuess = [True if random.randint(1, 2) == 1 else False for _ in range(n)]

    answer, gens = genetic(allClauses,randomGuess)
    print(n, "\t", gens)

