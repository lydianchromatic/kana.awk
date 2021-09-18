#
# convert romaji into hiragana and katakana.
#

BEGIN {
  # slurp the kana into associative arrays
  while (getline < ARGV[1] > 0) {
    hiragana[$1] = $2
    katakana[$1] = $3
    regex = (regex ? (regex "|" "(" $1 ")") : "(" $1 ")")
  }

  # shift ARGV
  for (i = 2; i < ARGC; i++) {
    ARGV[i-1] = ARGV[i]
  }
  ARGC--
}

{
    # split the string into fields
    gsub(regex, "& ", $0)

    romaji_length = split($0, romaji) 

    # print the hiragana
    for (i = 0; i <= romaji_length; i++) {
      printf("%s", hiragana[romaji[i]])
    }

    printf "\n"

    # print the katakana
    for (i = 0; i <= romaji_length; i++) {
      printf("%s", katakana[romaji[i]])
    }

    printf "\n"
    printf "\n"
}
