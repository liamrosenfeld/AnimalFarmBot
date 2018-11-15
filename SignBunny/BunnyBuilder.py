MAX_SIGN_WIDTH = 13

def buildBunny():
    return '(\\__/) ||\n(•ㅅ•) ||\n/ 　 づ'

def buildSignBoundary():
    spaces = "-" * (MAX_SIGN_WIDTH)
    return "|"+ spaces + "|"

def buildMiddleOfSign(message: str):
    inputArr = message.split()

    if not inputArr:
        inputArr = ["no", "message", "given"]

    lines = []
    line = ""
    for word in inputArr:
        if (len(word) > (MAX_SIGN_WIDTH - 3)):
            lines = ["One of your", "words are", "too long"]
            break

        if "```" not in word:
            if len(line) + len(word) > MAX_SIGN_WIDTH - 3:
                lines.append(line)
                line = word
            else:
                if line == "":
                    line = word
                else:
                    line += " " + word
        else:
            line = ""
            lines = ["triple", "backtick", "is not", "allowed"]
            break
        
    if line != "":
        lines.append(line)
    lines = map(buildLine, lines)
    middle = '\n'.join(lines)
    return middle
        

def buildLine(line: str):
    endBuffer = " " * (MAX_SIGN_WIDTH - 1 - len(line))
    return f"| {line.upper()}{endBuffer}|"

def buildSign(message: str):
    sign = "%s\n%s\n%s\n%s" % (buildSignBoundary(),
                               buildMiddleOfSign(message),
                               buildSignBoundary(),
                               buildBunny())
    return sign