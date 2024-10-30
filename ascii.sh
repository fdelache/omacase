ascii_art='
   ____
  / __ \____ ___  ____ __________ _________
 / / / / __ `__ \/ __ `/ ___/ __ `/ ___/ _ \
/ /_/ / / / / / / /_/ / /__/ /_/ (__  )  __/
\____/_/ /_/ /_/\__,_/\___/\__,_/____/\___/
'

# Define the color gradient (shades of cyan and blue)
colors=(
  '\033[38;5;81m' # Cyan
  '\033[38;5;75m' # Light Blue
  '\033[38;5;69m' # Sky Blue
  '\033[38;5;63m' # Dodger Blue
  '\033[38;5;57m' # Deep Sky Blue
  '\033[38;5;51m' # Cornflower Blue
  '\033[38;5;45m' # Royal Blue
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -A lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in {1..${#lines[@]}}; do
  color_index=$(( (i - 1) % ${#colors[@]} ))  # Adjusting index for 1-based loop
  echo "${colors[color_index]}${lines[i-1]}"  # Adjusting for 0-based index in lines
done
