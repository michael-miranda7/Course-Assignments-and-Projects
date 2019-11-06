import datetime
import time
__author__ = "Michael Miranda"

def createRuleTable(filename):
    charRules = {
                0:["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"],
                1:["0","1","2","3","4","5","6","7","8","9"],
                2:["+","-","*","/"],
                3:["="],
                4:[" "]
                }
    rules = {}
    with open(filename,'r',encoding= "UTF-8") as f:
        lines = f.readlines()
        for i in lines:
            i.strip('\n')
            temp = i.split(' ')
            for j in range(len(temp)):
                temp[j] = int(temp[j])
            rules[temp[0]] = temp[1:]
    f.close()

    return rules, charRules

    


def getCharSlot(rules, n):
    state = ""
    for i in rules:
        if n in rules[i]:
            state = i
    if state == "":
        state = 5
    return state

def nextToken(state, slot,rules):
    newState = rules[state][slot]
    return newState



def getTokenName(t):
    names = ["start","identifier","number","operator","assignment","error"]
    return names[t]

def tokenize(fragment,table,charTable):
    tokens = []
    state = 0
    tokens.append(getTokenName(state))
    for i in fragment:
        slot = getCharSlot(charTable,i)
        state = nextToken(state,slot,table)
        if getTokenName(state) != tokens[-1]:
            tokens.append(getTokenName(state))
    tokens = [e for e in tokens if e != "start"]
    return tokens

def tokenString(tokens):
    s = ""
    if len(tokens)  == 1:
        return tokens[0]
    else:
        for i in range(len(tokens)):
            if i == len(tokens) -1:
                s = s + tokens[i]
            else:
                s = s + tokens[i]
                s = s + " "
        return s
############### Functions added for Assignment 2 #################

def checkRules(strTokens):
    expRules = ["identifier operator expression","number operator expression","identifier","number"]
    stmtRules = ["expression","assign_stmt"]
    if strTokens in expRules:
        return ["expression"]
    elif strTokens == "identifier assignment expression":
        return ["assign_stmt"]
    elif strTokens in stmtRules:
        return ["statement"]
    else:
        return "invalid"

def validator(tokens):
    if "error" in tokens:
        return "invalid"

    s = "invalid"
    loop_count = 0
    temp = tokens
    i = 1
    temp2 = temp
    while loop_count < 100:
        if len(temp) == 0:
            break
        if "statement" in temp and len(temp) > 1:
            break
        x = checkRules(tokenString(temp))
        if x == "invalid":
            temp = temp2[i:]
            i+=1
        else:
            temp = temp2[:i-1] + x
            i = 1
            temp2 = temp
        if tokenString(temp) == "statement":
            s = "valid"
            break
        loop_count +=1

    if loop_count >= 100:
        print("loop exceeded loop count")
    else:
        return s
################################################################

def main():
    table,chars = createRuleTable("table.txt")

    with open("test2.txt","r",encoding="UTF-8") as f:
        fragments = f.readlines()
        f.close()
    with open("results2.txt","w",encoding="UTF-8") as g:
        for i in range(len(fragments)):
            fragments[i] = fragments[i].rstrip('\n')
            t = tokenize(fragments[i], table, chars)
            g.write(fragments[i] + " " +"tokenizes as"+ " " + tokenString(t)+"\n")
            v = validator(t)
            if v == "valid":
                g.write(fragments[i] + " " + "is a valid statement" + "\n")
            else:
                g.write(fragments[i] + " " + "is an invalid statement" + "\n")

        ts = time.time()
        g.write("Results returned:"+ " " + datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S'))


if __name__ == "__main__":
    main()
