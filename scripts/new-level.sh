#!/usr/bin/env bash

show_help() {
cat << EOF
OverTheWire Level Generator

Usage:
  $0 <Game> <Level>
  $0 <Game> <Start-End>

Examples:
  $0 Bandit 00
  $0 Bandit 05
  $0 Bandit 00-34
  $0 Natas 00-10

Options:
  -h, --help    Show this help message
EOF
}

create_level() {

    local GAME="$1"
    local LEVEL="$2"

    local LEVEL_NUM=$((10#$LEVEL))
    local NEXT_NUM=$((LEVEL_NUM + 1))

    local LEVEL_PADDED
    local NEXT_PADDED

    LEVEL_PADDED=$(printf "%02d" "$LEVEL_NUM")
    NEXT_PADDED=$(printf "%02d" "$NEXT_NUM")

    local FILE="$GAME/Levels/Level-$LEVEL_PADDED.md"

    if [[ -f "$FILE" ]]; then
        echo "[SKIP] $FILE already exists"
        return
    fi

    cat > "$FILE" << EOF
# $GAME Level $LEVEL_PADDED → $NEXT_PADDED

**Date:** $(date +%F)

**Status:** ⏳ Stuck

---

## Connection

\`\`\`bash
ssh ${GAME,,}$LEVEL_NUM@${GAME,,}.labs.overthewire.org
\`\`\`

---

## Level Goal

Paste the official level description here.

---

## Commands / Solution

\`\`\`bash
# Working commands used to solve the level
\`\`\`

---

## Key Learnings

- Main concept learned:
- Important flags / tricks:
- Common mistake to avoid:

---

## Password for Next Level

\`\`\`text
paste-password-here
\`\`\`

---

## Notes / Tips

- Extra observations
- Related commands to explore later

---

## Links

- [[Linux-Commands-Cheatsheet]]
EOF

    echo "[OK] Created $FILE"
}

# Help

case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
esac

GAME="$1"
TARGET="$2"

if [[ -z "$GAME" || -z "$TARGET" ]]; then
    show_help
    exit 1
fi

# Range mode (00-34)

if [[ "$TARGET" =~ ^([0-9]{2})-([0-9]{2})$ ]]; then

    START="${BASH_REMATCH[1]}"
    END="${BASH_REMATCH[2]}"

    for ((i=10#$START; i<=10#$END; i++)); do
        create_level "$GAME" "$(printf "%02d" "$i")"
    done

# Single level mode

elif [[ "$TARGET" =~ ^[0-9]{2}$ ]]; then

    create_level "$GAME" "$TARGET"

else
    echo "Invalid level format."
    echo "Use: 00 or 00-34"
    exit 1
fi

