while True:
    print("Filename: ")
    filename = raw_input()
    filename += ".txt"
    print("Realname: ")
    realname = raw_input()
    print("Author: ")
    author = raw_input()
    f = open(filename, "w")
    f.write("\\beginsong{"+realname+"}[by={"+author+"}]\n\\beginverse\n\\endverse\n\\endsong")
    f.close()

