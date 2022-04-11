# treba citati sve znakove sa IO i napisati kojoj skupini pripadaju
# IDN za identifikatore
# BROJ za konstante
# KR_ZA za ključnu riječ za
# KR_OD za ključnu riječ od
# KR_DO za ključnu riječ do
# KR_AZ za ključnu riječ az

# speicijalni znakovi - kada nema prijelaz poslije nekog znaka
so = {"=": "OP_PRIDRUZI",
      "+": "OP_PLUS",
      "-": "OP_MINUS",
      "*": "OP_PUTA",
      "/": "OP_DIJELI",
      "(": "L_ZAGRADA",
      ")": "D_ZAGRADA"}

kr = {"za": "KR_ZA",
      "od": "KR_OD",
      "do": "KR_DO",
      "az": "KR_AZ"}

# ako uocimo dva operatora dijeli zaredom
# treba skuziti da je to komentar
# posto citamo jedan po jedan znak
# mozda da citamo vise znakova i onda na temelju tog prefiksa skuzimo cemu pripada

# ideja citaj sve ulazne znakove sa ulaza jen po jen
# spremati to u neki niz


def print_line(idn, row, eval_line):
    print(f"{idn} {row} {eval_line.strip()}")


def check_broj(word):
    try:
        int(word)
        return 1
    except ValueError:
        return 0


lines = []
while True:
    try:
        line = input()
        if line:
            lines.append(line)
        else:
            break
    except EOFError:
        break

row_count = 1
for line in lines:
    line = line.split("//")[0].strip()  # removing the comments
    # print(line)
    words = line.split(" ")

    eval_line = ""
    for word in words:
        word = word.strip()
        # print(word)
        if word in kr:
            # ako je jedna od kljucnih rijeci
            print_line(kr[word], row_count, word)
            eval_line = ""
        else:
            # treba slijedno prolaziti znak po znak
            # dok se nedodje do nekog posebnog charactera
            for char in word:
                if char in so:
                    # trebas provjeriti sta je prije tog znaka
                    if check_broj(eval_line):
                        print_line("BROJ", row_count, eval_line)
                        eval_line = ""
                    elif eval_line and not eval_line[0].isdigit():
                        # ako prvi znak nije brojka onda je rijec
                        print_line("IDN", row_count, eval_line)
                        eval_line = ""
                    print_line(so[char], row_count, char)
                    eval_line = ""
                else:
                    eval_line += char

            # kada dodjemo do kraja niza
            if eval_line:
                if check_broj(eval_line):
                    print_line("BROJ", row_count, eval_line)
                    eval_line = ""
                elif not eval_line[0].isdigit():
                    # ako prvi znak nije brojka onda je rijec
                    print_line("IDN", row_count, eval_line)
                    eval_line = ""
                else:
                    print(f"Greska oko {eval_line} na liniji {row_count}")

    row_count += 1
