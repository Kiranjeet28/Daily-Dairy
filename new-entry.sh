#!/bin/bash

# Get today's date components
TODAY=$(date +%F)                     # YYYY-MM-DD
DAY_NUM=$(date +%-d)                  # D (no leading zero)
LONG_DATE=$(date +"%d %B %Y")         # DD Month YYYY
FILE_NAME="_posts/${TODAY}-day-${DAY_NUM}.md"
POST_TITLE="Day ${DAY_NUM} - ${LONG_DATE}"
POST_URL="${TODAY}-day-${DAY_NUM}.html"

# Check if file already exists
if [ -f "$FILE_NAME" ]; then
  echo "❌ Entry for today already exists: $FILE_NAME"
  exit 1
fi

# Create new post
cat <<EOF > $FILE_NAME
---
title: "${POST_TITLE}"
date: ${TODAY}
---

## ✅ Tasks Done

1. Had a meeting with boss to learn about testing and related topics.
2. MOM:
  - Testing & reviews of 4 July 2025.
3. State changes in the buttons of Portfolio:
  - a) "Make it yours" should be shown until no data is added in portfolio. ✔️
  - b) "Save Changes" & "Discard Changes" should appear when changes are made in the portfolio. ✔️
  - c) "Preview" button to view current changes in the portfolio.
4. Published working changes.
5. Corrected the URL while editing. ✔️
6. Save every state of the published portfolio.
7. Routing changes:
  - 1. If portfolio has data, route to `/dashboard/main`.
  - 2. Published portfolio routes to the link of the published portfolio. ✔️
EOF

echo "✅ Created new diary entry: $FILE_NAME"

# Check if link already exists
if grep -q "${POST_URL}" "$README_FILE"; then
  echo "ℹ️ Link already exists in README.md"
else
  echo "$LINK_LINE" >> "$README_FILE"
  echo "📌 Added link to README.md"
fi

#  Git commands (optional - uncomment to automate)
 git add .
 git commit -m "Added diary entry for $LONG_DATE"
 git push origin main
